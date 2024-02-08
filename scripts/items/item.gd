class_name Item
extends Node
#ItemClass

var item_name : String = "Default_Item"
var description : String = "This is an item with no description."
var type:String = "Test"

func set_item_name(new_item_name):
	item_name = new_item_name

func get_item_name():
	return item_name

func get_description():
	return description


