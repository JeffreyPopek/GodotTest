extends Node

var research_level = 1
var current_research_xp = 0
var research_level_up_xp = 100
var research_xp_increase_rate = 100

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _gain_research_xp(amount):
	current_research_xp += amount
	_check_level_up()
	
func _check_level_up():
	if current_research_xp >= research_level_up_xp:
		var extra_xp = current_research_xp - research_level_up_xp
		print("Research level up! ", research_level, " -> ", research_level + 1)
		research_level += 1
		current_research_xp = extra_xp; # get extra xp for task
		
		research_level_up_xp += research_xp_increase_rate # more xp required for next level
		
		
