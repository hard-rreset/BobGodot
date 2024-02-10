class_name TestBox
extends Actor

@onready var player = get_node("/root/testZone/Player")
var _mob_speed = move_speed

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	var direction = global_position.direction_to(player.global_position) 
	velocity.x = direction.x * _mob_speed/2	
	move_and_slide()



