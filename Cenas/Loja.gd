extends Panel

export(NodePath) var _Aba
onready var aba = get_node(_Aba) as Button

export(NodePath) var _Numeros
onready var nums = get_node(_Numeros) as Panel

onready var Clicker = get_parent().get_parent()

export(NodePath) var _preco_clicker
onready var clic = get_node(_preco_clicker) as Label
export(NodePath) var _clicker1
onready var clic1 = get_node(_clicker1) as Label

export(NodePath) var _preco_programador
onready var prog = get_node(_preco_programador) as Label
export(NodePath) var _programador1
onready var prog1 = get_node(_programador1) as Label

export(NodePath) var _preco_pecas
onready var pecas = get_node(_preco_pecas) as Label
export(NodePath) var _pecas1
onready var pecas1 = get_node(_pecas1) as Label

export(NodePath) var _preco_xicaras
onready var xicaras = get_node(_preco_xicaras) as Label
export(NodePath) var _xicaras1
onready var xicaras1 = get_node(_xicaras1) as Label

export(NodePath) var _preco_itch
onready var itch = get_node(_preco_itch) as Label
export(NodePath) var _itch1
onready var itch1 = get_node(_itch1) as Label

export(NodePath) var _preco_empresa
onready var empresa = get_node(_preco_empresa) as Label
export(NodePath) var _empresa1
onready var empresa1 = get_node(_empresa1) as Label

export(NodePath) var _preco_hacker
onready var hacker = get_node(_preco_hacker) as Label
export(NodePath) var _hacker1
onready var hacker1 = get_node(_hacker1) as Label

export(NodePath) var _preco_Bcentral
onready var Bcentral = get_node(_preco_Bcentral) as Label
export(NodePath) var _Bcentral1
onready var Bcentral1 = get_node(_Bcentral1) as Label

export(NodePath) var _preco_PF
onready var PF = get_node(_preco_PF) as Label
export(NodePath) var _PF1
onready var PF1 = get_node(_PF1) as Label

export(NodePath) var _preco_Gov
onready var gov = get_node(_preco_Gov) as Label
export(NodePath) var _Gov1
onready var gov1 = get_node(_Gov1) as Label

export(NodePath) var _preco_FBI
onready var FBI = get_node(_preco_FBI) as Label
export(NodePath) var _FBI1
onready var FBI1 = get_node(_FBI1) as Label

export(NodePath) var _preco_Interpol
onready var interpol = get_node(_preco_Interpol) as Label
export(NodePath) var _interpol1
onready var interpol1 = get_node(_interpol1) as Label

export(NodePath) var _preco_dominion
onready var dominion = get_node(_preco_dominion) as Label
export(NodePath) var _dominion1
onready var dominion1 = get_node(_dominion1) as Label

var abaText = "<<"

var MaxClick = 20
var MaxProgs = 20
var MaxPecas = 17
var MaxXicar = 10
var MaxItch = 10
var MaxEmpresa = 5
var MaxHacker = 5
var MaxBcentral = 5
var MaxPF = 5
var MaxGov = 5
var MaxFBI = 3
var MaxInterpol = 3
var MaxMundo = 1

func _ready():
	aba.text = abaText

func _process(_delta):
	clic1._Max = str(MaxClick)
	clic1.value = str(Clicker.click)
	prog1._Max = str(MaxProgs)
	prog1.value = str(Clicker.programadores)
	pecas1._Max = str(MaxPecas)
	pecas1.value = str(Clicker.pecas)
	xicaras1._Max = str(MaxXicar)
	xicaras1.value = str(Clicker.xicaras)
	itch1._Max = str(MaxItch)
	itch1.value = str(Clicker.itch)
	empresa1._Max = str(MaxEmpresa)
	empresa1.value = str(Clicker.empresa)
	hacker1._Max = str(MaxHacker)
	hacker1.value = str(Clicker.hacker)
	Bcentral1._Max = str(MaxBcentral)
	Bcentral1.value = str(Clicker.bcentral)
	PF1._Max = str(MaxPF)
	PF1.value = str(Clicker.pf)
	gov1._Max = str(MaxGov)
	gov1.value = str(Clicker.gov)
	FBI1._Max = str(MaxFBI)
	FBI1.value = str(Clicker.fbi)
	interpol1._Max = str(MaxInterpol)
	interpol1.value = str(Clicker.interpol)
	dominion1._Max = str(MaxMundo)
	dominion1.value = str(Clicker.domina)
	_max_values()

