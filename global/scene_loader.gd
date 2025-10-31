class_name SceneLoader extends Node


@export_file_path('*.tscn') var scene_path: String
@export var preload_scene: bool = true

var loaded: bool = false
var progress: Array


func _ready() -> void:
	if preload_scene:
		begin_loading()

func begin_loading() -> void:
	ResourceLoader.load_threaded_request(scene_path)

func _process(_delta: float) -> void:
	match ResourceLoader.load_threaded_get_status(scene_path, progress):
		ResourceLoader.THREAD_LOAD_LOADED:
			loaded = true
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			pass
		ResourceLoader.THREAD_LOAD_FAILED:
			pass
			#get_tree().quit()

func change_scene() -> void:
	if not loaded: return
	var scene: Resource = ResourceLoader.load_threaded_get(scene_path)
	if scene is PackedScene:
		get_tree().change_scene_to_packed(scene)
