extends Node2D # TODO or Contrl -> depends on if UI or not 
class_name Character

@export var data: CharacterData

func _ready() -> void:
	if data:
		var portrait_node := $Portrait
		portrait_node.texture = data.portrait_texture
	else:
		push_warning("Character '%s' hat keine CharacterData zugewiesen." % name)

func get_id() -> StringName:
	return data.id if data else StringName("")
