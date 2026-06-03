extends CharacterBody2D


var speed = 160
var can_shoot = true
var Health = 100
var MaxHealth = 100

@onready var Yuzo = get_tree().get_first_node_in_group("Player")
@onready var laser = preload("res://scene/Ennemie/Shooter/Weapon/enemy_projectille_2.tscn")
@onready var laser2 = preload("res://scene/Ennemie/Shooter/Weapon/enemy_projectille.tscn")

func _physics_process(delta: float) -> void:
	if Yuzo == null:
		return
	
	if global_position.distance_to(Yuzo.global_position) < 100 :
		velocity = - global_position.direction_to(Yuzo.global_position) * speed
	else:
		if Yuzo.global_position.x > global_position.x:
			velocity.x = 50
		else:
			velocity.x = -50 
			velocity.y = 10
			
		if Yuzo.global_position.y <= global_position.y:
				velocity.y = - 50
		
		if abs(global_position.y + Yuzo.global_position.y) < 300 :
				velocity.y = - 50
				
	# Permit to dont go out in the scene
	var maxsize = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0,0), maxsize)
	if abs(global_position.x - Yuzo.global_position.x) < 20 :
		shoot()
		
	move_and_slide()

func shoot():
	if can_shoot == true:
		var Shoot_1 = $Node2D/Second_Gun.global_position
		var shoot_2 = $Node2D/Third_Gun.global_position
		var laser1_instantiate = laser.instantiate()
		var laser2_instantiate = laser2.instantiate()
		laser1_instantiate.global_position = $Node2D/First_Gun.global_position
		get_tree().current_scene.add_child(laser1_instantiate)
		can_shoot = false
		$can_Shoot.start()

func dead():
	$Sprite2D.queue_free()
	$CollisionShape2D.queue_free()
	$Dead_emite.visible = true
	$Dead_emite.play()
	
	await get_tree().create_timer(2).timeout
	queue_free()
	queue_free()

func _on_can_shoot_timeout() -> void:
	can_shoot = true

func get_damage():
	Health -= 10
	if Health <= 0 :
		dead()
	simple_react()

func simple_react():
	#Damage use for simple collision or simple script like when an asteroid 
	#exits the screen etc... It's also use to accompagn another animation like
	#taking shield or like that
	modulate = Color(2,2,2)
	await get_tree().create_timer(0.3).timeout
	modulate = Color(1,1,1)
