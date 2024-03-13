class_name GhostCat
extends Item

@onready var player = get_node("/root/Node2D/Player")

var timer;

func _init():
	visuals = preload("res://characters/friendly/ghost_cat/ghost_cat_visual.tscn").instantiate()
	item_name = "Ghost Cat"

func _process(delta):
	timer += delta
	if timer > 10:
		player.heal_up(10)
