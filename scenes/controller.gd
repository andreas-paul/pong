extends Node2D

@onready var level = preload("res://scenes/level.tscn")
@onready var pause_menu = preload("res://scenes/pause_menu.tscn")

var menu_node


func _ready() -> void:

	var _level = level.instantiate()
	add_child(_level)

	var _pause_menu = pause_menu.instantiate() as Control
	_pause_menu.visible = false
	_pause_menu.global_position = get_viewport_rect().size / 2.0
	add_child(_pause_menu)

