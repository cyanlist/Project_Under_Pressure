extends Resource
class_name CharacterData

enum Sexuality {AROACE, AROMANTIC, ASEXUAL, DEMISEXUAL}

@export var id: StringName
@export var display_name: String
@export var sexuality: Sexuality
@export var start_affection: int = 50
const max_affection: int = 100
const min_affection: int = 0
@export var portrait_texture: Texture2D
const thresholds: Array = [0, 20, 50, 80]
