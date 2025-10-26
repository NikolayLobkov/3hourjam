extends Node


signal fail

var failed: bool = false


func _ready() -> void:
	fail.connect(_on_failed)


func _on_failed() -> void:
	failed = true
