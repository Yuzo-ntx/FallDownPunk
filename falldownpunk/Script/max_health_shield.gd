extends Area2D
var speed = 5
var Heal
func _physics_process(delta: float) -> void:
	global_position.y += speed 



func _on_body_entered(body: Node2D) -> void:
	if body.has_method("get_MaxHealth"):
		body.get_MaxHealth()
	queue_free()
	
	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
