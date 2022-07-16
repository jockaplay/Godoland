extends Node2D

export(NodePath) var _Pontos
onready var points = get_node(_Pontos) as Label

export(NodePath) var _Frequencia
onready var rate = get_node(_Frequencia) as Label

export(NodePath) var texto_da_noticia
onready var noticeText = get_node(texto_da_noticia) as Label

export(Array, String) var noticias
var noticias_legth = 0

var timeSec = 1
var frequencia = 1

onready var special = preload("res://Cenas/Github.tscn")

onready var itemsDaLoja = ["CanvasLayer/Loja/VBoxContainer/ScrollContainer/Items/Editor","CanvasLayer/Loja/VBoxContainer/ScrollContainer/Items/Programadores","CanvasLayer/Loja/VBoxContainer/ScrollContainer/Items/peças","CanvasLayer/Loja/VBoxContainer/ScrollContainer/Items/xicara","CanvasLayer/Loja/VBoxContainer/ScrollContainer/Items/itchio","CanvasLayer/Loja/VBoxContainer/ScrollContainer/Items/empresa","CanvasLayer/Loja/VBoxContainer/ScrollContainer/Items/hacker","CanvasLayer/Loja/VBoxContainer/ScrollContainer/Items/Bcentral","CanvasLayer/Loja/VBoxContainer/ScrollContainer/Items/PF","CanvasLayer/Loja/VBoxContainer/ScrollContainer/Items/Gov","CanvasLayer/Loja/VBoxContainer/ScrollContainer/Items/FBI","CanvasLayer/Loja/VBoxContainer/ScrollContainer/Items/Interpol","CanvasLayer/Loja/VBoxContainer/ScrollContainer/Items/Dominacao"]

var score = 0
var codigosPorSegundo = 0
var score0 = 0
var score1 = 0
var score2 = 0
var score3 = 0
var score4 = 0
var score5 = 0
var score6 = 0
var score7 = 0
var score8 = 0
var click = 1
var programadores = 0
var pecas = 0
var xicaras = 0
var itch = 0
var empresa = 0
var hacker = 0
var bcentral = 0
var pf = 0
var gov = 0
var fbi = 0
var interpol = 0
var domina = 0

var tempo = 1
var acabou = false

func _ready():
	$Special.start(rand_range(50, 80))

func _physics_process(delta):
	tempo = (1 - (xicaras * 0.05) - (hacker * 0.065))
	if timeSec > 0:
		timeSec -= delta
	else:
		timeSec = tempo
		score0 = (1 * (programadores * 3))
		score1 = (1 * (pecas * 4.5))
		score2 = (itch * 5)
		score3 = (empresa * 6.5)
		score4 = (bcentral * 7)
		score5 = (pf * 8)
		score6 = (gov * 9)
		score7 = (fbi * 15)
		score8 = (interpol * 20)
		codigosPorSegundo = score0 + score1 + score2 + score3 + score4 + score5 + score6 + score7 + score8
	get_node("porSegundo").wait_time = tempo

func _process(_delta):
	if pecas > 0:
		get_node(itemsDaLoja[3]).visible = true
	if xicaras > 0:
		get_node(itemsDaLoja[4]).visible = true
	if itch > 0:
		get_node(itemsDaLoja[5]).visible = true
	if empresa > 0:
		get_node(itemsDaLoja[6]).visible = true
	if hacker > 0:
		get_node(itemsDaLoja[7]).visible = true
	if bcentral > 0:
		get_node(itemsDaLoja[8]).visible = true
	if pf > 0:
		get_node(itemsDaLoja[9]).visible = true
	if gov > 0:
		get_node(itemsDaLoja[10]).visible = true
	if fbi > 0:
		get_node(itemsDaLoja[11]).visible = true
	if interpol > 0:
		get_node(itemsDaLoja[12]).visible = true
	rate.text = str(int(codigosPorSegundo / tempo))
	noticeText.text = str(noticias[0]) + " " + str(noticias[1]) + " " + str(noticias[2])
	points.text = str(int(score))

func _on_Noticias_timeout():
	roll_text()

func roll_text():
	var tween = get_node("Tween")
	tween.interpolate_property(noticeText, "rect_position" ,Vector2(0, 0), Vector2(-noticeText.rect_size.x, 0), 0.01 * noticeText.rect_size.x,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	yield(tween,"tween_all_completed")
	noticeText.rect_position = Vector2(0,0)
	get_node("Noticias").start()

func _on_Button_pressed():
	$Buttons.play()
	$CanvasLayer/Achives.apear()

func _on_Menu_pressed():
	var _menu = get_tree().change_scene("res://Cenas/Menu.tscn")

func _on_porSegundo_timeout():
	score += codigosPorSegundo

func git():
	$Git.play()

func _on_Special_timeout():
	var a = special.instance()
	a.global_position = Vector2(rand_range(20, 800), rand_range(20, 800))
	call_deferred("add_child", a)
	$Special.start(rand_range(50, 80))
