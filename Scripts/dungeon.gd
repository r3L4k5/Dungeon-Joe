extends Node2D


const ROOM = preload("res://Scenes/room.tscn")

const ROOM_AMOUNT: int = 10

var room_list: Array[Room]


func create_rooms():
	for i in range(ROOM_AMOUNT):
		
		var new_room: Room = ROOM.instantiate()
		
		new_room.room_number = i + 1
		new_room.visible = false
		
		add_child(new_room)


func _ready():
	create_rooms()
	var rooms: Array[Node] = get_children()
	
	for i in range(get_child_count()):
		
		print_debug(rooms[i].room_number)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
