class_name Player
extends Actor

const SPEED : int = 1500
const JUMP_FORCE : int = 3000

var max_health : int = 100
var health : int = max_health

var xp_to_level : int = 100
var current_xp : int = 0
var level : int = 1

var base_damage : int = 10
var damage : int = base_damage 

var can_move : bool = true
var is_jumping : bool = false


#func updateStats():
#    for item in items:
#        if item.type == "weapon":
#            damage += item.damage
#        if item.type == "armor":
#            max_health += item.health
#            health += item.health
#        if item.type == "speed":
#            SPEED += item.speed
#        if item.type == "mixed":
#            damage += item.damage
#            max_health += item.health
#            health += item.health

func toggleMove():
	can_move = false if can_move else true

var _player_velocity = Vector2.ZERO

func _physics_process(delta):
	if can_move == true:
		var direction = Input.get_vector("move_left","move_right","disabled","disabled")
		_player_velocity = direction * SPEED 
		apply_force(_player_velocity)
