extends Node3D

var skeleton_minion: = preload("res://prefabs/units/skeleton_minion.tscn")

func _ready():
	var tween: Tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_interval(1.0)
	tween.tween_property($FadeInLayer/FadeIn,"modulate:a", 0.0, 3.0)
	tween.tween_callback($FadeInLayer.queue_free)
	tween.tween_callback(show_menu)
	
func show_menu():
	GuiTransitions.show("main_menu")

func _on_start_pressed():
	GuiTransitions.hide("main_menu")
	$Pcams/GameplayPcam.set_priority(20)
	$Pcams/GameplayPcam.tween_completed.connect($World/SummoningCircle.summon_random.bind(skeleton_minion))
