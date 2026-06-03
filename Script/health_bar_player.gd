extends Node2D

@onready var Fill1 = $Fill1
@onready var Fill2 = $Fill2
@onready var PFill1 = $Node2D2/Fill3
@onready var PFill2 = $Node2D2/Fill4
@onready var Yuzo = get_tree().get_first_node_in_group("Player")
@onready var Power = $Node2D

func _physics_process(delta: float) -> void:
	if Yuzo == null :
		return
	
	assign_to_the_player(Yuzo.Health)
	assign_shield_bar_to_player(Yuzo.Shield)
	
func assign_to_the_player(Player):
	Fill1.value = Player
	Fill2.value = Player
	
func assign_shield_bar_to_player(Player):
	PFill1.value = Player
	PFill2.value = Player
