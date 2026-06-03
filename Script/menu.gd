extends Control


@onready var level = get_tree().current_scene 
@onready var leve = preload("res://scene/Main/Level/Choise_Level.tscn")

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("make_pause"):
		_on_pause_pressed()
	return

func _on_play_button_pressed() -> void:
	get_tree().current_scene.get_tree().paused = false
	get_tree().current_scene.Menu.visible = false
	level.Show_Setting(false)
	pass # Replace with function body.


func _on_setting_button_pressed() -> void:
	level.Show_Setting(true)
	return # Replace with function body.


func _on_quit_button_pressed() -> void:
	get_tree().current_scene.get_tree().quit()
	pass


func _on_pause_pressed() -> void:
	get_tree().current_scene.get_tree().paused = !get_tree().paused
	get_tree().current_scene.Menu.visible = !get_tree().current_scene.Menu.visible


func _on_change_level_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/Main/Level/Choise_Level.tscn")
