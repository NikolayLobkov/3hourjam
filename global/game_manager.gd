extends Node


signal restart
signal fail

signal restart_scene

var failed: bool = false


func _ready() -> void:
	fail.connect(_on_failed)
	restart.connect(_on_restart)
	restart_scene.connect(_on_restart_scene)

func _on_failed() -> void:
	failed = true

func _on_restart() -> void:
	#restart_scene.emit()
	pass
func _on_restart_scene() -> void:
	failed = false
	get_tree().reload_current_scene()




var fullscreen: bool = false

func _input(event: InputEvent) -> void:
	if event.is_action('fullscreen') and event.is_pressed():
		fullscreen = not fullscreen
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if fullscreen else DisplayServer.WINDOW_MODE_WINDOWED)
