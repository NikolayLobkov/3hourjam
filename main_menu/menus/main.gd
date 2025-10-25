extends Control



@onready var level_loader: SceneLoader = $LevelLoader


func _on_start_pressed() -> void:
	level_loader.change_scene()
func _on_quit_pressed() -> void:
	get_tree().quit()
