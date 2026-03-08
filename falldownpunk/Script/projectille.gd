extends Area2D

signal Ennemie_touch

@onready var effet = preload("res://asset/Old/meteorBrown_big1.png")
var Speed = 50



func _physics_process(delta: float) -> void:
	global_position.y -= Speed

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


	

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("shooted"):
		area.shooted()
		queue_free()
