extends Node2D

var pointcount=0
var barlength=0
var forceapplied=0
var maxdrop=0
var centerpoints=[]
var left=[]
var right=[]
var center=[]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	forceapplied=get_node('force').value
	pointcount=get_node("dynamicpointscount").value
	barlength=get_node("barlen").value
	maxdrop=(0.4*barlength +1.4)*(((pointcount-1)/2)+1)
	if int(pointcount)%2==1:
		get_node("staticpoint").position.x=-barlength*(pointcount+1)
	
		get_node("staticpoint2").position.x=-get_node("staticpoint").position.x
	else:
		get_node("staticpoint").position.x=(-barlength*(pointcount+1))
		
		get_node("staticpoint2").position.x=-get_node("staticpoint").position.x
	if len(centerpoints)<pointcount:
		var point=load('res://ropetest/dynamicpoint.tscn')
		var newpoint=point.instantiate()
		newpoint.scale=Vector2(3,3)
		add_child(newpoint)
		centerpoints.append(newpoint)
		pointmap()
	elif len(centerpoints)>pointcount:
		centerpoints[0].queue_free()
		centerpoints.pop_at(0)
		pointmap()
		
	#droop
	if len(center)>0:
		center[0].position=Vector2(0,forceCalculate(barlength,pointcount)*forceapplied)
		var count=1
		for i in right:
			i.position.y=forceCalculate(barlength,count)*forceapplied
			count+=2
		count=1
		for i in left:
			i.position.y=forceCalculate(barlength,count)*forceapplied
			count+=2
	else:
		var count=pointcount-1
		var driftmultiplier=0.0
	
		count=1
		for i in right:
			i.position.y=0.4+forceCalculate(barlength,count)*forceapplied
			
			count+=2
		count=1
		for i in left:
			#i.position.x=((barlength*count)+(i.position.y*forceapplied))
			i.position.y=0.4+forceCalculate(barlength,count)*forceapplied
			count+=2
func pointmap():
	print('hello')
	for i in centerpoints:
		i.get_node('bar').size.x=(barlength/200)*160
	left=[]
	right=[]
	center=[]
	if len(centerpoints)%2==0:
		var count=1
		for i in centerpoints:
			if count<=len(centerpoints)/2:
				left.append(i)
			else:
				right.append(i)
			count+=1
		count=pointcount-1
		for i in left:
			i.position.y=0
			i.position.x=-barlength*count
			count-=2
		count=0
		for i in right:
			i.position.y=0
			i.position.x=-left[count].position.x
			count+=1
	else:
		var count=1
		for i in centerpoints:
			#print(count-1,len(centerpoints)/2)
			
			if count-1==len(centerpoints)/2:
				center.append(i)
			elif count<=len(centerpoints)/2:
				left.append(i)
			elif count>len(centerpoints)/2:
				right.append(i)
			count+=1
		print(len(center)+len(right)+len(left))
		print(len(centerpoints))
		center[0].position=Vector2(0,0)
		count=pointcount-1
		for i in left:
			i.position.y=0
			i.position.x=-barlength*count
			count-=2
		count=0
		for i in right:
			i.position.y=0
			i.position.x=-left[count].position.x
			count+=1
		
		
	
	





func _on_barlen_value_changed(value):
	pointmap()
func forceCalculate(bar,point):
	var drop=(0.4*bar +1.4)*(((point-1)/2)+1)
	return(drop)
func xshift(bar,point):
	return((-bar*point))
