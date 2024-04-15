@tool
extends Area3D

@export var brightness: float:
	get:
		return $MeshInstance3D.mesh.material.emission_energy_multiplier if get_node_or_null("MeshInstance3D") else 0.0
	set(value):
		if get_node_or_null("MeshInstance3D"):
			$MeshInstance3D.mesh.material.emission_energy_multiplier = value

func summon_random(scene: PackedScene):
	for i in 10:
		var new_summon: = scene.instantiate() as CharacterBody3D
		new_summon.position = global_position + randf_range(0.0, $CollisionShape3D.shape.radius) * Vector3.FORWARD.rotated(Vector3.UP, randf_range(-PI, PI))
		new_summon.rotate_y(randf_range(-PI, PI))
		get_tree().get_first_node_in_group("SkeletonFolder").add_child(new_summon)
