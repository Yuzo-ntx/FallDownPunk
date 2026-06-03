extends Area2D

signal mark

var speed = 100
var rotation_speed = 0.5
var damage = 2
var ast = true

func _physics_process(delta: float) -> void:
	global_position.y += speed * delta
	if ast == true : $firstAsteroid.rotation += rotation_speed * delta



func shooted():
	get_tree().current_scene.MarkScore()
	ast = false
	$firstAsteroid.queue_free()
	$CollisionShape2D.queue_free()
	$AnimatedSprite2D.visible = true
	$AnimatedSprite2D.play()
	
	await get_tree().create_timer(1.3).timeout
	queue_free()

func simple_react():
	#Damage use for simple collision or simple script like when an asteroid 
	#exits the screen etc... It's also use to accompagn another animation like
	#taking shield or like that
	modulate = Color(2,2,2)
	await get_tree().create_timer(0.3).timeout
	modulate = Color(1,1,1)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if get_tree().current_scene.yuzo_is_alive == true :
		get_tree().current_scene.Yuzo_get_small_damage()
	queue_free()


func _on_body_entered(body):

	if body.has_method("take_damage"):
		body.take_damage(self)
		get_tree().current_scene.MarkScore()
		shooted()
