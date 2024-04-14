@tool
extends Area3D

@export var brightness: float:
	get:
		return $MeshInstance3D.mesh.material.emission_energy_multiplier if get_node_or_null("MeshInstance3D") else 0.0
	set(value):
		if get_node_or_null("MeshInstance3D"):
			$MeshInstance3D.mesh.material.emission_energy_multiplier = value
