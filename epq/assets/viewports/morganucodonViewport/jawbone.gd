extends Marker3D

var selected=false
var hover=false
signal select
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Area3D/clicked").visible=selected
	if hover and Input.is_action_just_pressed("leftclick"):
		emit_signal("select")
		selected=true
	elif Input.is_action_just_pressed("leftclick"):
		emit_signal("select")
		selected=false
	if  selected:
		look_at(get_parent().get_node('jawbone_pointer').position,Vector3(0,1,0))


func _on_area_3d_mouse_entered():
	hover=true

func _on_area_3d_mouse_exited():
	hover=false
