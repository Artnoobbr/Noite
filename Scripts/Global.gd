extends Node

var spawn_point =  Vector3(0, 0, 0) 
var spawn_Floresta = Vector3(51.629, 2.886, 53.101)
var spawn_Floresta_Casa = Vector3(123.142, 2.886, 204.758)
var Casa_Interior_spawn = Vector3(4.393, 0.671, -0.305)

func _ready() -> void:
	if get_tree().current_scene.name == 'Floresta':
		spawn_point = spawn_Floresta

func update_spawn(new_point):
	spawn_point = new_point

var freeze_player: bool = false

var robertinho: bool = false
var robertinho2: bool = false
var Correr_Pode: bool = true

var evento_interativo: bool = false

var Jukebox: bool = false
var Jubox_Playing: bool = false
var Abrindo_Porta: bool = false
var Cama_Casa: bool = false
var Casa_Som: bool = false
var Casa_MadeiraEST1: bool = false
var Casa_MadeiraEST1Saida: bool = false
var Noite: bool = true

var teste_post: bool = true
