extends Node2D

var time = 0.0
var dir = true
var initied = false
var times = 0
var amount = 0
var partc = preload("res://Cenas/particles.tscn")
var nums = preload("res://Cenas/Popup.tscn")

func _ready():
	randomize()
	amount = int(rand_range(500, 8000))
	var tw = get_node("Tween")
	tw.interpolate_property(self, "scale", Vector2(0, 0), Vector2(1, 1), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tw.start()

func _process(delta):
	if initied:
		time += delta
		if time > 0.7:
			time = 0
			dir = !dir
			times += 1
		if dir:
			$Icon.scale += Vector2(0.01, 0.01)
		else:
			$Icon.scale -= Vector2(0.01, 0.01)
	if times >= 9:
		time = 0
		$Icon.scale = lerp($Icon.scale, Vector2(0, 0), delta)
		var tw = get_node("Tween")
		tw.interpolate_property(self, "scale", Vector2(1, 1), Vector2(-5, -5), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tw.interpolate_callback(self, 1, "queue_free")
		tw.start()

func _on_Tween_tween_completed(_object, _key):
	if initied == false:
		initied = true
	else:
		initied = false

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if (event.button_index == BUTTON_LEFT and event.is_pressed()):
			get_parent().score += amount
			var p = partc.instance()
			p.global_position = get_global_mouse_position()
			p.emitting = true
			var n = nums.instance()
			n.global_position = get_global_mouse_position()
			n.amount = amount
			get_parent().add_child(p)
			get_parent().add_child(n)
			get_parent().git()
			queue_free()
