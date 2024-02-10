class_name Item
extends Node
#ItemClass

var item_name : String 
var description : String 
var type : String 
var visuals

func set_item_description(new_item_description):
	description = new_item_description

func set_item_name(new_item_name):
	item_name = new_item_name

func get_item_name():
	return item_name

func get_description():
	return description

func add_visuals(parent,visuals):
	parent.add_child(visuals)
	
func get_visuals():
	return visuals

