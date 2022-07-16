extends Node2D

var amount = 0

func _ready():
	$Label.text = "+" + str(amount)
	randomize()
	var x = rand_range(-10, 10)
	var tw = $Tween
	tw.interpolate_property($Label, "rect_position", Vector2(x, 0), Vector2(x, -200), 2, Tween.TRANS_SINE, Tween.EASE_IN)
	tw.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, -.5), 2, Tween.TRANS_LINEAR, Tween.EASE_IN, .5)
	tw.start()
	
func _on_Tween_tween_completed(_object, _key):
	queue_free()
