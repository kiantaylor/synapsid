extends Marker3D

var masterbone
var targetbone
# Called when the node enters the scene tree for the first time.
func _ready():
	masterbone=get_parent().get_node(get_node("master").text)
	targetbone=get_parent().get_node(get_node("target").text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y=masterbone.position.y+-sin(-masterbone.rotation.x)*float(masterbone.get_node('length').text)
	position.z=masterbone.position.z+-cos(-masterbone.rotation.x)*float(masterbone.get_node('length').text)
	#look_at(targetbone.position)
	
	
