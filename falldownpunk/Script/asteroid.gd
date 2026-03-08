extends Area2D

signal mark

var speed = 100
var damage = 30
func _physics_process(delta: float) -> void:
	global_position.y += speed * delta


func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(self)
	queue_free()

func shooted():
	get_tree().current_scene.MarkScore()
	queue_free()
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
