extends Node2D

@onready var Marker = $Markers

var CanSpawnBigAsteroid = false
var SpawnAllTheAsteroid = false

func _on_timer_timeout() -> void:
	if CanSpawnBigAsteroid == false or SpawnAllTheAsteroid == true:
		var Spawner_scene = Marker.get_children().pick_random()
		var Asteroid_istance = preload("res://scene/Ennemie/Asteroid/asteroid.tscn")
		var Asteroid = Asteroid_istance.instantiate()
		Asteroid.global_position = Spawner_scene.global_position
		get_parent().add_child(Asteroid)

func _on_big_asteroid_timeout() -> void:
	if CanSpawnBigAsteroid == true or SpawnAllTheAsteroid == true :
		var BAstSpawn = Marker.get_children().pick_random()
		var BAstObject = preload("res://scene/Ennemie/Asteroid/second_asteroid.tscn")
		var BAstInstance = BAstObject.instantiate()
		BAstInstance.global_position = BAstSpawn.global_position
		get_parent().add_child(BAstInstance)

func _on_witch_seteroid_will_spawn_timeout() -> void:
	if SpawnAllTheAsteroid == false :
		if CanSpawnBigAsteroid == false :
			CanSpawnBigAsteroid = true
		else :
			CanSpawnBigAsteroid = false

func _on_all_the_asteroid_timeout() -> void:
	SpawnAllTheAsteroid = true
