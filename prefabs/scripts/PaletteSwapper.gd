extends Node

func _ready():
	if not get_parent().has_user_signal("faction_changed"):
		get_parent().add_user_signal("faction_changed")
	get_parent().connect("faction_changed", _on_faction_changed)

func _on_faction_changed():
	get_parent().find_children("*", "MeshInstance3D")
