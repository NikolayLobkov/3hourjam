class_name Player extends Character


const CAMERA_SENSITIVITY: float = 0.004
const CAMERA_SMOOTH: float = 15.0

@onready var camera_pivot: Node3D = $CameraPivot

var cur_speed: float = 4.0

var input_enabled: bool = true
var input_direction: Vector2

var look_relative: Vector3 = Vector3.ZERO
var look_velocity: Vector3 = Vector3.ZERO
var look_rotation: Vector3 = Vector3.ZERO


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	GameManager.failed = false


func _physics_process(_delta: float) -> void:
	if input_enabled:
		input_direction = Input.get_vector('move_left', 'move_right', 'move_forward', 'move_backward')
	else:
		input_direction = Vector2.ZERO
	
	
	velocity.x = input_direction.x * cur_speed
	velocity.z = input_direction.y * cur_speed
	
	velocity = velocity.rotated(Vector3.UP, rotation.y)
	
	if not is_on_floor():
		velocity += get_gravity() * 0.1
	
	move_and_slide()


func _process(delta: float) -> void:
	look_velocity = look_velocity.lerp(look_relative, delta * CAMERA_SMOOTH)
	
	look_rotation.y += look_velocity.y
	look_rotation.x = clampf(look_rotation.x + look_velocity.x, -PI / 2.0, PI / 2.0)
	
	look_relative = Vector3.ZERO
	
	rotation.y = look_rotation.y
	camera_pivot.rotation.x = look_rotation.x


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		
		if input_enabled:
			look_relative.y -= event.relative.x * CAMERA_SENSITIVITY
			look_relative.x -= event.relative.y * CAMERA_SENSITIVITY
			
	
	if event is InputEventKey:
		if event.keycode == KEY_ESCAPE and event.is_pressed():
			get_tree().change_scene_to_file('res://main_menu/main_menu.tscn')
	
