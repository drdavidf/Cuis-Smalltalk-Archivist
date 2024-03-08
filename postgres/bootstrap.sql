
START TRANSACTION;

call new_changeset('bootstrap the object system','[{"oid":-1,"slots":{}, "description":"", "links":[]}, {"oid":-2,"slots":{}, "description":"Class\n\nI am the initial object from which all other objects are ultimately cloned. I am the prototype of all top level class objects.", "links":[]}]', NULL);

call new_changeset('add the class object to the global namespace','[{"oid":1,"slots":{}, "description":"This is the global namespace.", "links":[{"target":2, "name":"Class"}]}]', NULL);

COMMIT;
