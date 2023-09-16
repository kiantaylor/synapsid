extends Node3D

var pivotRotationy=PI/2.0
var pivotRotationx=0.0
var campos=1.9
var camRotationPos=Vector3()
var mouse=Vector2()
var rotateMouse=Vector3(0,0,0)
var pointerRotation=Vector3(0,0,0)
var selectedbone=null
signal declare(node)
signal clearHover(ignore)
# Called when the node enters the scene tree for the first time.
func _ready():
	
	emit_signal("declare",self)
	get_node("AnimationPlayer").play('startup')

		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if selectedbone!=null:
		if selectedbone.name[0]=='v':
			
			if Input.is_action_pressed("bonedown"):
				selectedbone.rotate_x(-0.025)
			elif Input.is_action_pressed("boneup"):
				selectedbone.rotate_x(0.025)
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


