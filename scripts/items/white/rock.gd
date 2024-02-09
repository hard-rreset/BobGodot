extends Item

@onready var shape = $ItemHitbox

@export var health = 2
@export var speed = 200
@export var damage = 20

func _ready():
	item_name = "rock"
	description = "A rock that for some reason helps you dodge"
	type = "mixed"




func _on_player_body_entered(body):
		print("hit")
