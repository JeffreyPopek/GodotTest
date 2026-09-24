extends Node

# hull
var max_hull_integrity = 100
var current_hull_integrity
var max_flood_level = 100
var current_flood_level
var breached

# timer
var time_elapsed: float = 0.0

# crew
var current_crew_count = 1
var available_crew

# repair
var repair_time: float = 5.0
var repair_crew_required = 1



#		.    = current node
#		..   = parent
#		/    at the beginning = absolute path from root

@onready var crew_manager = get_node("../CrewManager")
@onready var research_system = get_node("../ResearchSystem")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_hull_integrity = max_hull_integrity
	print(current_hull_integrity)
	
	current_flood_level = 0
	available_crew = current_crew_count	
			
	research_system._gain_research_xp(100)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_elapsed += delta
	
	# hull integrity decay counter
	if time_elapsed >= 1.0:
		time_elapsed = 0.0
		take_damage(1) 
		
		if breached:
			flood_event()
		
	#take_damage(1)
	#print("Hull Integrity: ", current_hull_integrity)
	if Input.is_key_pressed(KEY_E):
		#repair_hull()
		research_system._gain_research_xp(100)

	
		
	
		
	

func take_damage(amount):
	if breached:
		return
		
	current_hull_integrity -= amount
	print("Hull Integrity: ", current_hull_integrity)
	
	if current_hull_integrity <= 0:
		print("Hull breach! Please fix!")
		breached = true
	
func flood_event():
	current_flood_level += 10 #change later to a flood rate 
	
	print("Water Levels: ", current_flood_level, "/", max_flood_level)
	
	if(current_flood_level == max_flood_level):
		breached = false
		print("Sub has sunk. Game Over")
	
func repair_hull():
	if available_crew < 1:
		print("everyone is busy...")
		return;
		#
	available_crew -= 1
	
	print("starting repairs...")
	
	await get_tree().create_timer(2.0).timeout
	
	available_crew += 1
	current_hull_integrity = max_hull_integrity
	
	print("Hull Repaired. Hull Integrity: ", current_hull_integrity, "/", max_hull_integrity)
