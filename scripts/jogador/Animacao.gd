extends Node2D

var input
var movimento
var fisica

func rodar(inInput, inMovimento):
	input = inInput
	movimento = inMovimento
	fisica = movimento.get_child(0)
	
	if fisica.noChao():
		if input.apertouBotao("oeste"):
			inverterEixoHorizontalSprite(true)
		elif input.apertouBotao("leste"):
			inverterEixoHorizontalSprite(false)
		
		if input.apertouBotao("sul"):
			if input.apertouBotao("oeste") || input.apertouBotao("leste"):
				mudarAnimacao("andando", 'diagonalSul')
			else:
				mudarAnimacao('andando', 'sul')
		elif input.apertouBotao("norte"):
			if input.apertouBotao("oeste") || input.apertouBotao("leste"):
				mudarAnimacao('andando', 'diagonalNorte')
			else:
				mudarAnimacao('andando', 'norte')
		else:
			if input.apertouBotao("oeste") || input.apertouBotao('leste'):
				mudarAnimacao('andando', 'horizonte')

		if nenhumBotaoDirecaoApertado():
			mudarAnimacao('parado', movimento.olhandoPro)
	if not fisica.noChao():
		mudarAnimacao('noAr', movimento.olhandoPro)
		
func nenhumBotaoDirecaoApertado():
	return not (input.apertouBotao("norte") || input.apertouBotao("sul") || input.apertouBotao("leste") || input.apertouBotao("oeste"))

func inverterEixoHorizontalSprite(b):
	$Sprite.flip_h = b

func mudarAnimacao(nome, olhandoPro):
	var valor = str(nome) + olhandoPro[0].to_upper() + str(olhandoPro.trim_prefix(str(olhandoPro[0])))
	$AnimationPlayer.play(valor)
