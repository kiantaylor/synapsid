extends Marker3D
var hover=false
var clicked=false
var pointerPos=Vector3(0,0.032,-1.253)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _input(event):
	if event is InputEventMouseMotion and clicked:
		pointerPos.y+=event.relative.y*-0.05

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hover and Input.is_action_just_pressed("leftclick"):
		clicked=true
	
	if clicked and Input.is_action_just_released("leftclick"):
		clicked=false
	look_at(get_parent().get_node("jawPointer").position,Vector3(0,1,0))
	get_parent().get_node("jawPointer").position=lerp(get_parent().get_node("jawPointer").position,pointerPos,delta*2)
func _on_jawclick_mouse_entered():
	hover=true


func _on_jawclick_mouse_exited():
	hover=false
