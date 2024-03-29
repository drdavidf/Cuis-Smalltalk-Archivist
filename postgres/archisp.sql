/*

The stored procedure interface for the versioned object service.

*/

CREATE OR REPLACE PROCEDURE new_root(_oid integer, _name text)
LANGUAGE plpgsql
AS $$
DECLARE
-- variable declaration
BEGIN
INSERT INTO root (oid, name) VALUES (_oid, _name);
END; $$

;

CREATE OR REPLACE FUNCTION conflicts(_entities json) RETURNS TABLE(oid int, rid int, head int)
AS $$
	SELECT j.oid, j.rid, vobject.head FROM (SELECT (value -> 'oid')::int as oid , (value -> 'rid')::int as rid FROM jsonb_array_elements(to_jsonb(_entities))) AS j JOIN vobject ON j.oid = vobject.oid WHERE j.oid > 0 AND j.rid < vobject.head $$
LANGUAGE SQL ;

;

CREATE OR REPLACE PROCEDURE new_changeset(_comment text, _entities json, OUT _max_oid integer)
LANGUAGE plpgsql
AS $$
DECLARE
_has_conflicts integer;
_max_cid integer;
_cid integer;
_entity json;
_author text;
BEGIN

-- first ensure that we are not running over later changes.

_has_conflicts := 0;

SELECT COUNT(*) FROM conflicts(_entities) INTO _has_conflicts;

IF _has_conflicts > 0 THEN
	RAISE EXCEPTION 'could not commit changeset'
	USING HINT = 'Some objects in the changeset have a more recent version.  Merge them before attempting to commit again.';
END IF;

SELECT CURRENT_ROLE INTO _author;

SELECT MAX(cid) from changeset INTO _max_cid ;

IF _max_cid IS NULL THEN
	_max_cid := 0 ;
END IF;

_cid := _max_cid + 1;

INSERT INTO changeset (time,cid,author,comment) VALUES(current_timestamp, _cid, _author, _comment) ;

SELECT MAX(oid) from vobject INTO _max_oid;

IF _max_oid IS NULL THEN
	_max_oid := 0 ;
END IF;

FOR _entity IN SELECT * FROM json_array_elements(_entities)
LOOP
	call change_entity(_cid, _entity, _max_oid);
END LOOP;

END; $$

;

CREATE OR REPLACE PROCEDURE change_entity(_cid integer, _entity json, _max_oid integer)
LANGUAGE plpgsql
AS $$
DECLARE
_oid integer;
_head integer;
_slots json;
_links jsonb;
_link jsonb;
_description text;
BEGIN

-- locate the vobject and create it if necessary

_oid := _entity -> 'oid';

IF _oid < 0 THEN -- this is a new object, create it and give it a proepr identifier
	_oid := _oid * -1 + _max_oid;
	INSERT INTO vobject (oid,head) VALUES(_oid, 0);
END IF ;

SELECT head from vobject INTO _head WHERE oid = _oid; 

IF _head IS NULL THEN 
	RAISE EXCEPTION 'No object with oid --> %', _oid ;
END IF ;

-- add a new revision    

_slots := _entity -> 'slots';

_description := _entity ->> 'description';

INSERT INTO revision (cid,oid,rid,slots,description) VALUES(_cid, _oid, _head+1, _slots, _description); 

-- update the links

_links := _entity -> 'links';

FOR _link IN SELECT * FROM jsonb_array_elements(_links)
LOOP
	CALL change_link(_cid, _oid, _head + 1, _link, _max_oid);
END LOOP;

-- finally, increment the head revision identifier

UPDATE vobject SET head = _head + 1 WHERE oid = _oid;
	
END; $$

;

CREATE OR REPLACE PROCEDURE change_link(_cid integer, _oid integer, _rid integer, _link jsonb, _max_oid integer)
LANGUAGE plpgsql
AS $$
DECLARE
	_trgt_oid integer; 
	_name text; 
BEGIN

-- we assume that the source for the link exists in the vobject table.

ASSERT _oid > 0;

_trgt_oid := _link -> 'target';
_name := _link ->> 'name';

IF _trgt_oid = 0 THEN
	_trgt_oid := NULL ;
END IF ;

IF _trgt_oid < 0 THEN
	_trgt_oid := _trgt_oid * -1 + _max_oid;
END IF ;

INSERT INTO link (cid,oid,rid,oidtarget,name) VALUES(_cid, _oid, _rid,_trgt_oid,_name); 

END; $$

;

/* answer the latest revision of a versioned object */ 

CREATE OR REPLACE FUNCTION checkout_vobject(_oid integer) RETURNS SETOF revision
AS $$
SELECT revision.* FROM revision JOIN vobject ON revision.oid = vobject.oid AND vobject.head = revision.rid WHERE revision.oid = _oid; 
$$ LANGUAGE SQL ;

/* answer a specific revision of a versioned object */

CREATE OR REPLACE FUNCTION checkout_vobject_version(_oid integer, _rid integer) RETURNS SETOF revision
AS $$
SELECT * FROM revision WHERE oid = _oid AND rid = _rid; 
$$ LANGUAGE SQL ;

/* answer the latest revision of the links of a versioned object (without resolving the links) */

CREATE OR REPLACE FUNCTION checkout_links(_oid integer) RETURNS SETOF link
AS $$

SELECT link.* FROM link JOIN vobject ON vobject.oid = link.oid AND link.rid = vobject.head WHERE link.oid = _oid OR link.oidtarget = _oid;

$$ LANGUAGE SQL ;

/* answer a specific revision of the links of a versioned object (without resolving the links) */

CREATE OR REPLACE FUNCTION checkout_links_version(_oid integer, _rid integer) RETURNS SETOF link
AS $$

SELECT * FROM link WHERE oid = _oid AND rid = _rid;

$$ LANGUAGE SQL ;

/* answer all the oids of objects that were modified after a certain timestamp */

CREATE OR REPLACE FUNCTION objects_modified_since(_t timestamp) RETURNS TABLE(oid int) 
AS $$
SELECT DISTINCT revision.oid FROM revision JOIN changeset ON revision.cid = changeset.cid where time > _t ;
$$ LANGUAGE SQL ;

CREATE OR REPLACE PROCEDURE initialize()
LANGUAGE plpgsql
AS $$
BEGIN
	DELETE FROM global;
	DELETE FROM link;
	DELETE FROM revision;
	DELETE FROM changeset;
	DELETE FROM vobject;
END ; $$
;

