extends CanvasLayer


signal combination_successed
signal combination_failed

@onready var main: Control = $Main
@onready var pool: Control = $Pool

var playing: bool = false
var combination: String = '123456'

func _physics_process(_delta: float) -> void:
	if not playing: return
	
	
	
	

func start() -> void:
	playing = true
