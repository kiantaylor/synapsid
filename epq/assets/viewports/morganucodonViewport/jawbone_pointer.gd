extends Marker3D

var active=false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active and Input.is_action_pressed("leftclick"):
		if position.y<0.31 and position.y>-0.47:
			position.y=lerp(position.y,get_parent().get_node('point').position.y,delta*2)
		else:
			position.y=lerp(position.y,0.0,delta*3)


func _on_jawbone_select():
	active=not active
