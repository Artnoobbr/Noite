extends Spatial

var teste_anim = false
var teste_anim2 = false

var Spawn_Cama = Vector3(-1.592, 0.671, 2.753)

onready var animacao = $CanvasLayer/AnimationPlayer
onready var fade_animacao = $TranformScreen/Fade_anim
onready var aviso = $CanvasLayer/HBoxContainer/VBoxContainer/Aviso
onready var Enviroment_Casa = $WorldEnvironment

#Eventos escolha bem merda
func _ready():
	if Global.Noite == false:
		Enviroment_Casa.environment.ambient_light_energy = 10



func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'Aparecer_Texto':
		if teste_anim2 == false:
			aviso.visible = true
		else:
			aviso.visible = false
		teste_anim = true


func _on_Fade_anim_animation_finished(anim_name):
	if anim_name == 'fade_in':
		fade_animacao.play("fade_out")
		Global.evento_interativo = true
		Global.Cama_Casa = false
		Global.Noite = false
		Global.spawn_point = Spawn_Cama
		get_tree().reload_current_scene()



func _input(_event):
	if Input.is_action_just_pressed("Acao") and Global.Cama_Casa == true and Global.Noite == true:
		Global.evento_interativo = true
		Global.Cama_Casa = false
		Global.freeze_player = true
		animacao.play("Aparecer_Texto")
	
	if Input.is_action_just_pressed("Acao") and teste_anim == true:
		aviso.visible = false
		animacao.play("Sumir_Texto")
		fade_animacao.play("fade_in")
		teste_anim2 = true
		teste_anim = false
		Global.freeze_player = false
		
	elif Input.is_action_just_pressed("Acao2") and teste_anim == true:
		aviso.visible = false
		animacao.play("Sumir_Texto")
		Global.freeze_player = false
		Global.evento_interativo = false
		teste_anim2 = true
		teste_anim = false


