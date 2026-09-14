extends Node2D

@onready var Fill1 = $TextureProgressBar2

@onready var Boss = get_tree().get_first_node_in_group("Boss")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Boss == null :
		return
		
	assign_to_the_boss(Boss.Health)


func assign_to_the_boss(Boss):
	Fill1.value = Boss
