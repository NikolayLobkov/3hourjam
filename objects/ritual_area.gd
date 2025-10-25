extends Node3D



func _on_trigger_player_entered(player: Player) -> void:
	print('Player entered: ', player)
	
	player.input_enabled = false
