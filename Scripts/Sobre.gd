extends CanvasLayer

onready var Texto = $Menu/MarginContainer/menubotoes/Texto
onready var Texto_anim = $Menu/Text_Anim
var Texto_Finalizado = false

onready var Camera_anim = $Fundo/ViewportContainer/Viewport/Camera/Camera_Anim

func _ready():
	Camera_anim.play("Camera")

	if Texto_Finalizado == false:
		Texto_anim.play("Texto")
	else:
		Texto_anim.stop()


func _on_voltar_pressed():
	get_tree().change_scene('res://Mapas/Menu.tscn')
