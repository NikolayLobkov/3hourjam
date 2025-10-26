extends CanvasLayer


signal combination_successed
signal combination_failed

signal action_maked(act: String)


@export var player: Player
@onready var main: Control = $Main
@onready var action_timeout_timer: Timer = $ActionTimeoutTimer



var combination: String = '123456'
var created_combination: String = ''

var waiting_player_input: bool = false


func _on_ritual_started(_combination: String) -> void:
	combination = _combination
	created_combination = ''

func _on_ritual_action_maked(_act: String) -> void:
	waiting_player_input = true
	print(waiting_player_input)
	action_timeout_timer.start()


func _input(event: InputEvent) -> void:
	if not waiting_player_input: return
	
	if event.is_action_pressed('action_1'): action('1')
	elif event.is_action_pressed('action_2'): action('2')
	elif event.is_action_pressed('action_3'): action('3')
	elif event.is_action_pressed('action_4'): action('4')
	elif event.is_action_pressed('action_5'): action('5')
	elif event.is_action_pressed('action_6'): action('6')


func action(act: String) -> void:
	created_combination += act
	waiting_player_input = false
	action_maked.emit(act)
	action_timeout_timer.stop()
	
	print('Your action: ', act)


func _on_action_timeout_timeout() -> void:
	created_combination += '0'
	waiting_player_input = false


func _on_ritual_ended() -> void:
	waiting_player_input = false
	
	print('Your combination: ', created_combination)
	print('Common combination: ', combination)
	
	if created_combination == combination:
		combination_successed.emit()
		return
	combination_failed.emit()
