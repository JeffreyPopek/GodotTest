extends Node

var crew_members = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	crew_members = get_children()
	
	for i in 2:
		print(crew_members[i].crew_member_name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
#func _get_available_crew_member():
	#for i in crew_members.size():
		#if i.busy:
			#return i;
