extends Area2D

const speed = 500.0

func _physics_process(delta):
	position += Vector2(speed, 0).rotated(rotation + deg_to_rad(90)) * delta
