
sig Name {}

sig Obj {

	var enter : set Obj,
	var leave : Name -> lone Obj
}

pred invariant  {

	all x, y : Obj | x in y.enter iff y in x.leave[Name]
}

pred init
{
	all obj : Obj | no obj.enter and no obj.leave
}

pred link_last[src,dst:Obj,n:Name]
{
	no m : Name - n | src.leave[m] = src.leave[n]

	src.leave[n].enter' = src.leave[n].enter - src
	src.leave' = src.leave ++ n -> dst
	dst.enter' = dst.enter + src

	all obj : Obj - src | obj.leave' = obj.leave
	all obj : Obj - (dst + src.leave[n]) | obj.enter' = obj.enter
}


check {
	always ((invariant and some x,y:Obj,n:Name | link_last[x,y,n]) =>  after invariant)
}

pred link_not_last[src,dst:Obj,n:Name]
{
	some m : Name - n | src.leave[m] = src.leave[n]

	src.leave' = src.leave ++ n -> dst
	dst.enter' = dst.enter + src

	all obj : Obj - src | obj.leave' = obj.leave
	all obj : Obj - dst | obj.enter' = obj.enter
}

check {
	always ((invariant and some x,y:Obj,n:Name | link_not_last[x,y,n]) =>  after invariant)
}


// there could be multiple links (using different names) to the same destination 
// if this is the last one then remove it from enter, otherwise don't.

pred unlink_last[src,dst:Obj,n:Name]
{
	dst = src.leave[n]
	no m : Name - n | dst = src.leave[m]

	src.leave' = src.leave - n -> dst 
	dst.enter' = dst.enter - src

	all obj : Obj - src | obj.leave' = obj.leave
	all obj : Obj - dst | obj.enter' = obj.enter
}

pred unlink_not_last[src,dst:Obj,n:Name]
{
	dst = src.leave[n]
	some m : Name - n | dst = src.leave[m]

	enter' = enter
	src.leave' = src.leave - n -> dst 

	all obj : Obj - src | obj.leave' = obj.leave
	
}

pred unlink_none[src,dst:Obj,n:Name]
{
	dst != src.leave[n]

	enter' = enter
	leave' = leave

}

pred unlink[src,dst:Obj,n:Name]
{
	unlink_not_last[src,dst,n] or unlink_last[src,dst,n] or unlink_none[src,dst,n]
}

check {
	always ((invariant and some x,y:Obj,n:Name | unlink_last[x,y,n]) => after invariant)
}


check {
	always ((invariant and some x,y:Obj,n:Name | unlink_not_last[x,y,n]) => after invariant)
}
check {
	init => invariant
}


