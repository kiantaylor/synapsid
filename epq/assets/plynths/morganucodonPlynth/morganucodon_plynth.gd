extends Marker3D
var scenepath='res://assets/viewports/morganucodonViewport/morganucodon_viewport.tscn'
var hover=false
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimationPlayer").play('idle')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("light").visible=hover
	if hover==true and Input.is_action_just_pressed("leftclick"):
		get_parent().get_parent().nextScene=scenepath
		get_parent().get_parent().get_node('AnimationPlayer').play('zoom')


func _on_clickbox_mouse_entered():
	hover=true
	print('hiih')


func _on_clickbox_mouse_exited():
	hover=false
