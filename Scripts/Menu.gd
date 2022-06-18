extends CanvasLayer

onready var Anim_Camera = $Fundo/ViewportContainer/Viewport/Camera/Camera_Anim

func _ready():
	Camera_Animacao()


func Camera_Animacao() -> void:
	Anim_Camera.play("Camera")


func _on_Jogar_pressed():
	get_tree().change_scene('res://Mapas/Floresta/Floresta.tscn')
	Global.spawn_point = Global.spawn_Floresta


func _on_Sobre_pressed():
	get_tree().change_scene('res://Mapas/Sobre.tscn')


func _on_Sair_pressed():
	get_tree().quit()
