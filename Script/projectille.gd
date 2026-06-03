extends Area2D

signal Ennemie_touch

var Speed = 20
var touched = false
var Damage = 10

func _physics_process(delta: float) -> void:
	if touched == false:
		global_position.y -= Speed
		$Lighter.play()

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("shooted"):
		area.shooted()
		Enemy_touch_effect()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func Enemy_touch_effect():
	$Lighter.play("Enemy_touched")
	Speed = 0
	await get_tree().create_timer(0.1).timeout
	queue_free()
	touched = true

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("get_damage"):
		body.get_damage()
		Enemy_touch_effect()