func _on_Button_pressed():
	$"../../Buttons".play()
	if abaText == "<<":
		var tween = get_node("Tween")
		tween.interpolate_property(nums, "rect_position", Vector2(0, 0), Vector2(-100, 0), .3, Tween.TRANS_BACK, Tween.EASE_OUT)
		tween.start()
		aba.disabled = true
	elif abaText == ">>":
		var tween = get_node("Tween")
		tween.interpolate_property(nums, "rect_position", Vector2(-100, 0), Vector2(0, 0), .3, Tween.TRANS_BACK, Tween.EASE_IN)
		tween.start()
		aba.disabled = true

func _on_Tween_tween_all_completed():
	if abaText == "<<":
		abaText = ">>"
		aba.text = abaText
		aba.disabled = false
	elif abaText == ">>":
		abaText = "<<"
		aba.text = abaText
		aba.disabled = false

func multiplicador(item, value):
	if item.text != "Max":
		var _item = int(item.text) * value
		Clicker.score -= int(item.text)
		item.text = str(_item)
		get_node("botoes").play()
	
func _max_values():
	if Clicker.programadores == MaxProgs:
		prog.text = "Max"
		prog.modulate = Color(1, 0.5, 0)
	if Clicker.click == MaxClick:
		clic.text = "Max"
		clic.modulate = Color(1, 0.5, 0)
	if Clicker.pecas == MaxPecas:
		pecas.text = "Max"
		pecas.modulate = Color(1, 0.5, 0)
	if Clicker.xicaras == MaxXicar:
		xicaras.text = "Max"
		xicaras.modulate = Color(1, 0.5, 0)
	if Clicker.itch == MaxItch:
		itch.text = "Max"
		itch.modulate = Color(1, 0.5, 0)
	if Clicker.empresa == MaxEmpresa:
		empresa.text = "Max"
		empresa.modulate = Color(1, 0.5, 0)
	if Clicker.hacker == MaxHacker:
		hacker.text = "Max"
		hacker.modulate = Color(1, 0.5, 0)
	if Clicker.bcentral == MaxBcentral:
		Bcentral.text = "Max"
		Bcentral.modulate = Color(1, 0.5, 0)
	if Clicker.pf == MaxPF:
		PF.text = "Max"
		PF.modulate = Color(1, 0.5, 0)
	if Clicker.gov == MaxGov:
		gov.text = "Max"
		gov.modulate = Color(1, 0.5, 0)
	if Clicker.fbi == MaxFBI:
		FBI.text = "Max"
		FBI.modulate = Color(1, 0.5, 0)
	if Clicker.interpol == MaxInterpol:
		interpol.text = "Max"
		interpol.modulate = Color(1, 0.5, 0)
	if Clicker.domina == MaxMundo:
		dominion.text = "Max"
		dominion.modulate = Color(1, 0.5, 0)

func _on_Programadores_pressed():
	if Clicker.score >= int(prog.text) and prog.text != "Max":
		multiplicador(prog, 1.3)
		Clicker.programadores += 1
	
func _on_Editor_pressed():
	if Clicker.score >= int(clic.text) and clic.text != "Max":
		multiplicador(clic, 1.3)
		Clicker.click += 1
	
func _on_peca_pressed():
	if Clicker.score >= int(pecas.text) and pecas.text != "Max":
		if Clicker.pecas == 0:
			get_node("../Archiviment").apear("Agora o godot abre em 1,5 sec!")
		multiplicador(pecas, 1.2)
		Clicker.pecas += 1

func _on_xicara_pressed():
	if Clicker.score >= int(xicaras.text) and xicaras.text != "Max":
		if Clicker.xicaras == 0:
			get_node("../Archiviment").apear("Os programadores estão inspirados agora!")
		multiplicador(xicaras, 1.3)
		Clicker.xicaras += 1

func _on_itchio_pressed():
	if Clicker.score >= int(itch.text) and itch.text != "Max":
		if Clicker.itch == 0:
			get_node("../Archiviment").apear("Você acaba de ter acesso a uma base gigante de códigos!")
			Clicker.noticias.remove(2)
			Clicker.noticias.append("O site famoso de jogos indie itch.io acaba de ser invadido e teve alguns de seus jogos expostos à comunidade.")
		multiplicador(itch, 1.3)
		Clicker.itch += 1

