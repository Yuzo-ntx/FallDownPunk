extends Area2D

var Health = 10
var velocity = 70
var damage = 50

func _physics_process(delta: float) -> void:
	global_position.y += velocity * delta

func get_damage():
	Health -= 1

func dead():
	queue_free()
	get_tree().current_scene.MarkScore()

func shooted():
	if Health >= 1 :
		get_damage()
	if Health <= 0 :
		dead()

func _on_area_entered(area: Area2D) -> void:
	get_damage()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(self)
		get_damage()
		global_position.y -= 100


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
