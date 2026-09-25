extends Node

var crew_member_name
var possible_names = ["name 1", "name 2", "name 3"]

enum CREWSTATE {
	IDLE,
	WORKING,
	RESEARCHING
}

var current_state = CREWSTATE.IDLE
		
func _ready() -> void:
	crew_member_name = possible_names[randi_range(0, 2)]

func _is_crew_member_free():
	if current_state == CREWSTATE.IDLE:
		return true
		
	return false
	
func _set_crew_busy():
	current_state = CREWSTATE.WORKING
	
func _set_crew_free():
	current_state = CREWSTATE.IDLE
	
func _set_crew_research():
	current_state = CREWSTATE.RESEARCHING
	
