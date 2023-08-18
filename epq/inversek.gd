extends Node2D

var p1
var p2
var p3
var c1=0
var c2=0
var c3=70.0
var c4=0.0
var a=0.0
var b=0.0
var c=0.0
var d=0.0
var p4
var endtouch=false
var endtouchready=false
var currentjoint
var currentJoints=[p2,p3,p4]
# Called when the node enters the scene tree for the first time.
func _input(event):
	if event is InputEventMouseMotion:
		if (c1-c3)**2+(c2-c4)**2<145**2:
			c3+=event.relative.x*0.2
			c4+=event.relative.y*0.2
		else:
			c3=lerp(float(c3),0.0,0.2)
			c4=lerp(float(c4),0.0,0.2)
func _ready():
	
	p1=get_node("p1")
	p2=get_node("p2")
	p3=get_node("p3")
	#p4=get_node("p4")
	currentJoints=[p2,p3,p4]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Input.mouse_mode=(Input.MOUSE_MODE_CAPTURED)
	currentjoint=p3
	get_node('slam').position=(currentJoints[2].position)-Vector2(51,0).rotated(currentJoints[2].rotation)
	get_node('slam2').position=(currentJoints[2].position)-Vector2(-51,0).rotated(currentJoints[2].rotation)
	get_node('slam3').position=(currentJoints[1].position)-Vector2(0,51).rotated(currentJoints[1].rotation)
	get_node('slam4').position=(currentJoints[1].position)-Vector2(0,-51).rotated(currentJoints[1].rotation)
	p1.position=Vector2(c1,c2)
	currentJoints[0].position.x=lerp(currentJoints[0].position.x,c,delta*4)
	currentJoints[0].position.y=lerp(currentJoints[0].position.y,d,delta*4)	
	if endtouchready :
		currentJoints[1].position.x=lerp(currentJoints[1].position.x,a,delta*4)
		currentJoints[1].position.y=lerp(currentJoints[1].position.y,b,delta*4)	
	if not endtouch and  (a)**2+(b)**2<8000:
		print(a**2+b**2)
		currentJoints[1].position.x=lerp(currentJoints[1].position.x,currentJoints[2].position.x,delta)
		currentJoints[1].position.y=lerp(currentJoints[1].position.y,currentJoints[2].position.y,delta)	
	
	currentjoint.position.x=lerp(currentjoint.position.x,c3,delta*2)
	currentjoint.position.y=lerp(currentjoint.position.y,c4,delta*2)	
	p1.look_at(currentJoints[1].position)
	#currentJoints[1].look_at(currentjoint.position)
	currentJoints[2].rotate(0.15)
	currentJoints[1].rotate(0.15)
	
	if Input.is_action_pressed('ui_up'):
		c4-=0.8
	elif Input.is_action_pressed('ui_down'):
		c4+=0.8
	if Input.is_action_pressed('ui_right'):
		c3+=0.8
	elif Input.is_action_pressed('ui_left'):
		c3-=0.8
	if (c1-c3)**2+(c2-c4)**2>145**2:
	
		c3=lerp(float(c3),0.0,delta*2)
		c4=lerp(float(c4),0.0,delta*2)
#	(c1-a)**2+(c2-b)**2=25
#	(c3-a)**2+(c4-b)**2=25
	#a=sqrt(c3-a)


func _on_slam_area_entered(area):
	#print('hit')
	if area.get_parent()==currentJoints[0]:
		print('hit')
		if endtouch:
			endtouchready=true
		a=get_node('slam').position.x
		b=get_node('slam').position.y


func _on_slam_2_area_entered(area):
	#print('hit')
	if area.get_parent()==currentJoints[0]:
		if endtouch:
			endtouchready=true
		a=get_node('slam2').position.x
		b=get_node('slam2').position.y



func _on_slam_3_area_entered(area):
	if area.get_parent()==p1:
		c=get_node('slam3').position.x
		d=get_node('slam3').position.y


func _on_slam_4_area_entered(area):
	if area.get_parent()==p1:
		
		c=get_node('slam4').position.x
		d=get_node('slam4').position.y


func _on_area_2d_4_area_entered(area):
	if area.get_parent()==p2:
		endtouch=true


func _on_area_2d_4_area_exited(area):
	if area.get_parent()==p2:
		endtouch=false
		endtouchready=false
