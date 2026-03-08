extends Node2D

@onready var Health = $marker

func _on_timer_timeout() -> void:
	
	var HealthSpawner = Health.get_children().pick_random()
	var Health_instance = preload("res://scene/heal_reload.tscn")
	var Health_object = Health_instance.instantiate()
	Health_object.global_position = HealthSpawner.global_position
	get_parent().add_child(Health_object)




func _on_health_mean_timeout() -> void:
	var MaxHealthSpawner = Health.get_children().pick_random()
	var MaxHealth_instance = preload("res://scene/max_health_shield.tscn")
	var MaxHealth_Object = MaxHealth_instance.instantiate()
	MaxHealth_Object.global_position = MaxHealthSpawner.global_position
	get_parent().add_child(MaxHealth_Object)


func _on_ratatata_timeout() -> void:
	var Ratata = Health.get_children().pick_random()
	var rata_instance = preload("res://scene/ratatata.tscn")
	var rata = rata_instance.instantiate()
	rata.global_position = Ratata.global_position
	get_parent().add_child(rata )



func _on_ratatasupreme_timeout() -> void:
	var RatatataSpawn = Health.get_children().pick_random()
	var RatatataObject = preload("res://scene/ratata_with_3_gun.tscn")
	var RatatataInstance = RatatataObject.instantiate()
	RatatataInstance.global_position = RatatataSpawn.global_position
	get_parent().add_child(RatatataInstance)
