extends Marker3D

var masterbone
var mapindex
var targetbone
var hover=false
var select=false
signal selected(node)
signal hovered(node)
# Called when the node enters the scene tree for the first time.
func _ready():
	
	mapindex=get_parent().get_node('map').map.find(name)

	masterbone=get_parent().get_node(get_parent().get_node('map').map[mapindex-1])
	targetbone=get_parent().get_node(get_parent().get_node('map').map[mapindex+1])
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if hover and not select and Input.is_action_just_pressed("leftclick"):
		select=true
		emit_signal('selected',self)
		get_node("selectglow").visible=hover
	if select and not hover and Input.is_action_just_pressed("leftclick"):
		select=false
		emit_signal('selected',null)
		get_node("selectglow").visible=hover
	var zdistance=position.z-targetbone.position.z
	var ydistance=position.y-targetbone.position.y
	var hypotenuse=sqrt(zdistance**2+ydistance**2)
	var zdistance2=position.z-masterbone.position.z
	var ydistance2=position.y-masterbone.position.y
	var hypotenuse2=sqrt(zdistance2**2+ydistance2**2)
	if hypotenuse>float(get_node('length').text)+0.2 and hypotenuse2<float(masterbone.get_node('length').text)+0.3:
		
		position.z=lerp(position.z,targetbone.position.z,delta*2)
		position.y=lerp(position.y,targetbone.position.y,delta*2)
#	elif hypotenuse>float(get_node('length').text)+0.2:
#		position.z=lerp(position.z,masterbone.position.z,delta*2)
#		position.y=lerp(position.y,masterbone.position.y,delta*2)
	if zdistance>0 :
		look_at(targetbone.position)
	
	
	


func _on_mousesense_mouse_entered():
	hover=true
	get_node("hoverglow").visible=hover
	emit_signal('hovered',self)


func _on_mousesense_mouse_exited():
	
	hover=false
	get_node("hoverglow").visible=hover

func _on_morganucodon_viewport_clear_hover(ignore):
	if self !=ignore:
		hover=false
		get_node("hoverglow").visible=hover
