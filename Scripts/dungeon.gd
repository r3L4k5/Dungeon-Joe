class_name Dungeon
extends Node2D


const ROOM = preload("res://Scenes/room.tscn")

const ROOM_AMOUNT: int = 12

var current_room_number: int = 0:
	set(value):
		if value < room_list.size():
			current_room_number = value
			

var room_list: Array[Room]


func create_rooms():
	
	for i in range(ROOM_AMOUNT):
		
		var new_room: Room = ROOM.instantiate()
		
		new_room.room_number = i
		new_room.visible = false
		
		room_list.append(new_room)
		
		add_child(new_room)


func next_room():
	room_list[current_room_number].hide()
	
	current_room_number += 1
	
	room_list[current_room_number].show()


func _ready():
	create_rooms()
	room_list[current_room_number].show()
