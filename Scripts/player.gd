extends CharacterBody2D


const speed = 20000.0
const BULLET = preload("res://Scenes/bullet.tscn")


func get_input(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed * delta

func _physics_process(delta):
	get_input(delta)
	rotate_player()
	move_and_slide()

func rotate_player():
	var target = get_global_mouse_position()
	var target_angle = get_angle_to(target)
	rotation += target_angle

func _input(event):
	if event.is_action_pressed("left_click"):
		shoot()

func shoot():
	var bullet = BULLET.instantiate()
	
	get_parent().add_child(bullet)
	bullet.global_position = self.global_position
	bullet.rotation += self.rotation - deg_to_rad(90)
