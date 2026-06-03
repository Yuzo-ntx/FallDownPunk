extends CharacterBody2D

# Use To Send Signal To The Level When Player Die
signal dead

#Once the game start
@onready var projectille_instance = preload("res://scene/Player/Weapon/Projectils/projectille.tscn")
@onready var Rata = $Attaque/Projectile_Spawn.get_children()

# Player Soul management

# Mouvement and Speed Center
var Speedvelocity = 500
var BoostSprint = 1000
var SpeedVelocityNormal = 500
var rotationS = -0.2
var damage = 10
# Health Center
var Health = 100
var MaxHealth = 100
var Shield = 0
var MaxShield = 100
var power = 0
# Power Center
var Ratata_a_2_Gun = false
var Ratata_a_3_Gun = false
var Ennemis_damaged = false
var infinityShoot = false
var Active_Power = false
var pause = false

# Player Brain
func _physics_process(delta):
	
	# Screen Management
	var maxsize = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0,0), maxsize)
	# Mouvement management
	AllMovement()

# Player control Management
func AllMovement():
	
	velocity = Vector2(0,0)
	move_top()
	move_down()
	move_left()
	move_right()
	shoot()
	sprint()
	move_and_slide()
	active_power_bar()
func move_top():
	if Input.is_action_pressed("move_top"):
		velocity.y = - Speedvelocity
func move_down():
	if Input.is_action_pressed("move_down"):
		velocity.y = Speedvelocity
func move_left():
	if Input.is_action_pressed("move_left"):
		velocity.x = - Speedvelocity
		if Input.is_action_pressed("Sprint"):
				LR_animation()
func move_right():
	if Input.is_action_pressed("move_right"):
		velocity.x =  Speedvelocity
		if Input.is_action_pressed("Sprint"):
				LR_animation()
func shoot():
	if Input.is_action_just_pressed("shooting"):   
		shooting_management()
	if Input.is_action_pressed("shooting"):
		if infinityShoot == true:
			shooting_management()
func sprint():
	if Input.is_action_pressed("Sprint"):
		Speedvelocity = BoostSprint
	if Input.is_action_just_released("Sprint"):
		Speedvelocity = SpeedVelocityNormal
func active_power():
	# Not available YET
	return
func active_shield():
	# Not available YET
	return


# Player animation management
func LR_animation():
	#left and right while sprinting
	$Animation/LR.play("LR")
func damage_animeted() :
	#Ennemie damage
	$Animation/LR.play("Damage")
	await get_tree().create_timer(0.2).timeout
	$Animation/LR.play("Stand")
func simple_react(W):
	#Damage use for simple collision or simple script like when an asteroid 
	#exits the screen etc... It's also use to accompagn another animation like
	#taking shield or like that
	modulate = Color(2,2,2)
	await get_tree().create_timer(0.3).timeout
	modulate = Color(1,1,1)

# Player PV update notion
func health_update():
	$Stats/playerHealth.text = "PunkHealth = "+ str(Health)

# Player Hurt Notion
func take_damage(enemi):
	damage_animeted()
	if Shield > 0 :
		Shield -= enemi.damage
		if Shield < 0 :
			Health += Shield
			Shield = 0
	else:
		Health -= enemi.damage
	if Health <= 0:
		death()
	health_update()
	print("Enmy Damage :",enemi.damage)
	print("Shield :",Shield)
	print("Health :",Health)
func take_damage_second_way(enemi):
	Health -= enemi
	if Health <= 0:
		death()
	health_update()
	modulate = Color(2,2,2)
	await get_tree().create_timer(0.3).timeout
	modulate = Color(1,1,1)
func death():
	$Animation/LR.play("DIE")
	await get_tree().create_timer(0.2).timeout
	dead.emit()
	queue_free()

# Player attaque Management
func shooting_management():
		var Projectilles1 = projectille_instance.instantiate()
		var Projectilles2 = projectille_instance.instantiate()
		var Projectilles3 = projectille_instance.instantiate()
		
		if Ratata_a_2_Gun == true :
			Projectilles1.global_position = $Attaque/Projectile_Spawn/RT2.global_position
			Projectilles2.global_position = $Attaque/Projectile_Spawn/RT1.global_position
			
 	
		if Ratata_a_3_Gun == true :
			Projectilles1.global_position = $Attaque/Projectile_Spawn.global_position 
			Projectilles3.global_position = $Attaque/Projectile_Spawn/RT2.global_position
			Projectilles2.global_position = $Attaque/Projectile_Spawn/RT1.global_position
			
		if Ratata_a_2_Gun == false and Ratata_a_3_Gun == false :Projectilles1.global_position = $Attaque/Projectile_Spawn.global_position 
			
		owner.add_child(Projectilles1)
		
		if Ratata_a_2_Gun == true:
			owner.add_child(Projectilles2)
			
		if Ratata_a_3_Gun == true:
			owner.add_child(Projectilles2)
			owner.add_child(Projectilles3)   

# Player Power and Shield Management
func get_heal(object):
	if Health < MaxHealth :
		if Health + object.Heal >= MaxHealth:
			Health = MaxHealth
		if Health + object.Heal < MaxHealth: 
			Health += object.Heal
	health_update()
func get_shield(shield):
	if Shield < MaxShield:
		if Shield + shield >= MaxShield:
			Shield = MaxShield
		if Shield + shield <= MaxShield:
			Shield += shield
func get_power(Power):
	if Active_Power == false:
		power += Power
func shoot_infinity():
	$Power_Timer/InfinityShoot.start()
	infinityShoot = true
	Active_Power = true
func default_shoot():
	Ratata_a_2_Gun = false
	Ratata_a_3_Gun = false
func Ratata_simple():
	$Power_Timer/Ratata_with_2_Gun.start()
	if Ratata_a_3_Gun == true:
		Ratata_Spam()
	else:
		Ratata_a_2_Gun = true   
func Ratata_Spam():
	$Power_Timer/Ratata_with_3_Gun.start()
	Ratata_a_2_Gun = false
	Ratata_a_3_Gun = true
func get_MaxHealth():
	Health = MaxHealth
	health_update()
	shoot_infinity()
func active_power_bar():
	if power >= 100:
		if Input.is_action_just_pressed("Active_Power"):
			Active_Power = true
			shoot_infinity()
			power = 0

# Power Timer Management
func Ratata_TimeOUt():
	#Used By All RataPower
	default_shoot()
func _on_ratatata_timeout() -> void:
	Ratata_TimeOUt()
func _on_ratata_with_3_gun_timeout() -> void:
	Ratata_TimeOUt()
func _on_infinity_shoot_timeout() -> void:
	# Special way to stop power it doesn't use RataTimeOut
	infinityShoot = false
	Active_Power = false
