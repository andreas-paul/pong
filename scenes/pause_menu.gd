extends Control


func _process(_delta: float) -> void:

	if Input.is_action_just_released("ui_cancel"):
		if self.visible:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			self.visible = false
			get_tree().paused = false
		
		elif not self.visible:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			self.visible = true
			get_tree().paused = true



func _on_new_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
