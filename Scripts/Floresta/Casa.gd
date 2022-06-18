extends MeshInstance

func _input(_event) -> void:
	if Input.is_action_pressed("Acao") and Global.Casa_MadeiraEST1 == true:
		$TranformScreen/Fade_anim.play("fade_in")
		Global.freeze_player = true
		Global.Abrindo_Porta = true
	

func _on_Fade_anim_animation_finished(anim_name):
	if anim_name == 'fade_in':
		Global.freeze_player = false
		get_tree().change_scene("res://Mapas/Casa/Casa.tscn")
		Global.spawn_point = Global.Casa_Interior_spawn
		Global.Abrindo_Porta = false
