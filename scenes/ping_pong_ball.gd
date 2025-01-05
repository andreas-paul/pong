extends CharacterBody2D
class_name PingPongBall

var start_speed = 500
var max_speed = 1000
signal destroyed(velocity: Vector2)


func _ready() -> void:
	var angle_y = randi_range(-50,+50)
	var angle_x = randi_range(-50,-100)
	velocity = Vector2(angle_x,angle_y).normalized() * start_speed


func _physics_process(delta: float) -> void:
	
	var speed_multiplier = 1.0
	var collision = move_and_collide(velocity * delta)
	if collision:
		$AudioStreamPlayer2D.play()
		if collision.get_collider().name == "Padel":
			speed_multiplier = 1.1
		elif collision.get_collider().name == "AIPlayer":
			speed_multiplier = 1.2
		
		velocity = velocity.bounce(collision.get_normal()) * speed_multiplier
		if velocity.length() > 2000:
			velocity = velocity.clamp(Vector2(-2000,-2000), Vector2(2000,2000))


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	destroyed.emit(self.velocity)
	queue_free()
