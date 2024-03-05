DROP TABLE changeset CASCADE;
DROP TABLE vobject CASCADE;
DROP TABLE revision CASCADE;
DROP TABLE link CASCADE;

CREATE TABLE changeset (
	time timestamp,
	author text,
	comment text,
	cid SERIAL PRIMARY KEY
);

CREATE TABLE vobject (
	oid serial PRIMARY KEY,
	head integer
);

CREATE TABLE revision (
	cid integer REFERENCES changeset(cid),
	oid integer REFERENCES vobject(oid),
	rid integer, 

	slots jsonb,
	description text,

	PRIMARY KEY (oid,rid),
	UNIQUE (cid, oid)
);

CREATE TABLE link (
	cid integer REFERENCES changeset(cid),
	oid integer REFERENCES vobject(oid),
	rid integer,

	oidtarget integer ,
	name text ,

	FOREIGN KEY (oidtarget) REFERENCES vobject(oid),

	PRIMARY KEY (oid, rid, name),
	UNIQUE (cid, oid, name)
);

CREATE TABLE global (
	oid integer REFERENCES vobject (oid),
	name text UNIQUE
);
