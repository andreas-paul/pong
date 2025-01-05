extends Node2D

var player_score = 0
var ai_score = 0

@export var player_score_label : Label
@export var ai_score_label : Label
@export var start_speed : int = 500
@export var ball_source : Node2D

@onready var ball = preload("res://scenes/ping_pong_ball.tscn")


func _ready() -> void:
	if get_tree().paused:
		get_tree().paused = false

	spawn_ball_source()


func spawn_ball_source():
	var tween = get_tree().create_tween().set_ease(Tween.EASE_IN)
	tween.tween_property(ball_source, "visible", true, 0.5)
	tween.finished.connect(_on_source_created)
	ball_source.visible = false


func _on_source_created():
	spawn_new_ball()
	var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
	tween.tween_property(ball_source, "visible", false, 0.5)


func spawn_new_ball():
	var _ball = ball.instantiate() as CharacterBody2D
	_ball.global_position = ball_source.global_position
	_ball.destroyed.connect(on_ball_leaving_screen)
	add_child.call_deferred(_ball)


func on_ball_leaving_screen(velocity: Vector2):

	var norm = velocity.normalized()
	if norm.x > 0:
		player_score += 1
		player_score_label.text = str(player_score)
	elif norm.x < 0:
		ai_score += 1
		ai_score_label.text = str(ai_score)
	else:
		pass

	await get_tree().create_timer(1).timeout
	var tween = get_tree().create_tween().set_ease(Tween.EASE_IN)
	tween.tween_property(ball_source, "visible", true, 0.5)
	tween.finished.connect(_on_source_created)