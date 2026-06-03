extends Node2D

@onready var score = $CanvasLayer/Label
@onready var score_ennemi_showed = $CanvasLayer/Label2
@onready var Player_Health_Bar = $HealthBarAsteroid
@onready var Player = $Player/Yuzo
@onready var Menu = $Menu
@onready var kill = $Label2


var yuzo_is_alive = true
var Score = 0
var score_ennemi = 0
var damage_of_small_asteroid_over_yuzo_on_asteroid_exited_screen = 5
var damage_of_Big_asteroid_over_yuzo_on_asteroid_exited_screen = 20

func _physics_process(delta: float) -> void:
	#get_tree().current_scene.get_tree().paused = false
	if yuzo_is_alive :
		ShowLookSunder()

func _on_timer_timeout() -> void:
	if yuzo_is_alive == true:
		Score += 1 
		score.text = "PUNkSHIT: " + str(Score)
		$Player/Yuzo.get_shield(0.5)
		return

func _on_yuzo_dead() -> void:
	yuzo_is_alive = false
	$GameOver_Bar.visible = true
	await get_tree().create_timer(2).timeout
	get_tree().paused = true

func Yuzo_get_small_damage():
	#a fonction to make damage on a player when an asteroid exite the screen
	$Player/Yuzo.take_damage_second_way(damage_of_small_asteroid_over_yuzo_on_asteroid_exited_screen)

func Yuzo_get_Big_damage():
	#a fonction to make damage on a player when an asteroid exit the screen
	$Player/Yuzo.take_damage_second_way(damage_of_Big_asteroid_over_yuzo_on_asteroid_exited_screen)

func MarkScore():
	if yuzo_is_alive == true:
		score_ennemi += 1
		$CanvasLayer/Label2.text ="KILL: " + str(score_ennemi)
		$Player/Yuzo.get_power(5)

func get_shield():
	$Player/Yuzo.get_shield(1)

func connect_health_bar_to_the_player():
	$HealthBarAsteroid.assign_to_the_player($Player/Yuzo.Health)

func connect_power_bar_to_player():
	$Node2D.assign_to_the_player($Player/Yuzo.Shield)

func ShowLookSunder():
	if $Player/Yuzo.Shield == 100 :
		$BoltGold.visible = true
	else:
		$BoltGold.visible = false

func Stop_pause():
	get_tree().paused = false
	get_tree().paused = false

func Show_Setting(Active):
	$CanvasLayer/Label2.visible = Active
	$CanvasLayer/Label.visible = Active

func _on_resume_pressed() -> void:
	get_tree().paused = false

func _on_button_pressed() -> void:
	$Menu._on_pause_pressed()
	$Button.visible = false
	$Button.visible = true
