extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var target
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 20
var angle=0.0
var hangflag=true
func _physics_process(delta):
	# Add the gravity.
	if target:
			#print(target.name)
			look_at(target.position)
#			if not is_on_floor() and  get_node("RayCast2D").is_colliding() and hangflag :
#				velocity.y += gravity * delta
#				get_node("MeshInstance2D2").visible=true
			if not get_node("RayCast2D").is_colliding() :
				hangflag=false
				get_node("RayCast2D").enabled=false
			
				var c=target.position.x
				var d=target.position.y
				var radius=50
				#position.x=(radius*cos((target.rotation-3.14)))+c
				#position.y=(radius*sin((target.rotation-3.14)))+d
				position.x=lerp(position.x,(radius*cos((target.rotation-3.14)))+c,delta*8)
				position.y=lerp(position.y,(radius*sin((target.rotation-3.14)))+d,delta*8)
				print(angle,'   name:   ',name,'   targetname:  ',target.name)
				#angle=lerp(angle,1.57,delta)
				#get_node("MeshInstance2D2").visible=false
			
		

	# Handle Jump.
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	

	move_and_slide()
