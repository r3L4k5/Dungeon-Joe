class_name Room 
extends Node2D


enum State {
	WALL,
	LOCKED_DOOR,
	UNLOCKED_DOOR,
	OPEN
}

enum Direction {
	EAST,
	SOUTH,
	NORTH,
	WEST
}

var room_number: int

func randomize_openings():
	
	for opening: Opening in $Openings.get_children():
		
		var rand_state = randi_range(0, 4)
		opening.current_state = rand_state

func _ready():
	randomize_openings()
