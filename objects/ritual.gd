extends Node


signal action_maked(act: String)
signal started(combination: String)
signal ended

@onready var action_rest_timer: Timer = $ActionRestTimer

var combination: String = '123456'
var cur_action: String = ''


func start() -> void:
	started.emit(combination)
	
	for i: int in combination.length():
		action(combination[i])
		print('Common action: ', combination[i])
		
		await action_rest_timer.timeout
	
	ended.emit()




func action(act: String) -> void:
	cur_action = act
	action_maked.emit(act)
	
	#match act:
		#'1':
			#action_rest_timer.wait_time = 5
		#'2':
			#action_rest_timer.wait_time = 5
		#'3':
			#action_rest_timer.wait_time = 10
		#'4':
			#action_rest_timer.wait_time = 10
		#'5':
			#action_rest_timer.wait_time = 15
		#'6':
			#action_rest_timer.wait_time = 15
	
	action_rest_timer.start()
