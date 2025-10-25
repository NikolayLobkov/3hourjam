extends Node3D


@onready var combination_creator: CombinationCreator = $CombinationCreator


func _on_trigger_player_entered(player: Player) -> void:
	print('Player entered: ', player)
	
	player.input_enabled = false
	
	combination_creator.create_combination()
