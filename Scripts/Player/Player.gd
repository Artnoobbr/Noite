extends KinematicBody

class_name Player

var speed = 10
var h_acceleration = 6
var gravity = 20
var full_contact = false
var Correndo = false

const correndo_multiplicador = 2

var mouse_sensitivity = 0.12

var direction = Vector3()
var h_velocity = Vector3()
var movement = Vector3()
var gravity_vec = Vector3()

onready var head = $Head
onready var ground_check = $GroundCheck
onready var Camera_anim = $Head/Camera_anim

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	self.transform.origin = Global.spawn_point

func _input(event):
	if event is InputEventMouseMotion and Global.freeze_player == false:
		rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))
		head.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity))
		head.rotation.x = clamp(head.rotation.x, deg2rad(-89), deg2rad(89))

func _physics_process(delta):
	
	direction = Vector3()
	
	if ground_check.is_colliding():
		full_contact = true
	else:
		full_contact = false
	
	if not is_on_floor():
		gravity_vec += Vector3.DOWN * gravity * delta
	elif.is_on_floor() and full_contact:
		gravity_vec = -get_floor_normal() * gravity
	else:
		gravity_vec = -get_floor_normal()
	
	if Input.is_action_pressed("Anda_Frente") and Global.freeze_player == false:
		direction -= transform.basis.z
	elif Input.is_action_pressed("Anda_Atras") and Global.freeze_player == false:
		direction += transform.basis.z
	
	if Input.is_action_pressed("Anda_Esquerda") and Global.freeze_player == false:
		direction -= transform.basis.x
	elif Input.is_action_pressed("Anda_Direita") and Global.freeze_player == false:
		direction += transform.basis.x
	
	direction = direction.normalized() #Basicamente evita que ande mais rapido na diagonal
	
	#Cauculo do h_velocity e também um if para o cauculo quando o personagem correr
	if Input.is_action_pressed("correr_acao") and Global.Correr_Pode == true:
		h_velocity = h_velocity.linear_interpolate(direction * (speed * correndo_multiplicador), h_acceleration * delta)
		Correndo = true
	else:
		h_velocity = h_velocity.linear_interpolate(direction * speed, h_acceleration * delta)
		Correndo = false
	
	movement.z = h_velocity.z + gravity_vec.z
	movement.x = h_velocity.x + gravity_vec.x
	movement.y = gravity_vec.y
	
	move_and_slide(movement, Vector3.UP)
	
	#Animação
	if direction != Vector3():
		if Correndo == true: #Caso o Player enter no estado correndo ele fara a animação correndo
			Camera_anim.play("Correndo")
		else: #Caso não ele vai fazer a animação andando
			if Global.Casa_Som == true: #Caso esteja na casa de madeira ele fara outra animação
				Camera_anim.play("Andando_Wood")
			else: #Caso contrario fara a animação da floresta
				Camera_anim.play("Andando")
	else:
		Camera_anim.stop()





