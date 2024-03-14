
sig Obj {

	var enter : set Obj,
	var leave : set Obj
}

pred invariant  {

	all x, y : Obj | x in y.enter iff y in x.leave
}

pred init
{
	all obj : Obj | no obj.enter and no obj.leave
}

pred link[src,dst:Obj]
{
	src.leave' = src.leave + dst
	dst.enter' = dst.enter + src

	all obj : Obj - src | obj.leave' = obj.leave
	all obj : Obj - dst | obj.enter' = obj.enter
}

pred unlink[src,dst:Obj]
{
	src.leave' = src.leave - dst
	dst.enter' = dst.enter - src

	all obj : Obj - src | obj.leave' = obj.leave
	all obj : Obj - dst | obj.enter' = obj.enter
}


check {
	always ((invariant and some x,y:Obj | link[x,y]) => after invariant)
}

check {
	always ((invariant and some x,y:Obj | unlink[x,y]) => after invariant)
}

check {
	init => invariant
}


