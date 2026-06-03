extends CanvasLayer

func _ready() -> void:
	
	process_mode = Node.PROCESS_MODE_ALWAYS

func _on_button_pressed() -> void:
	get_tree().current_scene.get_tree().paused = false
	get_tree().reload_current_scene()
