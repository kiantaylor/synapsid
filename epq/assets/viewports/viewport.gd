extends Node3D

var pivotRotationy=0.0
var pivotRotationx=0.0
var campos=1.9
var camRotationPos=Vector3()
var mouse=Vector2()
var rotateMouse=Vector3(0,0,0)
var pointerRotation=Vector3(0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimationPlayer").play('startup')

func _input(event):
	if event is InputEventMouseMotion:
		mouse=event.position
		mouse.y-=648
		mouse.y/=-1906
		mouse.x-=1152
		mouse.x/=3491
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#3d cursor
	camRotationPos=get_node("pivot/Camera3D").position.rotated(Vector3(1,0,0),get_node('pivot').rotation.x)
	camRotationPos=camRotationPos.rotated(Vector3(0,1,0),get_node('pivot').rotation.y)
	camRotationPos=camRotationPos.rotated(Vector3(0,0,1),get_node('pivot').rotation.z)
	rotateMouse.x=mouse.x
	rotateMouse.y=mouse.y
	#print(rotateMouse,'beforerotate')
	rotateMouse=rotateMouse.rotated(Vector3(1,0,0),get_node('pivot').rotation.x)
	rotateMouse=rotateMouse.rotated(Vector3(0,1,0),get_node('pivot').rotation.y)
	rotateMouse=rotateMouse.rotated(Vector3(0,0,1),get_node('pivot').rotation.z)
	#print(rotateMouse,'after rotate')
	get_node("3dcursor").position=camRotationPos+rotateMouse
	pointerRotation.y=lerp(0.925,-0.925,(mouse.x+0.33)/0.66)
	pointerRotation.x=lerp(-0.401,0.401,(mouse.y+0.34)/0.68)
	get_node('3dcursor').rotation=get_node("pivot").rotation+pointerRotation
	if get_node("3dcursor/RayCast3D").is_colliding():
		get_node('point').position=get_node("3dcursor/RayCast3D").get_collision_point()
#	var camPoint=Vector3()
#	camPointcamPoint=get_node('point').position.rotated(Vector3(1,0,0),get_node('pivot').rotation.x)
#	camPoint=camPoint.rotated(Vector3(0,1,0),get_node('pivot').rotation.y)
#	camPoint=camPoint.rotated(Vector3(0,0,1),get_node('pivot').rotation.z)
#	get_node("pivot/Area3D").position=
	get_node("Area3D").rotation=get_node('pivot').rotation
	if not Input.is_action_pressed("leftclick"):
		get_node("Area3D").position=get_node('point').position
		get_node("Area3D/CollisionShape3D").disabled=true
	else:
		
		get_node("Area3D/CollisionShape3D").disabled=false
	
	
	# other stuff 
	get_node('pivot').rotation.y=lerp(get_node('pivot').rotation.y,pivotRotationy,delta)
	get_node('pivot').rotation.x=lerp(get_node('pivot').rotation.x,pivotRotationx,delta)
	get_node("pivot/Camera3D").position.z=lerp(get_node("pivot/Camera3D").position.z,campos,delta)
	if Input.is_action_pressed('ui_left'):
		pivotRotationy-=0.05
	if Input.is_action_pressed('ui_right'):
		pivotRotationy+=0.05
	
	if Input.is_action_pressed('ui_down'):
		pivotRotationx+=0.05
	if Input.is_action_pressed('ui_up'):
		pivotRotationx-=0.05
	if Input.is_action_just_released("scrollDown"):
		campos+=0.2
	if Input.is_action_just_released("scrollUp"):
		campos-=0.2
	if campos<0.9:
		campos+=0.3
	elif campos>6:
		campos-=0.3
