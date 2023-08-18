extends Node3D
var currenthover=''
var currentclicked=''
var bonemap={
	'll1':"hipjoint/elbow1",
	'll2':"hipjoint2/elbow1",
	'ul1':"hipjoint",
	'ul2':"hipjoint2"
		
}
var direction=1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _input(event):
	if event is InputEventMouseMotion:
		if currentclicked!='':
			if get_node(str(bonemap[currentclicked]+'/mousechecker')).onmouse==false and Input.is_action_pressed("leftclick"):
				get_node(bonemap[currentclicked]).rotate_z(direction*0.03)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
		
	if currenthover!='' and Input.is_action_just_pressed('leftclick'):
		currentclicked=currenthover
		get_node(bonemap[currentclicked]).get_node('mousechecker').enable()
		get_node(bonemap[currentclicked]).get_node('up').enable()
		get_node(bonemap[currentclicked]).get_node('down').enable()
	elif Input.is_action_just_released("leftclick") and currentclicked!='':
		get_node(bonemap[currentclicked]).get_node('mousechecker').disable()
		get_node(bonemap[currentclicked]).get_node('up').disable()
		get_node(bonemap[currentclicked]).get_node('down').disable()
		currentclicked=''
		
	if currentclicked!='':
		if Input.is_action_pressed("bonerotateleft"):
			get_node(bonemap[currentclicked]).rotate_z(-0.03)
		elif Input.is_action_pressed("bonerotateright"):
			get_node(bonemap[currentclicked]).rotate_z(0.03)


func _on_lowerlegarea_mouse_entered():
	
	currenthover='ll1'
	get_node(bonemap[currenthover]).get_node('glow').visible=true





func _on_upperlegarea_mouse_entered():
	
	currenthover='ul1'
	get_node(bonemap[currenthover]).get_node('glow').visible=true





func _on_upperlegarea2_mouse_entered():
	
	currenthover='ul2'
	get_node(bonemap[currenthover]).get_node('glow').visible=true







func _on_lowerlegarea2_mouse_entered():
	
	currenthover='ll2'
	get_node(bonemap[currenthover]).get_node('glow').visible=true





func mouseexit():
	get_node(bonemap[currenthover]).get_node('glow').visible=false
	currenthover=''


func _on_up_directionup(parent):
	
	direction=1


func _on_down_directiondown(parent):
	direction=-1


func _on_back_directionswitch(parent):
	direction=direction*-1
