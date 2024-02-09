class_name Actor
extends RigidBody2D

const SPEED:int = 1500
const JUMP_FORCE:int = 4500

var max_health:int = 100
var health:int = max_health

var level:int = 1

var base_damage:int = 10
var damage:int = base_damage 

var can_move:bool = true
var is_jumping:bool = false

var gravity:int = 20
var _velocity:Vector2 = Vector2.ZERO


func toggleMove():
	can_move = false if can_move else true


func _physics_process(delta):
	_velocity.y += gravity * delta

