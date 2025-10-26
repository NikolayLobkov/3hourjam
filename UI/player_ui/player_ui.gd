extends CanvasLayer


@onready var fail_screen: Control = $FailScreen
@onready var fade: Control = $Fade


func _ready() -> void:
	GameManager.restart.connect(_on_restart_request)


func _on_restart_request() -> void:
	fade.fade_in()
	await fade.faded_in
	GameManager.restart_scene.emit()
