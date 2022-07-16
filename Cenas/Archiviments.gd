extends Panel

var text = "Archiviment"
var close = false

func _process(_delta):
	get_node("HBoxContainer/Label").text = text

func apear(_text):
	yield(get_tree().create_timer(.4),"timeout")
	text = _text
	var tween = get_node("Tween")
	tween.interpolate_property(self, "rect_position", Vector2(465.5, -90), Vector2(465.5, 0), .5, Tween.TRANS_BACK, Tween.EASE_OUT)
	tween.start()
	get_node("Notification").play()
	get_node("Timer").start(3)

func disapear():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "rect_position", self.rect_position, Vector2(465.5, -90), .5, Tween.TRANS_BACK, Tween.EASE_IN)
	tween.start()
	get_node("Timer").stop()
	
func _on_Button_pressed():
	close = true
	get_node("Timer").stop()
	disapear()

func _on_Timer_timeout():
	disapear()
