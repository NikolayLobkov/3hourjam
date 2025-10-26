extends Node3D


@onready var combination_creator: CombinationCreator = $CombinationCreator
@onready var demon_summoner: Marker3D = $DemonSummoner


func _on_trigger_player_entered(player: Player) -> void:
	player.input_enabled = false
	combination_creator.create_combination()
	
	GameManager.fail.emit()


func _on_combination_success() -> void:
	demon_summoner.summon()
