extends Node3D


@onready var combination_creator: CombinationCreator = $CombinationCreator
@onready var demon_summoner: Marker3D = $DemonSummoner
@onready var qte_game: CanvasLayer = $QTEGame
@onready var player_position: Marker3D = $Trigger/PlayerPosition
@onready var ritual: Node = $Ritual




func _on_trigger_player_entered(player: Player) -> void:
	player.input_enabled = false
	combination_creator.create_combination()
	qte_game.combination = combination_creator.combination
	ritual.combination = combination_creator.combination
	
	var fade: Control = GameManager.player_ui.fade
	
	fade.fade_in()
	await fade.faded_in
	
	player.global_position = player_position.global_position
	player.global_rotation.y = player_position.global_rotation.y
	player.look_rotation = player_position.global_rotation
	
	fade.fade_out()
	await fade.faded_out
	
	
	ritual.start()


func _ready() -> void:
	qte_game.combination_successed.connect(_on_combination_successed)
	qte_game.combination_failed.connect(_on_combination_failed)


func _on_combination_successed() -> void:
	demon_summoner.summon(demon_summoner.DEMON_MAG)
func _on_combination_failed() -> void:
	GameManager.fail.emit()
