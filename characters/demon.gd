class_name Demon extends Character


@export var animation_player: AnimationPlayer
@export var good_ending_anim_name: StringName = &'Good_End'
@export var bad_ending_anim_name: StringName = &'Bad_End'

signal good

func play_animation(anim_name: String) -> void:
	animation_player.play(anim_name)
	print(anim_name)


func good_ending() -> void:
	$SoundGoodEnding.play()
	good.emit()
	play_animation(good_ending_anim_name)
func bad_ending() -> void:
	$BadDemon.play()
	play_animation(bad_ending_anim_name)
