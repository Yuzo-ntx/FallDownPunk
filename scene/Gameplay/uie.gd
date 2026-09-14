extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shooting"):
		load_level(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func load_level(level):
	get_tree().current_scene.queue_free()
	var Path = "res://scene/Main/Level/level_" + str(level) + ".tscn"
	get_tree().change_scene_to_file(Path)

func _on_play_botton_pressed() -> void:
	
	load_level(1)
