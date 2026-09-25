extends Node

var crew_members = []



@onready var hull_system = get_node("../HullSystem")

func _ready() -> void:
	crew_members = get_children()
	
	for i in 2:
		print(crew_members[i].crew_member_name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func _request_crew_member():
	for crew_member in crew_members:
		if crew_member._is_crew_member_free():
			return crew_member
		return null;
	
	
	
func _request_hull_repair():  # move to a general task/game manager later
	var crew_member = _request_crew_member()
	
	if crew_member == null:
		print("No crew member available")
		return
		
	print("fixing")
	crew_member._set_crew_busy()
	
	await get_tree().create_timer(5.0).timeout
	
	hull_system._repair_hull()
	
	crew_member._set_crew_free()
	
	print("fixed breach")
	
	
	#checks for available crew crew member
	#sends them to do tasks
	#updates their status
