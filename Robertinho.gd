extends CSGBox

onready var roberto = $"."

func _input(event):
	if Input.is_action_pressed("Acao") and Global.robertinho == true:
		roberto.visible = false
		
