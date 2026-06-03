extends Node2D

@onready var enemy_shooter = preload("res://scene/Ennemie/Shooter/shooter.tscn")
@onready var enemy_shooter_red = preload("res://scene/Ennemie/Shooter/shooter_red.tscn")

var enemy_can_spawn = false
var enemy_red_can_spawn = false

func _on_timer_timeout() -> void:
	if enemy_can_spawn == true :
		var spawner = $Marker2D.get_children().pick_random()
		var enemy = enemy_shooter.instantiate()
		enemy.global_position = spawner.global_position
		get_parent().add_child(enemy)

func _on_timer_2_timeout() -> void:
	if enemy_red_can_spawn == true :
		var spawner = $Marker2D.get_children().pick_random()
		var enemy_red = enemy_shooter_red.instantiate()
		enemy_red.global_position = spawner.global_position
		get_parent().add_child(enemy_red)

func _on_timer_3_timeout() -> void:
	enemy_can_spawn = true

func _on_enemy_red_can_spawn_timeout() -> void:
	enemy_red_can_spawn = true
