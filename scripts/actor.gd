class_name Actor
extends CharacterBody2D

var move_speed : float = 250.0
var jump_force : float = 350.0
var gravity : float = 500.0

var max_health : int = 100
var health : int = max_health

var level : int = 1

var base_damage : int = 10
var damage : int = base_damage 

var can_move : bool = true

var items = []

@onready var sprite = $Sprite 


func update_stats():
	move_speed += (5*move_speed/100) * level 
	# need to cap this, or else it goes up forever
	


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
