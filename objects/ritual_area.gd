extends Node3D


@onready var combination_creator: CombinationCreator = $CombinationCreator
@onready var demon_summoner: Marker3D = $DemonSummoner
@onready var qte_game: CanvasLayer = $QTEGame


func _on_trigger_player_entered(player: Player) -> void:
	player.input_enabled = false
	combination_creator.create_combination()
	qte_game.combination = combination_creator.combination
	qte_game.start()


func _ready() -> void:
	qte_game.combination_successed.connect(_on_combination_successed)
	qte_game.combination_failed.connect(_on_combination_failed)


func _on_combination_successed() -> void:
	demon_summoner.summon()
func _on_combination_failed() -> void:
	GameManager.fail.emit()
