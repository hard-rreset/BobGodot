class_name Actor
extends CharacterBody2D

@export_group("Movement")
@export var move_speed : float = 250.0
@export var jump_force : float = 250.0
@export var gravity : float = 500.0

@export_group("Stats")
@export var max_health : int = 100
@export var health : int = max_health

@export var level : int = 1

@export var base_damage : int = 10
@export var damage : int = base_damage 

@export var items = []
@export var qty_items = []

@export_group("Toggles")
@export var can_move : bool = true

@onready var sprite = $Sprite 

@onready var level_up_label = preload("res://ui/level_up/level_up_label.tscn")


func cycle_items():
	for item in items:
		item.add_visuals(self)

func update_stats():
	move_speed += (0.30*move_speed/100) * level 
	jump_force += (0.05*jump_force/100) * level
	

func toggle_movement():
	can_move = false if can_move else true


func set_move_speed(speed):
	move_speed = speed

	
func take_damage(damage_to_take):
	health -= damage_to_take
	if health <= 0:
		queue_free()
	sprite.modulate = Color.AQUA
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = Color.WHITE


func heal_up(heal):
	if heal < 0 :
		heal = 1
	if heal+health > max_health:
		health = max_health
	else:
		health += heal	


func level_up(levels_to_up = 1):
	var level_text = level_up_label.instantiate()
	add_child(level_text)
	level += levels_to_up
	update_stats()

func add_item(item):
	var item_names = []
	if items.size() > 0:	
		for _item in items:
			var _item_name = _item.item_name
			if _item_name not in item_names:
				item_names.append(_item_name)
		if item.item_name in item_names:
			qty_items[item_names.find(item.item_name)] += 1
		else:
			items.append(item)
			qty_items.append(1)
	if items.size() <= 0:
		items.append(item)
		qty_items.append(1)
	cycle_items()
