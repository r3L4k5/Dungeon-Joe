class_name Opening 
extends StaticBody2D


@export var current_state: State = State.WALL
@export var current_direction: Direction


var to_room: Dictionary = {"room": null, "opening": null}


enum State {
	WALL = 0,
	LOCKED_DOOR = 1,
	UNLOCKED_DOOR = 2,
	OPEN = 3
}

enum Direction {
	EAST = 0,
	SOUTH = 1,
	NORTH = 2,
	WEST = 3
}


func connect_to_room(room: Room):
	
	match current_direction:
		
		Direction.EAST:
			to_room = {"room": room, "opening": Direction.WEST}
		
		Direction.SOUTH:
			to_room = {"room": room, "opening": Direction.SOUTH}
		
		Direction.NORTH:
			to_room = {"room": room, "opening": Direction.NORTH}
		
		Direction.WEST:
			to_room = {"room": room, "opening": Direction.WEST}



func _process(delta: float):
	
	match current_state:
		
		State.WALL:
			self.modulate = Color.WHITE
		
		State.LOCKED_DOOR:
			self.modulate = Color.RED
		
		State.UNLOCKED_DOOR:
			self.modulate = Color.GREEN
		
		State.OPEN:
			self.hide()


func _on_area_body_entered(body):
	if current_state == State.OPEN:
		body.hide()
		print_debug(current_state)
