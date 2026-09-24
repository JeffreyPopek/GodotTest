extends Node

var crew_member_name
var busy

var possible_names = ["name 1", "name 2", "name 3"]

enum CREWSTATE {
	IDLE,
	WORKING,
	RESEARCHING
}

var current_state = CREWSTATE.IDLE
		
func _ready() -> void:
	crew_member_name = possible_names[randi_range(0, 2)]

func _set_task(task_state):
	current_state = task_state

func _set_crew_member(member_name):
	crew_member_name = crew_member_name
	
