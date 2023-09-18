extends Marker3D
var rootnode=null
var parent1
var hover=false
var readyup=false
var selected=false
var labelbox
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
		if Input.is_action_just_pressed("leftclick") and hover:
			parent1=get_parent()
			while parent1.name!="morganucodonViewport":
				parent1=parent1.get_parent()
			if has_meta('description'):
				if not parent1.dialogue:
					parent1.get_node('AnimationPlayer').play('dialogue')
					parent1.dialogue=true
				print('meta')
				parent1.get_node('namebox/description').text=get_meta('description')
			else:
				if parent1.dialogue:
					parent1.dialogue=false
					parent1.get_node('AnimationPlayer').play_backwards('dialogue')
			if has_meta('displayName'):
				print('meta')
				parent1.get_node('namebox/name').text=get_meta('displayName')
			
		
			selected=true
			get_child(0).set_surface_override_material(0,load("res://glow.tres"))
		elif Input.is_action_just_pressed("leftclick") and selected:
			selected=false
			parent1=get_parent()
			while parent1.name!="morganucodonViewport":
				parent1=parent1.get_parent()
			get_child(0).set_surface_override_material(0,load("res://bone.tres"))
		if selected:
			if Input.is_action_pressed("bonedown"):
				rotate_x(-0.05)
			elif Input.is_action_pressed("boneup"):
				rotate_x(0.05)
			if Input.is_action_pressed("a"):
				position.z+=0.005
			elif Input.is_action_pressed("d"):
				position.z-=0.005
#




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
