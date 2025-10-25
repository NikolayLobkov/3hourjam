class_name CombinationCreator extends Node


@export var symbols: String = '123456'

var combination: String = ''

func create_combination() -> void:
	randomize()
	var recent: String = symbols
	
	var r: String = ''
	for i: int in symbols.length():
		var s: String = pick_random_symbol(recent)
		r += s
		recent = recent.erase(recent.find(s))
	
	print('created combination is ', r)
	combination = r

func pick_random_symbol(recent: String) -> String:
	var s: String = recent[randf_range(1, recent.length()) - 1]
	return s
