extends Node3D







func _on_ritual_action_maked(act: String) -> void:
	action(act)


func action(act: String) -> void:
	for s: Sectarian in get_children():
		s.action(act)


func _on_ritual_ended() -> void:
	for s: Sectarian in get_children():
		s.play_animation('Idle')