func _on_empresa_pressed():
	if Clicker.score >= int(empresa.text) and empresa.text != "Max":
		if Clicker.empresa == 0:
			get_node("../Archiviment").apear("Ninguém sabe onde é, mas você cresce cada vez mais!")
			Clicker.noticias.remove(0)
			Clicker.noticias.append("População dos Estados Unidos pensam ter seu site invadido pela Rússia.")
		multiplicador(empresa, 1.2)
		Clicker.empresa += 1


func _on_hacker_pressed():
	if Clicker.score >= int(hacker.text) and hacker.text != "Max":
		if Clicker.hacker == 0:
			get_node("../Archiviment").apear("Sua causa ganha poder!")
			Clicker.noticias.remove(0)
			Clicker.noticias.append("Rússia se defende dizendo não saber do que estam falando.")
		multiplicador(hacker, 1.2)
		Clicker.hacker += 1


func _on_Bcentral_pressed():
	if Clicker.score >= int(Bcentral.text) and Bcentral.text != "Max":
		if Clicker.bcentral == 0:
			get_node("../Archiviment").apear("Dinheiro ajuda, não?")
			Clicker.noticias.remove(0)
			Clicker.noticias.append("Banco Central invadido esta tarde, população brasileira em choque com esta situação. (Estudiosos pensam estar relacionado com a invasão do site de jogos indie.)")
		multiplicador(Bcentral, 1.2)
		Clicker.bcentral += 1


func _on_PF_pressed():
	if Clicker.score >= int(PF.text) and PF.text != "Max":
		if Clicker.pf == 0:
			get_node("../Archiviment").apear("Quem pode parar uma ideia?")
			Clicker.noticias.remove(0)
			Clicker.noticias.append("Líderes mundiais ficam em alerta com um possível ataque mundial. População diz ser o novo salvador da economia.")
		multiplicador(PF, 1.2)
		Clicker.pf += 1


func _on_Gov_pressed():
	if Clicker.score >= int(gov.text) and gov.text != "Max":
		if Clicker.gov == 0:
			get_node("../Archiviment").apear("Este país já é seu! Curvam-se à você.")
			Clicker.noticias.remove(0)
			Clicker.noticias.append("GOVERNO BRASILEIRO CAI! Um grupo de hackers auto-declarados GodoTeam dominaram todas as formas de tecnologia do Brasil.")
		multiplicador(gov, 1.2)
		Clicker.gov += 1


func _on_FBI_pressed():
	if Clicker.score >= int(FBI.text) and FBI.text != "Max":
		if Clicker.fbi == 0:
			get_node("../Archiviment").apear("Espera, qual é o seu objetivo aqui?")
			Clicker.noticias.remove(0)
			Clicker.noticias.append("O mundo está em choque! Seu salvador se mostra ser um verdadeiro vilão de ficção científica.")
		multiplicador(FBI, 1.2)
		Clicker.fbi += 1


func _on_Interpol_pressed():
	if Clicker.score >= int(interpol.text) and interpol.text != "Max":
		if Clicker.interpol == 0:
			get_node("../Archiviment").apear("O mundo não pode ser monopolizado assim! PARE!!!")
			Clicker.noticias.remove(0)
			Clicker.noticias.append("Agentes americanos proclamam estado de emergência mundial: 'ninguém consegue parar essa força malígna, são muitas linhas de código.'")
		multiplicador(interpol, 1.2)
		Clicker.interpol += 1


func _on_Dominacao_pressed():
	if Clicker.score >= int(dominion.text) and dominion.text != "Max":
		if Clicker.domina == 0:
			get_node("../Archiviment").apear("Você conseguiu. É tudo seu agora! Que Deus nos ajude...")
			Clicker.noticias.remove(0)
			Clicker.noticias.append("Toda a economia mundial acaba de ser transferida para uma conta na suíça, nada mais pode ser feito, todos estamos falidos, esta é a última transmissão de nosso jornal. Foi um prazer...")
		multiplicador(dominion, 1.2)
		Clicker.domina += 1
		yield(get_tree().create_timer(8),"timeout")
		get_node("../Panel").apear()
