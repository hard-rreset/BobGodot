class_name Player
extends Actor

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	velocity.x = 0
	
	if can_move == true:
			if Input.is_action_pressed("move_left"):
				velocity.x -= move_speed
				sprite.flip_h = true
			if Input.is_action_pressed("move_right"):
				velocity.x += move_speed
				sprite.flip_h = false
			if Input.is_action_pressed("jump") and is_on_floor():
				velocity.y = -jump_force
			move_and_slide()
			
			if velocity.x != 0.0:
				sprite.play_walk_animation(move_speed)
			else:
				sprite.play_idle_animation(move_speed)
			if velocity.y != 0.0:
				sprite.play_jump_animation()
