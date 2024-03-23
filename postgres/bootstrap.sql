
START TRANSACTION;

call new_changeset('bootstrap the object system','[{"oid":-1,"slots":{}, "description":"<?xml version=\"1.0\" encoding=\"UTF-8\"?><body><text></text><annotations></annotations></body>", "links":[]}, {"oid":-2,"slots":{}, "description":"<?xml version=\"1.0\" encoding=\"UTF-8\"?><body><text>Class&#10;&#10;The initial object from which all other objects are ultimately cloned. This is the prototype of all top level class objects.</text><annotations></annotations></body>", "links":[]},{"oid":-3,"slots":{}, "description":"<?xml version=\"1.0\" encoding=\"UTF-8\"?><body><text>Enumeration&#10;&#10;The prototype of all enumeration objects.</text><annotations></annotations></body>", "links":[]}]', NULL);

call new_changeset('add the class and enumeration objects to the global namespace','[{"oid":1,"slots":{}, "description":"<?xml verions=\"1.0\" encoding=\"UTF-8\"?><body><text>This is the global namespace.</text><annotations></annotations></body>", "links":[{"target":2, "name":"Class"},{"target":3, "name":"Enumeration"}]}]', NULL);

COMMIT;
