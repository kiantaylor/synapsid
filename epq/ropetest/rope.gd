extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	for i in range(get_child_count()):
		print(get_child(i).name)
		if get_child(i-1)!=get_node("Marker2D"):
			get_child(i-1).target=get_child(i)
			
