class_name Player
extends Actor

const SPEED:int = 1500
const JUMP_FORCE:int = 3000

var max_health:int = 100
var health:int = max_health

var level:int = 1

var base_damage:int = 10
var damage:int = base_damage 

var can_move:bool = true
var is_jumping:bool = false

@onready var sprite = $PSprite
@onready var cast = $GroundCast

var _player_velocity = Vector2.ZERO


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


func _physics_process(_delta):
	if can_move == true:
		var direction = Input.get_vector("move_left","move_right","disabled","disabled")
		
		if -1 < direction.x and direction.x < 1 and direction.x != 0:
			sprite.flip_h = true
		if  direction.x  <= -1:
			sprite.flip_h = false
			
		_player_velocity = direction * SPEED  
		apply_force(_player_velocity)
		
	if Input.is_action_pressed("jump") == true and is_jumping == false:
		var jump_vector = Vector2(0,-1) * JUMP_FORCE
		print(jump_vector)
		apply_force(jump_vector)
		is_jumping = true
	if cast.is_colliding():
		is_jumping = false
