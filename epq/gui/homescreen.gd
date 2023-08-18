extends Control

var switching=false
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimationPlayer").play('idle')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and not switching:
		switching=true
		get_node("AnimationPlayer").stop()
		get_node("AnimationPlayer").play('switch')


func _on_animation_player_animation_finished(anim_name):
	if anim_name=='switch':
		get_tree().change_scene_to_file("res://gui/selectscreen.tscn")
