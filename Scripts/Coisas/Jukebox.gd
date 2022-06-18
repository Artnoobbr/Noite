extends Spatial

onready var Cat = $Cube/Cat

var tocando: bool = false

func _ready():
	noite()


func _input(_event):
	if Input.is_action_just_pressed("Acao") and Global.Jukebox == true:
		#Basicamente um sistema de ON E OFF
		#toda vez que o player clicar no "E" o script verifica se o tocando esta true ou false.
		if tocando == false:
			Tocar()
		else:
			Parar()
			
func Tocar() -> void:
	if Cat.playing == false:
			Cat.play()
			tocando = true
			Global.Jubox_Playing = true
			

func Parar() -> void:
	Cat.stop()
	tocando = false
	Global.Jubox_Playing = false

func noite() -> void:
	if Global.Noite == true:
		$Cube.visible = false
		$Cube/Jukebox.input_ray_pickable = false
		$Cube/Jukebox/Jukebox_Colission.disabled = true
		$Cube/StaticBody/CollisionShape.disabled = true
	else:
		$Cube.visible = true
		$Cube/Jukebox.input_ray_pickable = true
		$Cube/Jukebox/Jukebox_Colission.disabled = false
		$Cube/StaticBody/CollisionShape.disabled = false
