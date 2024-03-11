
sig Name { }

sig OID {}

sig VObj {
	
	oid : OID ,

	exit : Name -> lone VObj ,
	
	enter : VObj,

	store : Store
}

sig Store {

	objs : set VObj
}


pred invariant {

	store = ~objs

	all x,y : VObj | x.store = y.store => (x = y or x.oid != y.oid)

	all s , t : VObj | t in s.exit[Name] iff s in t.enter

	all x, y : Store | x != y => no x.objs & y.objs

	all x, y : VObj | x in y.enter => x.store = y.store
}

fact {

	invariant

}

run {} 

run { 
	some x, y : VObj | x != y and x.oid = y.oid
}

pred consistent[x : Store, y :Store]
{
	all u : x.objs | some v : y.objs | u.oid = v.oid

	all u,v : x.objs , n : Name | u in v.exit[n] => 
		(some u2,v2 : y.objs | u.oid = u2.oid and v.oid =v2.oid and u2 in v2.exit[n])
}

run {
	#Store = 2 
	
	some x,y :Store | 0 < #x.objs and #x.objs < #y.objs and consistent[x,y]
}
