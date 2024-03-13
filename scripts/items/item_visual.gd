class_name  ItemVisual
extends AnimatedSprite2D


func play_idle_animation(move_speed):
	play("default",move_speed * 0.4/100)
	
	
func play_walk_animation(move_speed):
	play("walk",move_speed * 0.4/100) 

func play_jump_animation():
	play("jump")