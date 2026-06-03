extends Node2D

@onready var Level_1 = preload("res://scene/Main/Level/level_1.tscn")
@onready var Level_2 = preload("res://scene/Main/Level/level_2.tscn")
@onready var Level_3 = preload("res://scene/Main/Level/level_3.tscn")
@onready var Level_4 = preload("res://scene/Main/Level/level_4.tscn")

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _physics_process(delta: float) -> void:
	get_tree().current_scene.get_tree().paused = false
	return

func load_level(level):
	get_tree().current_scene.queue_free()
	var Path = "res://scene/Main/Level/level_" + str(level) + ".tscn"
	get_tree().change_scene_to_file(Path)

func _on_button_lv_1_pressed() -> void:
	load_level(1)
func _on_button_lv_2_pressed() -> void:
	load_level(2)
func _on_button_lv_3_pressed() -> void:
	load_level(3)
func _on_button_lv_4_pressed() -> void:
	load_level(4)
