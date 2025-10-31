extends Control



@export var previous_tab: Control


func _on_back_pressed() -> void:
	previous_tab.show()
