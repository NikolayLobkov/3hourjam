extends Node


signal action_maked(act: String)

@onready var action_rest_timer: Timer = $ActionRestTimer

var combination: String = '123456'
var cur_action: String = ''


func start() -> void:
	for i: int in combination.length():
		action(combination[i])
		print(combination[i])
		
		await action_rest_timer.timeout




func action(act: String) -> void:
	cur_action = act
	action_maked.emit(act)
	
	match act:
		'1':
			action_rest_timer.wait_time = 5
		'2':
			action_rest_timer.wait_time = 5
		'3':
			action_rest_timer.wait_time = 10
		'4':
			action_rest_timer.wait_time = 10
		'5':
			action_rest_timer.wait_time = 15
		'6':
			action_rest_timer.wait_time = 15
	
	action_rest_timer.start()






#func _input(event: InputEvent) -> void:
	#if event is InputEventAction and waiting_player_input:
		#match event.action:
			#'action_1': action_1()
			#'action_2': action_2()
			#'action_3': action_3()
			#'action_4': action_4()
			#'action_5': action_5()
			#'action_6': action_6()
