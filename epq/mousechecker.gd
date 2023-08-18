extends Area3D
var onmouse=false
signal directionup(parent)
signal directiondown(parent)
signal directionswitch(parent)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if name=='mousechecker':
		onmouse=true
	elif name=='up':
		emit_signal("directionup",get_parent())
	elif name=='down':
		emit_signal("directiondown",get_parent())
	elif name=='back':
		emit_signal('directionswitch',get_parent())


func _on_area_exited(area):
	onmouse=false
func disable():
	get_node("CollisionShape3D").disabled=true
func enable():
	get_node("CollisionShape3D").disabled=false
