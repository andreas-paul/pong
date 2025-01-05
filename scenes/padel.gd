extends CharacterBody2D


var pos : Vector2


func _ready() -> void:

	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

	pos = global_position


func _physics_process(_delta):

	var new_pos : Vector2
	var mouse_position = get_global_mouse_position()
	
	if mouse_position.y < 76:
		new_pos = Vector2(pos.x, 60)
	elif mouse_position.y > 660:
		new_pos = Vector2(pos.x, 660)
	else:
		new_pos = Vector2(pos.x, mouse_position.y)

	var tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "global_position", new_pos, 0.1)
		


