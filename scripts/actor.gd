class_name Actor
extends RigidBody2D

var gravity = 20
var _velocity = Vector2.ZERO

func _physics_process(delta):
	_velocity.y += gravity * delta

