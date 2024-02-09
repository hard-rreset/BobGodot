class_name Player
extends Actor

@onready var sprite = $PSprite
@onready var cast = $GroundCast

var _player_velocity = Vector2.ZERO

func _physics_process(_delta):
	if can_move == true:
		var direction = Input.get_vector("move_left","move_right","disabled","disabled")
		
		if direction.x < 1 and direction.x > 0:
			direction.x = 1
		elif direction.x < 0 and direction.x > - 1:
			direction.x = -1
		if -1 < direction.x and direction.x != 0:
			sprite.flip_h = true
		if  direction.x  <= -1 or direction.x < 0:
			sprite.flip_h = false
			
		_player_velocity = direction * SPEED
		apply_force(_player_velocity)
		
		if Input.is_action_pressed("jump") == true and is_jumping == false:
			var jump_vector = Vector2(0,-1) * JUMP_FORCE
			apply_force(jump_vector)
			is_jumping = true
		if cast.is_colliding():
			is_jumping = false
