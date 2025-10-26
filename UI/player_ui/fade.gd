extends Control


signal faded_in
signal faded_out


@onready var fade_animation_player: AnimationPlayer = $FadeAnimationPlayer


func fade_in() -> void:
	fade_animation_player.play('fade_in')
func fade_out() -> void:
	fade_animation_player.play('fade_out')


func _on_fade_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		'fade_in': faded_in.emit()
		'fade_out': faded_out.emit()
