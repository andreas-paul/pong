extends CharacterBody2D

var active_ball
var active_ball_position


func _physics_process(_delta):

	active_ball = get_tree().get_nodes_in_group("balls") as Array
	if active_ball.size() > 0:
		if active_ball[0].velocity.normalized().x >= 0:
			active_ball_position = active_ball[0].global_position
			var new_pos = Vector2(global_position.x, active_ball_position.y)
			move_padel_to_new_position(new_pos, "FAST")
	else:
		move_padel_to_new_position(Vector2(global_position.x, 350), "MEDIUM")


func move_padel_to_new_position(new_pos : Vector2, speed: String):
	var min_speed : float
	var max_speed : float
	if speed == "FAST":
		min_speed = 0.10
		max_speed = 0.15
	elif speed == "MEDIUM":
		min_speed = 0.30
		max_speed = 0.60
	elif speed == "SLOW":
		min_speed = 0.70
		max_speed = 1.00

	var tween = get_tree().create_tween().set_ease(Tween.EASE_IN)
	tween.tween_property(self, "global_position", new_pos, randf_range(min_speed, max_speed))