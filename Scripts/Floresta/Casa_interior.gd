extends Spatial


func _on_PlayerCheck_body_entered(body) -> void:
	if body is Player:
		Global.Correr_Pode = false
		Global.Casa_Som = true

func _on_PlayerCheck_body_exited(body) -> void:
	if body is Player:
		Global.Correr_Pode = true
		Global.Casa_Som = false

func _input(_event) -> void:
	if Input.is_action_pressed("Acao") and Global.Casa_MadeiraEST1Saida == true:
		$TranformScreen/Fade_anim.play("fade_in")
		Global.freeze_player = true
		Global.Abrindo_Porta = true


func _on_Fade_anim_animation_finished(anim_name):
	if anim_name == 'fade_in':
		Global.freeze_player = false
		get_tree().change_scene("res://Mapas/Floresta/Floresta.tscn")
		Global.spawn_point = Global.spawn_Floresta_Casa
		Global.Abrindo_Porta = false
		
