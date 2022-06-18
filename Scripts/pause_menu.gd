extends Control

var pausado = false setget setar_pausado

func _unhandled_input(event):
	if event.is_action_pressed("ESC"):
		MouseCheck()
		self.pausado = !pausado


func setar_pausado(value):
	pausado = value
	get_tree().paused = pausado
	visible = pausado
	

func MouseCheck() -> void:
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_Resmuir_pressed():
	MouseCheck()
	self.pausado = false
	

func _on_Sair_pressed():
	get_tree().quit()


func _on_Menu_pressed():
	self.pausado = false
	Global.spawn_point = Global.spawn_Floresta
	Global.Noite = true
	Global.Cama_Casa = true
	Global.evento_interativo = false
	get_tree().change_scene('res://Mapas/Menu.tscn')

