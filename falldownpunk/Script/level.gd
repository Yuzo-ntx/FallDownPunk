extends Node2D

@onready var score = $Label
@onready var score_ennemi_showed = $Label2

var yuzo_is_alive = true
var Score = 0
var score_ennemi = 0


func _on_timer_timeout() -> void:
	if yuzo_is_alive:
		Score += 1
		score.text = "PUNkSHIT: " + str(Score)


func _on_yuzo_dead() -> void:
	yuzo_is_alive = false
	$GameOver_Bar.visible = true


func MarkScore():
	score_ennemi += 1
	$Label2.text = str(score_ennemi) + " KILL"
