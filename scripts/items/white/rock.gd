extends Item

@onready var shape = $ItemHitbox

var health = 2
var speed = 200
var damage = 20

func _ready():
	item_name = "rock"
	description = "A rock that for some reason helps you dodge"
	type = "mixed"


