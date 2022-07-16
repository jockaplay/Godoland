extends Control

export(Array, NodePath) var archives
export(Array, NodePath) var items

func _on_Button_pressed():
	var tween = get_node("Tween")
	tween.interpolate_property($Panel, "rect_scale", Vector2(1, 1), Vector2(0, 0), 0.3, Tween.TRANS_BACK, Tween.EASE_IN)
	tween.interpolate_callback(self, .3, "hide")
	tween.start()
	get_parent().get_parent().get_node("Buttons").play()
func apear():
	var tween = get_node("Tween")
	tween.interpolate_callback(self, 0, "show")
	tween.interpolate_property($Panel, "rect_scale", Vector2(0, 0), Vector2(1, 1), 0.3, Tween.TRANS_BACK, Tween.EASE_OUT)
	tween.start()

func _process(_delta):
	for i in archives.size():
		get_node(archives[i]).visible = get_node(items[i]).visible
