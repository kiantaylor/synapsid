extends Node3D
var nextScene=''
var started=false
var plynthx=0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimationPlayer").play('startup')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if started:
		get_node("plynths").position.x=lerp(get_node('plynths').position.x,plynthx,delta*1.6)
		if Input.is_action_just_pressed("ui_left"):
			get_node("AnimationPlayer").play('cameraSwitchL')
		if Input.is_action_just_pressed("ui_right"):
			get_node("AnimationPlayer").play('cameraSwitchR')

func _on_animation_player_animation_finished(anim_name):
	if anim_name=='startup':
		started=true
	
	if anim_name=='cameraSwitchL':
		plynthx+=20
		print(plynthx)
	elif anim_name=='cameraSwitchR':
		plynthx-=20#
		print(plynthx)
	if anim_name=='zoom':
		get_tree().change_scene_to_file(nextScene)
