extends KinematicBody2D

#variaveis do jogador
export var velocidade = 75.0
export var sprite_speed_scale = 1.0

var motion = Vector2(0,0)
var direcao = "baixo"
var noAr = false

func rodar():
	
	#fisica
	if apertouBotao("esquerda"):
		setarValorEixoX(-velocidade)
	elif apertouBotao("direita"):
		setarValorEixoX(velocidade)
	else:
		setarValorEixoX(0)
	
	if apertouBotao("cima"):
		setarValorEixoY(-velocidade/2)
	elif apertouBotao("baixo"):
		setarValorEixoY(velocidade/2)
	else: 
		setarValorEixoY(0)
	
	#tem que chamar a cada frame para que haja de fato movimento
	mover()
	
	#animacao
	if parado():
		setarSpriteSpeedScale(0.5 * sprite_speed_scale)
	elif not parado():
		#o frame rate vai aumentar se ele tiver se movendo
		setarSpriteSpeedScale(velocidade/50 * sprite_speed_scale)
		
	if apertouBotao("esquerda") || apertouBotao("direita"):
		if apertouBotao("baixo"):
			direcao = "diagonalBaixo"
			mudarAnimacao("andandoDiagonalBaixo")
		elif apertouBotao("cima"):
			direcao = "diagonalCima"
			mudarAnimacao("andandoDiagonalCima")
		else:
			direcao = "horizontal"
			mudarAnimacao("andandoHorizontal")
			
	if apertouBotao("cima"):
		if apertouBotao("direita") || apertouBotao("esquerda"):
			direcao = "diagonalCima"
			mudarAnimacao("andandoDiagonalCima")
		else:
			direcao = "cima"
			mudarAnimacao("andandoCima")
			
	elif apertouBotao("baixo"):
		if apertouBotao("direita") || apertouBotao("esquerda"):
			direcao = "diagonalBaixo"
			mudarAnimacao("andandoDiagonalBaixo")
		else:
			direcao = "baixo"
			mudarAnimacao("andandoBaixo")
			
	if apertouBotao("esquerda"):
		direcionarSprite("esquerda")
	elif apertouBotao("direita"):
		direcionarSprite("direita")
	
	if parado():
		if direcao == "baixo":
			mudarAnimacao("paradoBaixo")
		elif direcao == "cima":
			mudarAnimacao("paradoCima")
		elif direcao == "diagonalBaixo":
			mudarAnimacao("paradoDiagonalBaixo")
		elif direcao == "diagonalCima":
			mudarAnimacao("paradoDiagonalCima")
		elif direcao == "horizontal":
			mudarAnimacao("paradoHorizontal")

func apertouBotaoEsquerda():
	return Input.is_action_pressed("esquerda") and not Input.is_action_pressed("direita")

func apertouBotaoDireita():
	return Input.is_action_pressed("direita") and not Input.is_action_pressed("esquerda")

func apertouBotaoBaixo():
	return Input.is_action_pressed("baixo") and not Input.is_action_pressed("cima")

func apertouBotaoCima():
	return Input.is_action_pressed("cima") and not Input.is_action_pressed("baixo")
	
func apertouBotao(input):
	if input == "esquerda":
		return apertouBotaoEsquerda()
	elif input == "direita":
		return apertouBotaoDireita()
	elif input == "baixo":
		return apertouBotaoBaixo()
	elif input == "cima":
		return apertouBotaoCima()

func setarValorEixoX(valor):
	motion.x = valor

func setarValorEixoY(valor):
	motion.y = valor

func mover():
	move_and_slide(motion, Vector2(0, -1))

func parado():
	return (motion.x == 0 and motion.y == 0)

func mudarAnimacao(animacao):
	$AnimatedSprite.play(animacao)

func direcionarSprite(direcao):
	if direcao == "esquerda":
		$AnimatedSprite.flip_h = true
	elif direcao == "direita":
		$AnimatedSprite.flip_h = false

func setarSpriteSpeedScale(scale):
	$AnimatedSprite.set_speed_scale(scale)
