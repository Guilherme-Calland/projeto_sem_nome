extends Node2D

var input
var movimento

func rodar(inInput, inMovimento):
	input = inInput
	movimento = inMovimento
	
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
		if movimento.olhandoPro == "sul":
			mudarAnimacao("paradoSul")
		elif movimento.olhandoPro == "diagonalSul":
			mudarAnimacao("paradoDiagonalSul")
		elif movimento.olhandoPro == "horizonte":
			mudarAnimacao("paradoHorizontal")
		elif movimento.olhandoPro == "diagonalNorte":
			mudarAnimacao("paradoDiagonalNorte")
		elif movimento.olhandoPro == "norte":
			mudarAnimacao("paradoNorte")

func nenhumBotaoDirecaoApertado(input):
	return not (input.apertouBotao("norte") || input.apertouBotao("sul") || input.apertouBotao("leste") || input.apertouBotao("oeste"))

func mudarAnimacao(animacao):
	$AnimationPlayer.play(animacao)

func inverterEixoHorizontalSprite(b):
	$Sprite.flip_h = b

