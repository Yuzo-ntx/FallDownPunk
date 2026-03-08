extends Area2D

var Speed = 10

func _physics_process(delta: float) -> void:
	global_position.y += Speed * delta 




func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("Ratata_Spam"):
		body.Ratata_Spam()
		queue_free()
	pass # Replace with function body.
