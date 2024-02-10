extends AnimatedSprite2D

func play_idle_animation():
	play("default")
	
	
func play_walk_animation():
	play("walk",3.0) 

func play_jump_animation():
	play("jump")
