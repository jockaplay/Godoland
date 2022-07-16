extends Panel

func apear():
	visible = true
	var tween = get_node("Tween")
	tween.interpolate_property(self, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1,Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.start()
	yield(tween, "tween_completed")
	tween.interpolate_property(get_node("Label3"), "percent_visible", 0, 1, 20, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	yield(get_tree().create_timer(10),"timeout")
	get_node("Sair").visible = true
	get_node("Sair2").visible = true
	
func _on_Sair_pressed():
	var _mudaCena = get_tree().change_scene("res://Cenas/Menu.tscn")
