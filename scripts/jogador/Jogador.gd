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
	if $Input.apertouBotao("sul"):
		sentido = "sul"
		# clamp(valor, limite inferior, limite superior)
		direcao.y = clamp(direcao.y + (vetorSul.y * atrito), vetorNorte.y * velocidade, vetorSul.y * velocidade)
	elif $Input.apertouBotao("norte"):
		sentido = "norte"
		direcao.y = clamp(direcao.y + (vetorNorte.y * atrito), vetorNorte.y * velocidade, vetorSul.y * velocidade)
	else:
		if direcao.y > 0:
			direcao.y = clamp(direcao.y + (vetorNorte.y * atrito), 0, direcao.y)
		elif direcao.y < 0:
			direcao.y = clamp(direcao.y + (vetorSul.y * atrito), direcao.y, 0)
		
	if $Input.apertouBotao("oeste"):
		sentido = "horizontal"
		direcao.x = clamp(direcao.x + (vetorOeste.x * atrito), vetorOeste.x * velocidade, vetorLeste.x * velocidade)
	elif $Input.apertouBotao("leste"):
		sentido = "horizontal"
		direcao.x = clamp(direcao.x + (vetorLeste.x * atrito), vetorOeste.x * velocidade, vetorLeste.x * velocidade)
	else:
		if direcao.x > 0:
			direcao.x = clamp(direcao.x + vetorOeste.x * atrito, 0, direcao.x)
		elif direcao.x < 0:
			direcao.x = clamp(direcao.x + vetorLeste.x * atrito, direcao.x, 0)
		
	mover()
	
	#animacao
	if $Input.apertouBotao("oeste"):
		inverterEixoHorizontalSprite(true)
	elif $Input.apertouBotao("leste"):
		inverterEixoHorizontalSprite(false)
	
	if $Input.apertouBotao("sul"):
		if $Input.apertouBotao("oeste") || $Input.apertouBotao("leste"):
			mudarAnimacao("andandoDiagonalSul")
		else:
			mudarAnimacao("andandoSul")
	elif $Input.apertouBotao("norte"):
		if $Input.apertouBotao("oeste") || $Input.apertouBotao("leste"):
			mudarAnimacao("andandoDiagonalNorte")
		else:
			mudarAnimacao("andandoNorte")
	else:
		if $Input.apertouBotao("oeste"):
			mudarAnimacao("andandoHorizontal")
		elif $Input.apertouBotao("leste"):
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
	return not ($Input.apertouBotao("norte") || $Input.apertouBotao("sul") || $Input.apertouBotao("leste") || $Input.apertouBotao("oeste"))

func mudarAnimacao(animacao):
	$AnimationPlayer.play(animacao)

func inverterEixoHorizontalSprite(b):
	$Sprite.flip_h = b
