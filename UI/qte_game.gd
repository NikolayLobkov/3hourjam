extends CanvasLayer


signal combination_successed
signal combination_failed


@onready var main: Control = $Main


var playing: bool = false
var combination: String = '123456'


func start() -> void:
	playing = true
