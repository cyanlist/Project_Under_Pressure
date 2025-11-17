extends Node

# TODO: Implement thresholds to determine the relation status to all datable characters in the end

signal affection_changed(character_id: StringName, new_value: int)

var _affection: Dictionary = {}
var _character_data: Dictionary = {}

# ---
func _ready() -> void:
	_register_character(load("res://data/characters/alice.tres"))
	_register_character(load("res://data/characters/mitya.tres"))
	_register_character(load("res://data/characters/raine.tres"))
	_register_character(load("res://data/characters/steph.tres"))

# Load data of one datable character into service and set initial values
func _register_character(data: CharacterData) -> void:
	var id := data.id
	_character_data[id] = data
	_affection[id] = data.start_affection

func get_affection(character_id: StringName) -> int:
	return _affection.get(character_id, 0)

func set_affection(character_id: StringName, value: int) -> void:
	if not _character_data.has(character_id):
		push_warning("Character '%s' ist nicht registriert." % character_id)
		return
	var data: CharacterData = _character_data[character_id]
	var clamped : int = clamp(value, data.min_affection, data.max_affection)
	_affection[character_id] = clamped
	emit_signal("affection_changed", character_id, clamped)

func change_affection(character_id: StringName, delta: int) -> void:
	var current := get_affection(character_id)
	set_affection(character_id, current + delta)
