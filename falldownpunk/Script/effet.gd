extends Area2D
@onready var Sprite_visibility = $Sprite2D.visible
func timer_on():
	$Timer.one_shot = true
	Sprite_visibility = true

func _on_timer_timeout() -> void:
	Sprite_visibility = false
	
