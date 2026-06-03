extends Node2D

@onready var Health = $marker

var MaxHealthCanSpawn = false
var NormalHealthCanSpawn = false
var RataPowerCanSpawn = false
var RatataPowerCanSpawn = false

func _on_normal_health_timeout() -> void:
	if NormalHealthCanSpawn == true :
		var HealthSpawner = Health.get_children().pick_random()
		var Health_instance = preload("res://scene/Player/Health/heal_reload.tscn")
		var Health_object = Health_instance.instantiate()
		Health_object.global_position = HealthSpawner.global_position
		get_parent().add_child(Health_object)

func _on_health_mean_timeout() -> void:
	if MaxHealthCanSpawn == true :
		var MaxHealthSpawner = Health.get_children().pick_random()
		var MaxHealth_instance = preload("res://scene/Player/Power/max_health_shield.tscn")
		var MaxHealth_Object = MaxHealth_instance.instantiate()
		MaxHealth_Object.global_position = MaxHealthSpawner.global_position
		get_parent().add_child(MaxHealth_Object)

func _on_ratatata_timeout() -> void:
	if RataPowerCanSpawn == true :
		var Ratata = Health.get_children().pick_random()
		var rata_instance = preload("res://scene/Player/Power/ratatata.tscn")
		var rata = rata_instance.instantiate()
		rata.global_position = Ratata.global_position
		get_parent().add_child(rata )

func _on_ratatasupreme_timeout() -> void:
	if RatataPowerCanSpawn == true :
		var RatatataSpawn = Health.get_children().pick_random()
		var RatatataObject = preload("res://scene/Player/Power/ratata_with_3_gun.tscn")
		var RatatataInstance = RatatataObject.instantiate()
		RatatataInstance.global_position = RatatataSpawn.global_position
		get_parent().add_child(RatatataInstance)

func _on_if_self_can_spawn_timeout() -> void:
	MaxHealthCanSpawn = true

func _on_rtpcs_timeout() -> void: 
	RataPowerCanSpawn = true

func _on_rttpcs_timeout() -> void:
	RatataPowerCanSpawn = true

func _on_normal_health_can_spawn_timeout() -> void:
	NormalHealthCanSpawn = true
