extends CharacterBody2D
var speed=0
var targetrotation=0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('ui_left'):
		targetrotation-=0.7
		
	if Input.is_action_pressed('ui_right'):
		targetrotation+=0.7
	if Input.is_action_pressed('ui_up'):
		speed=200
		
	elif Input.is_action_pressed('ui_down'):
		speed=-200
	else:
		speed=0
	
	rotation_degrees=lerp(rotation_degrees,targetrotation,delta*1.5)
	velocity=Vector2(speed,0).rotated(rotation)
	move_and_slide()
