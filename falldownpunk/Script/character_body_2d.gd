extends CharacterBody2D

signal dead
signal Ennemis_touch

@onready var projectille_instance = preload("res://scene/projectille.tscn")
@onready var Rata = $Marker2D.get_children()
var Speedvelocity = 500
var Health = 100
var MaxHealth = 100
var Shield = 100
var MaxShield = 100
var Ratata_a_2_Gun = false
var Ratata_a_3_Gun = false
var Ennemis_damaged = false
var BoostSprint = 1000
var SpeedVelocityNormal = 500
var infinityShoot = false

func _physics_process(_delta):
	#gestion de mouvement de mon personnage
	#mechanic pour que le joueur ne reste pas en mouvement
	velocity = Vector2(0,0)
	
	if Input.is_action_pressed("move_down"):
		velocity.y = Speedvelocity
	if Input.is_action_pressed("move_left"):
		velocity.x = - Speedvelocity
	if Input.is_action_pressed("move_top"):
		velocity.y = - Speedvelocity
	if Input.is_action_pressed("move_right"):
		velocity.x =  Speedvelocity
	if Input.is_action_just_pressed("shooting"):   
		shooting_management()
	if infinityShoot == true:
		if Input.is_action_pressed("shooting"):
			shooting_management()
	if Input.is_action_pressed("Sprint"):
		Speedvelocity = BoostSprint
	if Input.is_action_just_released("Sprint"):
		Speedvelocity = SpeedVelocityNormal
	move_and_slide()
	
	#gere la limit de modn ecran
	var maxsize = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0,0), maxsize)
	
	
func death():
		dead.emit()
		queue_free()
		
		
func health_update():
	$playerHealth.text = "PunkHealth = "+ str(Health)
	
	
func take_damage(enemi):
	Health -= enemi.damage
	if Health <= 0:
		death()
	health_update()
	
	
func get_heal(object):
	if Health < MaxHealth :
		if Health + object.Heal >= MaxHealth:
			Health = MaxHealth
		if Health + object.Heal < MaxHealth: 
			Health += object.Heal
	health_update()
	
	
func get_MaxHealth():
	Health = MaxHealth
	health_update()
	shoot_infinity()

func shoot_infinity():
	$InfinityShoot.start()
	infinityShoot = true

func shooting_management():
		var Projectilles1 = projectille_instance.instantiate()
		var Projectilles2 = projectille_instance.instantiate()
		var Projectilles3 = projectille_instance.instantiate()
		
		if Ratata_a_2_Gun == true :
			Projectilles1.global_position = $Marker2D/RT2.global_position
			Projectilles2.global_position = $Marker2D/RT1.global_position
			
		if Ratata_a_3_Gun == true :
			Projectilles1.global_position = $Marker2D.global_position 
			Projectilles3.global_position = $Marker2D/RT2.global_position
			Projectilles2.global_position = $Marker2D/RT1.global_position
			
		if Ratata_a_2_Gun == false and Ratata_a_3_Gun == false :
			Projectilles1.global_position = $Marker2D.global_position 
		
		owner.add_child(Projectilles1)
		
		if Ratata_a_2_Gun == true:
			owner.add_child(Projectilles2)
			
		if Ratata_a_3_Gun == true:
			owner.add_child(Projectilles2)
			owner.add_child(Projectilles3)   
		
func default_shoot():
	Ratata_a_2_Gun = false
	Ratata_a_3_Gun = false


func Ratata_simple():
	$Ratata_with_2_Gun.start()
	if Ratata_a_3_Gun == true:
		Ratata_Spam()
	else:
		Ratata_a_2_Gun = true   


func Ennemis_touched():
	Ennemis_touch.emit()


func Ratata_Spam():
	$Ratata_with_3_Gun.start()
	Ratata_a_2_Gun = false
	Ratata_a_3_Gun = true
	
	
func Ratata_TimeOUt():
	default_shoot()


func _on_ratatata_timeout() -> void:
	Ratata_TimeOUt()


func _on_ratata_with_3_gun_timeout() -> void:
	Ratata_TimeOUt()


func _on_infinity_shoot_timeout() -> void:
	infinityShoot = false
