extends Node3D
signal camready

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("camerapivot/Camera3D").current=true
func _input(event):
	if event is InputEventMouseMotion:
		print(event.position.x)
		get_node("camerapivot/Camera3D/MeshInstance3D").position.x=(event.position.x-566)/100
		get_node("camerapivot/Camera3D/MeshInstance3D").position.y=-(event.position.y-300)/100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	

	if Input.is_action_pressed("ui_left"):
		get_node("camerapivot").rotate_y(-0.1)
	elif Input.is_action_pressed("ui_right"):
		get_node("camerapivot").rotate_y(0.1)
	if Input.is_action_pressed("ui_down"):
		get_node("camerapivot").rotate_z(-0.1)
	elif Input.is_action_pressed("ui_up"):
		get_node("camerapivot").rotate_z(0.1)


func _on_animation_player_animation_finished(anim_name):
	if anim_name=='fovswitch':
		get_node("camerapivot/Camera3D").current=false
		emit_signal("camready")
