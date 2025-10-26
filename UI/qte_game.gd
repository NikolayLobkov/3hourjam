extends CanvasLayer


@onready var main: Control = $Main
@onready var pool: Control = $Pool

var playing: bool = false


func _physics_process(_delta: float) -> void:
	if not playing: return
	
	

func start() -> void:
	playing = true
