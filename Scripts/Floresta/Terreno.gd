extends Spatial

onready var Environment_Terreno = $WorldEnvironment
onready var CeuDia = preload('res://Enviroments/Skys/SkyMorning.tres')
onready var Noite_Som = $Noite
onready var Dia_Som = $Dia

func _ready() -> void:
	if Global.Noite == false:
		Noite_Som.stop()
		Clarear()
		if Dia_Som.playing == false:
			if Global.Jubox_Playing == true:
				Dia_Som.volume_db = -4
				Dia_Som.play()
			else:
				Dia_Som.play()
				Dia_Som.volume_db = 0
	else:
		if Noite_Som.playing == false:
			Noite_Som.play()

func Clarear() -> void:
	Environment_Terreno.environment.ambient_light_energy = 2.25
	Environment_Terreno.environment.fog_enabled = false
	Environment_Terreno.environment.background_sky = CeuDia
	Environment_Terreno.environment.ambient_light_sky_contribution = 0.25
	$CanvasLayer/HBoxContainer/VBoxContainer/Demo.visible = true
