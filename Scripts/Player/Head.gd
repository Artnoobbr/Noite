extends Spatial

onready var Olho = $Olho
onready var Crosshair = $CanvasLayer/olho_container/crosshair
onready var Txt_interacao = $"CanvasLayer/MarginContainer/HBoxContainer2/VBoxContainer/Interação"

var crosshair1 = preload('res://Texturas/Crosshair_branco.png')
var crosshair2 = preload('res://Texturas/Crosshair_cinz.png')


func _physics_process(_delta):
	#Interação Script
	if Olho.is_colliding():
		var colidor = Olho.get_collider()
		match colidor.name:
			'Player':
				Crosshair.set_texture(crosshair1)
			'Roberto':
				Global.robertinho = true
				Crosshair.set_texture(crosshair2)
			'Roberto2':
				Global.robertinho2 = true
				Crosshair.set_texture(crosshair2)
			'Porta':
				Crosshair.set_texture(crosshair2)
				Global.Casa_MadeiraEST1 = true
				if Global.Abrindo_Porta == true:
					Txt_interacao.visible = false
				else:
					Txt_interacao.visible = true
			'Porta2':
				Crosshair.set_texture(crosshair2)
				Global.Casa_MadeiraEST1Saida = true
				if Global.Abrindo_Porta == true:
					Txt_interacao.visible = false
				else:
					Txt_interacao.visible = true
			'Cama':
				if Global.evento_interativo == false:
					Crosshair.set_texture(crosshair2)
					Global.Cama_Casa = true
					Txt_interacao.visible = true
				else:
					Crosshair.set_texture(crosshair2)
					Global.Cama_Casa = false
					Txt_interacao.visible = false
			'Jukebox':
				Crosshair.set_texture(crosshair2)
				Global.Jukebox = true
				Txt_interacao.visible = true
					
	else:
		Crosshair.set_texture(crosshair1)
		Global.Jukebox = false
		Global.robertinho = false
		Global.robertinho2 = false
		Global.Casa_MadeiraEST1 = false
		Global.Casa_MadeiraEST1Saida = false
		Global.Cama_Casa = false
		Txt_interacao.visible = false
