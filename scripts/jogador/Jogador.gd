extends KinematicBody2D

# velocidade do boneco, export para podermos modificar enquanto jogamos
export var velocidade = 75

# fisica
var vetorIsometrico = Vector2(1, 0.5)
var vetorSul = Vector2(0, vetorIsometrico.y)
var vetorLeste = Vector2(vetorIsometrico.x, 0)
var vetorNorte = Vector2(0, -vetorIsometrico.y)
var vetorOeste = Vector2(-vetorIsometrico.x,0)

# vetor de direcao
var direcao = Vector2(0,0)

# para sabermos qual sentido ele esta olhando quando esta parado
var sentido = "sul"

# metodo que roda quando inicia essa cena
func _ready():
	mudarAnimacao("paradoSul")
	
func rodar(atrito):
	#fisica
	if apertouBotao("sul"):
		sentido = "sul"
		# clamp(valor, limite inferior, limite superior)
		direcao.y = clamp(direcao.y + (vetorSul.y * atrito), vetorNorte.y * velocidade, vetorSul.y * velocidade)
	elif apertouBotao("norte"):
		sentido = "norte"
		direcao.y = clamp(direcao.y + (vetorNorte.y * atrito), vetorNorte.y * velocidade, vetorSul.y * velocidade)
	else:
		if direcao.y > 0:
			direcao.y = clamp(direcao.y + (vetorNorte.y * atrito), 0, direcao.y)
		elif direcao.y < 0:
			direcao.y = clamp(direcao.y + (vetorSul.y * atrito), direcao.y, 0)
		
	if apertouBotao("oeste"):
		sentido = "horizontal"
		direcao.x = clamp(direcao.x + (vetorOeste.x * atrito), vetorOeste.x * velocidade, vetorLeste.x * velocidade)
	elif apertouBotao("leste"):
		sentido = "horizontal"
		direcao.x = clamp(direcao.x + (vetorLeste.x * atrito), vetorOeste.x * velocidade, vetorLeste.x * velocidade)
	else:
		if direcao.x > 0:
			direcao.x = clamp(direcao.x + vetorOeste.x * atrito, 0, direcao.x)
		elif direcao.x < 0:
			direcao.x = clamp(direcao.x + vetorLeste.x * atrito, direcao.x, 0)
		
	mover()
	
	#animacao
	if apertouBotao("oeste"):
		inverterEixoHorizontalSprite(true)
	elif apertouBotao("leste"):
		inverterEixoHorizontalSprite(false)
	
	if apertouBotao("sul"):
		if apertouBotao("oeste") || apertouBotao("leste"):
			mudarAnimacao("andandoDiagonalSul")
		else:
			mudarAnimacao("andandoSul")
	elif apertouBotao("norte"):
		if apertouBotao("oeste") || apertouBotao("leste"):
			mudarAnimacao("andandoDiagonalNorte")
		else:
			mudarAnimacao("andandoNorte")
	else:
		if apertouBotao("oeste"):
			mudarAnimacao("andandoHorizontal")
		elif apertouBotao("leste"):
			mudarAnimacao("andandoHorizontal")

	if nenhumBotaoDirecaoApertado():
		if sentido == "sul":
			mudarAnimacao("paradoSul")
		elif sentido == "diagonalSul":
			mudarAnimacao("paradoDiagonalSul")
		elif sentido == "horizontal":
			mudarAnimacao("paradoHorizontal")
		elif sentido == "diagonalNorte":
			mudarAnimacao("paradoDiagonalNorte")
		elif sentido == "norte":
			mudarAnimacao("paradoNorte")
			
func mover():
	#metodo que precisa rodar para ele se mover a cada frame
	move_and_slide(direcao, vetorNorte)
	
func estaParado():
	return direcao == Vector2(0,0)

func nenhumBotaoDirecaoApertado():
	return not (apertouBotao("norte") || apertouBotao("sul") || apertouBotao("leste") || apertouBotao("oeste"))

func mudarAnimacao(animacao):
	$AnimationPlayer.play(animacao)

func apertouBotao(botao):
	if botao == "sul":
		#impedir que o usuario aperte dois botoes que são exclusivos
		return Input.is_action_pressed("sul") and not Input.is_action_pressed("norte")
	elif botao == "norte":
		return Input.is_action_pressed("norte") and not Input.is_action_pressed("sul")
	elif botao == "oeste":
		return Input.is_action_pressed("oeste") and not Input.is_action_pressed("leste")
	elif botao == "leste":
		return Input.is_action_pressed("leste") and not Input.is_action_pressed("oeste")

func inverterEixoHorizontalSprite(b):
	$Sprite.flip_h = b
