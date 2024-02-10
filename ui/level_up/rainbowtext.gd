extends RichTextLabel

@export var colors = [Color.RED,
		  	  Color.GREEN,
		  	  Color.AQUA,
		  	  Color.REBECCA_PURPLE,
		  	  Color.BLUE_VIOLET,
		  	  Color.CRIMSON]
			
@export var values_to_move_x = [-80,80]

@export var range_to_text_rotation = [-55,55]

func _ready():
	randomize()
	modulate = colors[randi() % colors.size()]
	_tween_scale()
	_tween_rotate()
	_tween_move()
	_tween_modulate()
	


func _tween_scale():
	var tween = create_tween()
	tween.tween_property(self,'scale',Vector2(0.9,0.9),1)


func _tween_modulate():
	var tween = create_tween()
	tween.tween_property(self,'modulate',Color(1,1,1,0),1)
	tween.tween_property(self,'modulate',Color(1,1,1,0),1)
	await tween.finished
	queue_free()


func _tween_move():
	randomize()
	var tween = create_tween()
	var ran_x = randi() %  values_to_move_x.size()
	tween.tween_property(self,'position',Vector2( values_to_move_x[ran_x],-80), 1)


func _tween_rotate():
	randomize()
	var tween = create_tween()
	tween.tween_property(self,'rotation',deg_to_rad(randi_range(range_to_text_rotation[0],range_to_text_rotation[1])),1)
