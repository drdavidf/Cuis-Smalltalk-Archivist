/*

A changeset is a sequence of changes. each change has three parts:

oid 			an integer
description 	text
slots 			a dictionary
links 			a sequence of link changes

A link change has the following parts:

target 			an integer
name 			a text

This test case creates the data for the following scenario:

change set 1:

three objects (oids): 1,2,3

*/

call new_changeset('Alice comments', 
'[
	{"oid":-1,"description":"My favorite color", "slots":{"color":"red"}, "links":[]},
	{"oid":-2,"description":"The color of sky", "slots":{"color":"light blue"},"links":[]},
	{"oid":-3,"description":"Sun sun sun here it comes", "slots":{"color":"yellow"},"links":[]}
]', NULL);

/*
change set 2:

object 1 adds two links, 'a' points to 2, 'b' points to obj 3.
*/

call new_changeset('Bob adds links', 
'[
	{"oid":1,"description":"My favorite color", "slots":{"color":"red"}, "links":[{"target":2,"name":"a"}, {"target":3,"name":"b"}]}
]', NULL);

/*
change set 3:

object 1 deletes link 'a'
*/

call new_changeset('Bob deletes a link', 
'[
	{"oid":1,"description":"My favorite color", "slots":{"color":"red"}, "links":[{"target":0,"name":"a"}, {"target":3,"name":"b"}]}
]', NULL);


/*
change set 4:

object 2 adds a link 'u' that points to obj 3.

*/

call new_changeset('Bob adds links', 
'[
	{"oid":2,"description":"The color of sky", "slots":{"color":"light blue"},"links":[{"target":3, "name":"u"}]}
]', NULL);

