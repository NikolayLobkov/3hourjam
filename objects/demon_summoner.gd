extends Marker3D


signal summoned(demon: Demon)


const DEMON_MAG: PackedScene = preload('res://characters/demon_mag/demon_mag.tscn')
const DEMON_MONK: PackedScene = preload('res://characters/demon_monk/demon_monk.tscn')
const DEMON_SKELETON: PackedScene = preload('res://characters/demon_skeleton/demon_skeleton.tscn')


func summon(d: PackedScene) -> void:
	var demon: Demon = d.instantiate()
	get_tree().current_scene.call_deferred('add_child', demon)
	
	await get_tree().process_frame
	
	demon.global_position = global_position
	demon.global_rotation = global_rotation
	
	summoned.emit(demon)
