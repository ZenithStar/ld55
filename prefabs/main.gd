extends Node

func _ready():
	var tween: Tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property($FadeInLayer/FadeIn,"modulate:a", 0.0, 3.0)
	tween.tween_callback($FadeInLayer.queue_free)
	tween.tween_callback(show_menu)
	
func show_menu():
	pass
