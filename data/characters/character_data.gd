extends Resource
class_name CharacterData

@export var id: StringName
@export var display_name: String
@export var start_affection: int = 50
@export var max_affection: int = 100
@export var min_affection: int = 0
@export var portrait_texture: Texture2D
@export var thresholds: Dictionary = {} # TODO: [ -20, 20, 50, 80 ]
