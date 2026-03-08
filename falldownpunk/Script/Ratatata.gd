extends Area2D

var speed = 50

func _physics_process(delta: float) -> void:
	global_position.y += speed * delta
	
	 

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("Ratata_simple"):
		body.Ratata_simple()
	queue_free()
