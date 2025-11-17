extends GdUnitTestSuite

# Läuft einmal vor allen Tests
func before_all() -> void:
	# RelationshipManager muss im Autoload sein.
	# Wir setzen hier Test-Startwerte, damit jeder Test mit sauberem Zustand läuft.
	RelationshipManager.set_affection("alice", RelationshipManager._character_data["alice"].start_affection)
	RelationshipManager.set_affection("mitya", RelationshipManager._character_data["mitya"].start_affection)
	RelationshipManager.set_affection("raine", RelationshipManager._character_data["raine"].start_affection)

# -------------------------------------------------------------------
# TEST 1 – Startwerte korrekt?
# -------------------------------------------------------------------
func test_start_values() -> void:
	var ids = ["alice", "mitya", "raine"]

	for id in ids:
		var expected : int = RelationshipManager._character_data[id].start_affection
		var actual := RelationshipManager.get_affection(id)
		assert_int(actual).is_equal(expected)

# -------------------------------------------------------------------
# TEST 2 – Positive Änderung
# -------------------------------------------------------------------
func test_change_affection_positive() -> void:
	RelationshipManager.set_affection("alice", 0)
	RelationshipManager.change_affection("alice", 5)

	var result := RelationshipManager.get_affection("alice")
	assert_int(result).is_equal(5)

# -------------------------------------------------------------------
# TEST 3 – Negative Änderung
# -------------------------------------------------------------------
func test_change_affection_negative() -> void:
	RelationshipManager.set_affection("mitya", 0)
	RelationshipManager.change_affection("mitya", -10)

	var result := RelationshipManager.get_affection("mitya")
	assert_int(result).is_equal(0)

# -------------------------------------------------------------------
# TEST 4 – Setzen auf bestimmten Wert
# -------------------------------------------------------------------
func test_set_affection() -> void:
	RelationshipManager.set_affection("raine", 42)

	assert_int(RelationshipManager.get_affection("raine")).is_equal(42)

# -------------------------------------------------------------------
# TEST 5 – Min/Max Clamping
# -------------------------------------------------------------------
func test_clamping() -> void:
	var max_val :int = RelationshipManager._character_data["raine"].max_affection
	RelationshipManager.set_affection("raine", 9999)

	var result := RelationshipManager.get_affection("raine")
	assert_int(result).is_equal(max_val)

# -------------------------------------------------------------------
# TEST 6 – Ungültiger Charakter
# -------------------------------------------------------------------
func test_invalid_character() -> void:
	RelationshipManager.change_affection("does_not_exist", 15)

	# Er darf keinen Eintrag erzeugen
	var exists := RelationshipManager._affection.has("does_not_exist")

	assert_bool(exists).is_false()
