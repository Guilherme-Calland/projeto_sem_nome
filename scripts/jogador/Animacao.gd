extends Node2D

var input
var movimento
var fisica
var indexJogador = 0

signal mostrarSombra

func rodar(inInput, inMovimento):
	input = inInput
	movimento = inMovimento
	fisica = movimento.get_child(0)
	
	setarVelocidadeAnimacao()
	
	if input.apertouBotao("oeste"):
		inverterEixoHorizontalSprite(true)
	elif input.apertouBotao("leste"):
		inverterEixoHorizontalSprite(false)
		
	if fisica.noChao():
		var sentidoAnimacao = 'sul'
		var animacao
		if movimento.colidindo:
			animacao = 'colidindo'
		else:
			animacao = 'andando'
			
		if input.apertouBotao("sul"):
			if input.apertouBotao("oeste") || input.apertouBotao("leste"):
				sentidoAnimacao = 'diagonalSul'
			else:
				sentidoAnimacao = 'sul'
		elif input.apertouBotao("norte"):
			if input.apertouBotao("oeste") || input.apertouBotao("leste"):
				sentidoAnimacao = 'diagonalNorte'
			else:
				sentidoAnimacao = 'norte'
		else:
			if input.apertouBotao("oeste") || input.apertouBotao('leste'):
				sentidoAnimacao = 'horizonte'
		if nenhumBotaoDirecaoApertado():
			mudarAnimacao('parado', movimento.olhandoPro)
		else:
			mudarAnimacao(animacao, sentidoAnimacao)
	if not fisica.noChao():
		mudarAnimacao('noAr', movimento.olhandoPro)
		
func nenhumBotaoDirecaoApertado():
	return not (input.apertouBotao("norte") || input.apertouBotao("sul") || input.apertouBotao("leste") || input.apertouBotao("oeste"))

func inverterEixoHorizontalSprite(b):
	$Sprite.flip_h = b

func mudarAnimacao(nome, olhandoPro):
	if $AnimationPlayer.current_animation != 'respawnar':
		var valor = str(nome) + olhandoPro[0].to_upper() + str(olhandoPro.trim_prefix(str(olhandoPro[0])))
		if indexJogador > 0 and indexJogador < 4:
			valor += str(indexJogador + 1)
		$AnimationPlayer.play(valor)

func respawnar():
	emit_signal("mostrarSombra", false)
	$AnimationPlayer.play("respawnar")

func setarVelocidadeAnimacao():
	$AnimationPlayer.playback_speed = fisica.velocidade/88

func mostrarSombra():
	emit_signal('mostrarSombra', true)
