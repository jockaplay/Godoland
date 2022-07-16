extends Node2D

var partc = preload("res://Cenas/particles.tscn")
var nums = preload("res://Cenas/Popup.tscn")

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if (event.button_index == BUTTON_LEFT and event.is_pressed()):
			get_parent().score += get_parent().click + get_parent().codigosPorSegundo
			var p = partc.instance()
			p.global_position = get_global_mouse_position()
			p.emitting = true
			var n = nums.instance()
			n.global_position = get_global_mouse_position()
			n.amount = get_parent().click + get_parent().codigosPorSegundo
			get_parent().add_child(p)
			get_parent().add_child(n)
			var tween = get_node("Tween")
			tween.interpolate_property(self, "scale", Vector2(2.7, 2.7), Vector2(2.5, 2.5), .3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			tween.start()
			var tween2 = get_node("Tween")
			tween2.interpolate_property(get_node("AudioStreamPlayer"), "volume_db", 0, -80, .3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			tween2.start()
