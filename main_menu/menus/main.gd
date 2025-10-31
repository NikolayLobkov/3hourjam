extends Control


@export var settings: Control

@onready var level_loader: SceneLoader = $LevelLoader


func _ready() -> void:
	show()

func _on_start_pressed() -> void:
	level_loader.change_scene()
func _on_settings_pressed() -> void:
	settings.show()
func _on_quit_pressed() -> void:
	get_tree().quit()
