class_name Actor
extends CharacterBody2D

@export_group("Movement")
@export var move_speed : float = 250.0
@export var jump_force : float = 350.0
@export var gravity : float = 500.0

@export_group("Stats")
@export var max_health : int = 100
@export var health : int = max_health

@export var level : int = 1

@export var base_damage : int = 10
@export var damage : int = base_damage 

@export var items = []

@export_group("Toggles")
@export var can_move : bool = true

@onready var sprite = $Sprite 


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
	level += levels_to_up
	update_stats()

	
