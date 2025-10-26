extends Marker3D


signal summoned(character: Character)


const DEMON: PackedScene = preload('res://characters/demon/demon.tscn')


func summon() -> void:
	var demon: Demon = DEMON.instantiate()
	get_tree().current_scene.call_deferred('add_child', demon)
	
	await get_tree().process_frame
	
	demon.global_position = global_position
	demon.global_rotation = global_rotation
	
	summoned.emit(demon)
