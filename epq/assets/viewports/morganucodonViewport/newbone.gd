extends Marker3D
var rootnode=null
var hover=false
var readyup=false
var selected=false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
		if Input.is_action_just_pressed("leftclick") and hover:
			print('click')
		
			selected=true
		elif Input.is_action_just_pressed("leftclick"):
			selected=false
		if selected:
			if Input.is_action_pressed("bonedown"):
				rotate_x(-0.05)
			elif Input.is_action_pressed("boneup"):
				rotate_x(0.05)
	




func _on_morganucodon_viewport_declare(node):
	rootnode=node
	print('yh')
	readyup=true


func _on_area_3d_mouse_entered():
	hover =true
	print('hover',name,hover)



func _on_area_3d_mouse_exited():
	hover =false
	print('hover',name)


func _on_area_3d_2_mouse_entered():
	pass # Replace with function body.
