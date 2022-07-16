extends Label


export(NodePath) var _follower
onready var follow = get_node(_follower) as Button

export(int) var _Max
var value = 0

func _process(_delta):
	text = str(value) + "/" + str(_Max)
	rect_position.y = follow.rect_global_position.y
	if value == _Max:
		self_modulate = Color(0.266667, 1, 0)
	visible = follow.visible
