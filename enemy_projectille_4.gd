extends Area2D

var speed = 20
var damage = 2
var Direction = Vector2.ZERO

func _ready() -> void:
	return

func _physics_process(delta: float) -> void:
	global_position.y += speed

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(self)
		$AnimatedSprite2D.play("Enemy_touche")
		speed = 0
		await get_tree().create_timer(0.02).timeout
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	print("1")
