class_name Sectarian extends Character


@onready var animation_player: AnimationPlayer = $Sectarian/AnimationPlayer


func play_animation(anim_name: String) -> void:
	animation_player.play(anim_name)

func _ready() -> void:
	$Sectarian/Armature/Skeleton3D/Item/Knife.hide()

func action(act: String) -> void:
	$Sectarian/Armature/Skeleton3D/Item/Knife.hide()
	match act:
		'1': play_animation('Clamp')
		'2': play_animation('FoldArms')
		'3': play_animation('RaiseHands')
		'4':
			play_animation('Sacrifice')
			$Sectarian/Armature/Skeleton3D/Item/Knife.show()
		'5': play_animation('Bow')
		'6': play_animation('ChoralSinging')
