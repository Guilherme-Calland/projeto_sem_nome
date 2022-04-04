extends KinematicBody2D

# metodo que roda quando inicia essa cena
func _ready():
	mudarAnimacao("paradoSul")
	
func rodar(atrito):
	
	#fisica
	$Fisica.rodar(atrito, $Input)
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
		if $Fisica.sentido == "sul":
			mudarAnimacao("paradoSul")
		elif $Fisica.sentido == "diagonalSul":
			mudarAnimacao("paradoDiagonalSul")
		elif $Fisica.sentido == "horizontal":
			mudarAnimacao("paradoHorizontal")
		elif $Fisica.sentido == "diagonalNorte":
			mudarAnimacao("paradoDiagonalNorte")
		elif $Fisica.sentido == "norte":
			mudarAnimacao("paradoNorte")
			
func mover():
	#metodo que precisa rodar para ele se mover a cada frame
	move_and_slide($Fisica.direcao, $Fisica.vetorNorte)

func nenhumBotaoDirecaoApertado():
	return not ($Input.apertouBotao("norte") || $Input.apertouBotao("sul") || $Input.apertouBotao("leste") || $Input.apertouBotao("oeste"))

func mudarAnimacao(animacao):
	$AnimationPlayer.play(animacao)

func inverterEixoHorizontalSprite(b):
	$Sprite.flip_h = b
