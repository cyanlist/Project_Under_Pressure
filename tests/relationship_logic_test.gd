extends Node

# Läuft sofort los, sobald die Szene startet
func _ready() -> void:
	print("----- RelationshipManager Logic Test START -----")

	# Test 1: Startwerte anzeigen
	print("\n[Test 1] Startwerte aller Charaktere:")
	for id in ["alice", "mitya", "raine"]:
		var val = RelationshipManager.get_affection(id)
		print("  - %s: %d" % [id, val])

	# Test 2: Zuneigung erhöhen
	print("\n[Test 2] Increase affection (alice +5):")
	RelationshipManager.change_affection("alice", 5)
	print("  Neuer Wert alice:", RelationshipManager.get_affection("alice"))

	# Test 3: Zuneigung senken
	print("\n[Test 3] Decrease affection (mitya -10):")
	RelationshipManager.change_affection("mitya", -10)
	print("  Neuer Wert mitya:", RelationshipManager.get_affection("mitya"))

	# Test 4: Setzen auf bestimmten Wert
	print("\n[Test 4] Set affection (raine = 50):")
	RelationshipManager.set_affection("raine", 50)
	print("  Neuer Wert raine:", RelationshipManager.get_affection("raine"))

	# Test 5: Begrenzung testen (clamping)
	print("\n[Test 5] Clamp test (raine = 999):")
	RelationshipManager.set_affection("raine", 999)
	print("  Wert raine nach Clamp:", RelationshipManager.get_affection("raine"))

	# Test 6: Ungültiger Charakter
	print("\n[Test 6] Invalid character test:")
	RelationshipManager.change_affection("unknown", 15)

	print("\n----- RelationshipManager Logic Test END -----")
