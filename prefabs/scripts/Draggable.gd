extends Node

func _ready():
	get_parent().input_event.connect(_on_input_event)
	
func _on_input_event(camera: Node, event: InputEvent, position: Vector3, normal: Vector3, shape_idx: int):
	if event is InputEventMouseButton:
		pass
	elif event is InputEventMouseMotion:
		if event.button_mask != 0: # if any button is pressed
			get_tree().get_first_node_in_group("Setpoint").global_position = position
			get_parent().global_position = position
			get_parent().global_position.y = 0.0
		
