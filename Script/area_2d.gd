extends Area2D

var Heal = 20
var speed = 100

func _physics_process(delta: float) -> void:
	global_position.y += speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("get_heal"):
		body.get_heal(self)
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
