extends CharacterBody2D


var speed = 500
var can_shoot = true
var Health = 100000
var MaxHealth = 100000
var Alive = false
var Follow_Player = true
var Attack = false

@onready var Yuzo = get_tree().get_first_node_in_group("Player")
@onready var laser = preload("res://scene/Ennemie/Shooter/Weapon/enemy_projectille_2.tscn")
@onready var laser2 = preload("res://scene/Ennemie/Shooter/Weapon/enemy_projectille.tscn")
@onready var laser3 = preload("res://scene/Ennemie/Shooter/Weapon/enemy_projectille_3.tscn")
@onready var laser4 = preload("res://scene/Ennemie/Shooter/Weapon/enemy_projectille_4.tscn")

func _ready() -> void:
	return
func _physics_process(delta: float) -> void:
	if Alive == true:
		Stand_animation()
	if Attack == true :
		global_position.y = 196.0
		if Follow_Player == true :
			if Yuzo == null:
				return
			
			if global_position.distance_to(Yuzo.global_position) < 100 :
				velocity = - global_position.direction_to(Yuzo.global_position) * speed
			else:
				if Yuzo.global_position.x > global_position.x:
					velocity.x = 180
				else:
					velocity.x = -180
					#velocity.y = 10
				
				if Yuzo.global_position.y == global_position.y:
					#global_position.y += 100
					return
				
				if Yuzo.global_position.y <= global_position.y:
						#velocity.y = - 10
						return
				
				if abs(global_position.y + Yuzo.global_position.y) < 300 :
						#velocity.y = - 10
						return
						
			# Permit to dont go out in the scene
			var maxsize = get_viewport_rect().size
			global_position = global_position.clamp(Vector2(0,0), maxsize)
			if abs(global_position.x - Yuzo.global_position.x) < 20 :
				if Alive == true:
					shoot()
				
			move_and_slide()

func shoot():
	if can_shoot == true:
		var Shoot_1 = $Node2D/Second_Gun.global_position
		var shoot_2 = $Node2D/Third_Gun.global_position
		var shoot_3 = $Node2D/First_Gun.global_position
		var shoot_4 = $Node2D/fourth_Gun.global_position
		
		
		var laser1_instantiate = laser.instantiate()
		var laser2_instantiate = laser2.instantiate()
		var laser3_instantiate = laser3.instantiate()
		var laser4_instantiate = laser4.instantiate()
		
		laser1_instantiate.global_position = Shoot_1
		laser2_instantiate.global_position = shoot_2
		laser3_instantiate.global_position = shoot_3
		laser4_instantiate.global_position = shoot_4
		
		get_tree().current_scene.add_child(laser1_instantiate)
		get_tree().current_scene.add_child(laser2_instantiate)
		get_tree().current_scene.add_child(laser3_instantiate)
		get_tree().current_scene.add_child(laser4_instantiate)
		
		can_shoot = false
		$can_Shoot.start()

func Stand_animation():
	return
func Dead_animation():
	$Animation/Dead_emite.play("Dead")
func dead():
	
	Follow_Player = false
	Alive = false
	can_shoot = false
	$CollisionShape2D2.queue_free()
	$CollisionShape2D.queue_free()
	$Node2D.queue_free()
	$lot.queue_free()
	$Animation/Dead_emite.visible = true
	$Animation/Dead_emite.play("Dead")
	
	
	await get_tree().create_timer(2).timeout
	$Animation/Dead_emite.queue_free()
	await get_tree().create_timer(1).timeout
	get_tree().current_scene.co()
	get_tree().current_scene.BossDead()
	queue_free()
	queue_free()
func readyGo():
	Attack = true
	$Aive.start()
func _on_can_shoot_timeout() -> void:
	can_shoot = true

func get_damage(Damage):
	simple_react()
	Health -= Damage
	if Health <= 0 :
		dead()
	print(Health)

func simple_react():
	modulate = Color(2,2,2)
	await get_tree().create_timer(0.3).timeout
	modulate = Color(1,1,1)
	#Damage use for simple collision or simple script like when an asteroid 
	#exits the screen etc... It's also use to accompagn another animation like
	#taking shield or like that


func _on_aive_timeout() -> void:
	Alive = true
