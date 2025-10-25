class_name Trigger extends Area3D


signal player_entered(player: Player)
signal player_exited(player: Player)


func _init() -> void:
	body_entered.connect(_body_entered)
	body_exited.connect(_body_exited)

func _body_entered(body: CollisionObject3D) -> void:
	if body is Player: player_entered.emit(body)
func _body_exited(body: CollisionObject3D) -> void:
	if body is Player: player_exited.emit(body)
