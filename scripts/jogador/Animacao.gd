extends Node

var input
var fisica
var sprite
var animationPlayer

func _ready():
	if animationPlayer != null:
		mudarAnimacao("paradoBaixo")

func rodar(pacoteJogador):
	abrirPacoteJogador(pacoteJogador)
	
	if input.apertouBotao("oeste"):
		inverterEixoHorizontalSprite(true)
	elif input.apertouBotao("leste"):
		inverterEixoHorizontalSprite(false)
	
	if input.apertouBotao("sul"):
		if input.apertouBotao("oeste") || input.apertouBotao("leste"):
			mudarAnimacao("andandoDiagonalSul")
		else:
			mudarAnimacao("andandoSul")
	elif input.apertouBotao("norte"):
		if input.apertouBotao("oeste") || input.apertouBotao("leste"):
			mudarAnimacao("andandoDiagonalNorte")
		else:
			mudarAnimacao("andandoNorte")
	else:
		if input.apertouBotao("oeste"):
			mudarAnimacao("andandoHorizontal")
		elif input.apertouBotao("leste"):
			mudarAnimacao("andandoHorizontal")

	if nenhumBotaoDirecaoApertado(input):
		if fisica.sentido == "sul":
			mudarAnimacao("paradoSul")
		elif fisica.sentido == "diagonalSul":
			mudarAnimacao("paradoDiagonalSul")
		elif fisica.sentido == "horizontal":
			mudarAnimacao("paradoHorizontal")
		elif fisica.sentido == "diagonalNorte":
			mudarAnimacao("paradoDiagonalNorte")
		elif fisica.sentido == "norte":
			mudarAnimacao("paradoNorte")

func nenhumBotaoDirecaoApertado(input):
	return not (input.apertouBotao("norte") || input.apertouBotao("sul") || input.apertouBotao("leste") || input.apertouBotao("oeste"))

func mudarAnimacao(animacao):
	animationPlayer.play(animacao)

func inverterEixoHorizontalSprite(b):
	sprite.flip_h = b

func abrirPacoteJogador(pacoteJogador):
	input = pacoteJogador['input']
	fisica = pacoteJogador['fisica']
	sprite = pacoteJogador['sprite']
	animationPlayer = pacoteJogador['animationPlayer']
