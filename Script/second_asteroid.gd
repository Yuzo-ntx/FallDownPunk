extends Area2D

var Health = 5
var velocity = 70
var rotation_speed = 0.5
var damage = 5
var alive = true

func _physics_process(delta: float) -> void:
	global_position.y += velocity * delta
	if alive:
		$firstAsteroid.rotation += rotation_speed * delta
func get_damage():
	Health -= 1
	simple_react()
	
func simple_react():
	#Damage use for simple collision or simple script like when an asteroid 
	#exits the screen etc... It's also use to accompagn another animation like
	#taking shield or like that
	modulate = Color(2,2,2)
	await get_tree().create_timer(0.3).timeout
	modulate = Color(1,1,1)


func dead():
	get_tree().current_scene.MarkScore()
	alive = false
	$firstAsteroid.queue_free()
	$CollisionShape2D.queue_free()
	$Hit.visible = true
	$Hit.play()
	await get_tree().create_timer(2).timeout
	queue_free()
	

func shooted():
	if Health >= 1 :
		get_damage()
	if Health <= 0 :
		dead()

func _on_area_entered(area: Area2D) -> void:
	return

func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(self)
		global_position.y -= 100
		get_damage()
		


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if get_tree().current_scene.yuzo_is_alive == true :
		get_tree().current_scene.Yuzo_get_Big_damage()
	queue_free()
