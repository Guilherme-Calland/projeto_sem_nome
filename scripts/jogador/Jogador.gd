extends KinematicBody2D

# vetor de direcao
var motion = Vector2(0,0)

# velocidade do boneco, export para podermos modificar enquanto jogamos caso queiramos
export var velocidade = 75

# para sabermos qual sentido ele esta olhando quando esta parado
var direcao = "baixo"

# metodo que roda quando inicia essa cena
func _ready():
	mudarAnimacao("paradoBaixo")
	
func rodar():
	#fisica
	if apertouBotao("baixo"):
		direcao = "baixo"
		motion.y = velocidade
	else:
		motion.y = 0
	
	mover()
	
	#animacao
	if apertouBotao("baixo"):
		mudarAnimacao("andandoBaixo")

	if estaParado():
		if direcao == "baixo":
			mudarAnimacao("paradoBaixo")
func mover():
	#metodo que precisa rodar para ele se mover a cada frame
	move_and_slide(motion, Vector2(0,-1))
	
func estaParado():
	return motion == Vector2(0,0)

func mudarAnimacao(animacao):
	$AnimationPlayer.play(animacao)

func apertouBotao(botao):
	if botao == "baixo":
		#impedir que o usuario aperte dois botoes que são exclusivos
		return Input.is_action_pressed("baixo") and not Input.is_action_pressed("cima")
