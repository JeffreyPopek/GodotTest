extends Node

# hull
var max_hull_integrity = 100
var current_hull_integrity
var max_flood_level = 100
var current_flood_level
var breached

var time_elapsed: float = 0.0

# repair
var repair_time: float = 5.0
var repair_crew_required = 1



#		.    = current node
#		..   = parent
#		/    at the beginning = absolute path from root

@onready var crew_manager = get_node("../CrewManager")
@onready var research_system = get_node("../ResearchSystem")


func _ready() -> void:
	current_hull_integrity = max_hull_integrity
	current_flood_level = 0			
	
func _process(delta: float) -> void:
	time_elapsed += delta
	
	# hull integrity decay counter
	if time_elapsed >= 1.0:
		time_elapsed = 0.0
		take_damage(1) 
		
		if breached:
			flood_event()

func take_damage(amount):
	if breached:
		return
		
	current_hull_integrity -= amount
	print("Hull Integrity: ", current_hull_integrity)
	
	if current_hull_integrity <= 0:
		print("Hull breach! Please fix!")
		breached = true
	
func flood_event():
	current_flood_level += 5 #change later to a flood rate 
	
	print("Water Levels: ", current_flood_level, "/", max_flood_level)
	
	if(current_flood_level == max_flood_level):
		breached = false
		print("Sub has sunk. Game Over")
	
func _repair_hull():	
	current_hull_integrity = max_hull_integrity
	breached = false
	
	current_flood_level = 0			# just reset it for now
	
	
func _breach_event():
	#debug only
	current_hull_integrity = 0
	breached = true
