extends Control

export(Array, NodePath) var _buttons
export(NodePath) var _godot
onready var godot = get_node(_godot) as TextureRect

func _ready():
	OS.window_fullscreen = true
	randomize()
	get_node(_buttons[0]).grab_focus()

func _process(_delta):
	for i in _buttons.size():
		var a = get_node(_buttons[i])
		if a.is_hovered():
			get_node("Menu/TextureRect").rect_global_position = a.rect_global_position + Vector2(-get_node("Menu/TextureRect").rect_size.x * 1.7, get_node("Menu/TextureRect").rect_size.y / 1)
			a.grab_focus()

func _on_TextureRect2_mouse_entered():
	var tween = get_node("Tween")
	tween.interpolate_property(godot, "rect_scale", Vector2(0, 0), Vector2(1, 1), .3, Tween.TRANS_BACK, Tween.EASE_OUT)
	tween.start()
	godot.rect_global_position = Vector2(rand_range(100, 1187), rand_range(81, 637))
	get_node("TextureRect2/Pop").play()

func _on_Jogar_pressed():
	var _mudarCena = get_tree().change_scene("res://Cenas/Clicker.tscn")

func _on_Sair_pressed():
	OS.window_fullscreen = !OS.window_fullscreen

func _on_ComoJogar_pressed():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "rect_global_position", Vector2(self.rect_global_position.x, 0), Vector2(self.rect_global_position.x - get_node("Como jogar").rect_global_position.x, 0), .3, Tween.TRANS_BACK, Tween.EASE_OUT)
	tween.start()

func _on_Voltar_pressed():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "rect_global_position", Vector2(self.rect_global_position.x, 0), Vector2(0, 0), .3, Tween.TRANS_BACK, Tween.EASE_OUT)
	tween.start()


func _on_Jam_pressed():
	var tween = get_node("Tween")
	tween.interpolate_property($Panel, "rect_scale", Vector2(0, 0), Vector2(1, 1), .3, Tween.TRANS_BACK, Tween.EASE_OUT)
	tween.start()
	$Panel.show()
	$fundoo.show()


func _on_Close_pressed():
	var tween = get_node("Tween")
	tween.interpolate_property($Panel, "rect_scale", Vector2(1, 1), Vector2(0, 0), .3, Tween.TRANS_BACK, Tween.EASE_IN)
	tween.interpolate_callback($Panel, .3, "hide")
	tween.interpolate_callback($fundoo, .3, "hide")
	tween.start()
