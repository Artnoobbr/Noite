extends CSGBox

onready var robertinho3 = get_node(".") 


func _input(event):
	if Input.is_action_just_pressed("Acao") and Global.robertinho2 == true:
		robertinho3.visible = false
