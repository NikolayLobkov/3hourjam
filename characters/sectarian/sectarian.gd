class_name Sectarian extends Character


@onready var animation_player: AnimationPlayer = $Sectarian/AnimationPlayer


func play_animation(anim_name: String) -> void:
	animation_player.play(anim_name)


func action(act: String) -> void:
	match act:
		'1': play_animation('Clamp')
		'2': play_animation('FoldArms')
		'3': play_animation('RaiseHands')
		'4': play_animation('Sacrifice')
		'5': play_animation('Bow')
		'6': 
			$SoundChoir.play()
			play_animation('ChoralSinging')
