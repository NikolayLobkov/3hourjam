extends Control


@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	GameManager.fail.connect(_on_failed)

func _on_failed() -> void:
	animation_player.play('show')


func _input(event: InputEvent) -> void:
	if event.is_action('fail_restart') and GameManager.failed:
		get_tree().reload_current_scene()
