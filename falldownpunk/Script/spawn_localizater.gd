extends Node2D

@onready var Marker = $Markers

func _on_timer_timeout() -> void:
	var Spawner_scene = Marker.get_children().pick_random()
	var Asteroid_istance = preload("res://scene/asteroid.tscn")
	var Asteroid = Asteroid_istance.instantiate()
	Asteroid.global_position = Spawner_scene.global_position
	get_parent().add_child(Asteroid)
	


func _on_big_asteroid_timeout() -> void:
	var BAstSpawn = Marker.get_children().pick_random()
	var BAstObject = preload("res://scene/second_asteroid.tscn")
	var BAstInstance = BAstObject.instantiate()
	BAstInstance.global_position = BAstSpawn.global_position
	get_parent().add_child(BAstInstance)
