class_name Item
#ItemClass

var name : String = "Default_Item"
var description : String = "This is an item with no description."


func _init(name, description):
	self.name = name
	self.description = description


func get_name():
	return name


func get_description():
	return description


