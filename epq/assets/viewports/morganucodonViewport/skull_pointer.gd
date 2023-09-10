extends Marker3D

var masterbone
var targetbone
var mapindex
var point
var forward=true
var back=false
var backpos=Vector3()
# Called when the node enters the scene tree for the first time.
func _ready():
	mapindex=get_parent().get_node('map').map.find(name)
	point=get_parent().get_node('point')
	masterbone=get_parent().get_node(get_parent().get_node('map').map[mapindex-1])
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var zdistance2=position.z-masterbone.position.z
	var ydistance2=position.y-masterbone.position.y
	var hypotenuse2=sqrt(zdistance2**2+ydistance2**2)
	#print(hypotenuse2)
	if get_parent().selectedbone==masterbone and hypotenuse2<1.8 and not back:
		position.z=lerp(position.z,point.position.z,delta*3)
		position.y=lerp(position.y,point.position.y,delta*3)
		backpos=position
	elif get_parent().selectedbone==masterbone :
		back =true
		position.z=lerp(position.z,backpos.z*0.9,delta*3)
		position.y=lerp(position.y,backpos.y*0.9,delta*3)
		print(position,'    ',backpos)
	if position>=backpos*0.95 and  back:
		print('yop')
		back=false
		forward=true
	
	
