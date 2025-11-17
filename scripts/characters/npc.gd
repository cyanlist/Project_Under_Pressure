extends Character

@export var is_datable: bool = true

func get_current_affection() -> int:
	if not data:
		return 0
	return RelationshipManager.get_affection(data.id)

func on_player_interact() -> void:
	# Beispiel: Basis-Reaktion bei Interaktion
	# (Konkrete Logik passiert eher im Dialogsystem)
	print("%s spricht mit dir. Aktuelle Zuneigung: %d" % [data.display_name, get_current_affection()])
