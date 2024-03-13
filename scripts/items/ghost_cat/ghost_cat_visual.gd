extends CharacterBody2D

@onready var player = get_node("/root/Node2D/Player")

var timer = 0
var speed = 120
var rotation_speed = PI

var ran_y = 1
var ran_rotation_lft = 0
var ran_rotation_rgt = 0
@onready var sprite = $GhostCatVisual

@export var values_to_move_y = [0,-4,5]
@export var values_rotation_right = [390.0,195]
@export var values_rotation_left = [-390.0,-195.0]


var _sprite_angle
var flip_h :bool;

# I should've coded this better, need to rework this later dang ghost cat. 
func play_jump_animation():
	return null

func play_idle_animation(move_speed):
	return null

func play_walk_animation(move_speed):
	return null

func _physics_process(delta):
		
		timer += delta
		# print(timer)
		sprite.play("default")
	
		if timer > 0.56:
			ran_y = randi() %  values_to_move_y.size()
			ran_rotation_lft = randi() % values_rotation_left.size()
			ran_rotation_rgt = randi() % values_rotation_right.size()
			timer = 0
	

		var target_x = player.global_transform.origin.x +31 if player.sprite.flip_h else player.global_transform.origin.x -31
		var target_y = lerp(player.global_transform.origin.y,player.global_transform.origin.y + values_to_move_y[ran_y],0.5)
	
		
		var target = Vector2(target_x,target_y)
		
		var direction = global_position.direction_to(target)
		var distance = global_position.distance_to(target)

		var max_speed = (distance / delta)
		var max_angle = rotation_speed * delta



		velocity = direction * minf(speed, max_speed)
		# print(direction.x)

		if direction.x < 0 or (player.sprite.flip_h and direction.x == 0):
			_sprite_angle = sprite.global_rotation

			var angle =  lerp_angle(_sprite_angle,values_rotation_left[ran_rotation_lft], 1)
			angle = clamp(angle, _sprite_angle - max_angle, _sprite_angle + max_angle)
			
			sprite.rotation = angle

			sprite.flip_h = true

		else :
			_sprite_angle = sprite.global_rotation

			var angle =  lerp_angle(_sprite_angle,values_rotation_right[ran_rotation_rgt], 1)
			angle = clamp(angle, _sprite_angle - max_angle, _sprite_angle + max_angle)

			sprite.rotation = angle

			sprite.flip_h = false

		move_and_slide()
