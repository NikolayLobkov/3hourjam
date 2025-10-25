extends CharacterBody3D




const CAMERA_SENSITIVITY: float = 0.006


@onready var camera_pivot: Node3D = $CameraPivot

var cur_speed: float = 10.0

var input_direction: Vector2

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(_delta: float) -> void:
	input_direction = Input.get_vector('move_left', 'move_right', 'move_forward', 'move_backward')
	
	velocity.x = input_direction.x * cur_speed
	velocity.z = input_direction.y * cur_speed
	
	velocity = velocity.rotated(Vector3.UP, rotation.y)
	
	move_and_slide()
	


func _unhandled_input(event: InputEvent) -> void:
	
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x * CAMERA_SENSITIVITY
		camera_pivot.rotation.x = clampf(camera_pivot.rotation.x - event.relative.y * CAMERA_SENSITIVITY, -PI / 2.0, PI / 2.0)
	
	if event is InputEventKey:
		if event.keycode == KEY_ESCAPE and event.is_pressed():
			get_tree().quit()
	
