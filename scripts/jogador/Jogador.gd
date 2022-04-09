extends KinematicBody2D

signal mudarZIndex
signal gatilhoAudio
var coeficienteZIndex = 0.0
var gatilhoAudio = false

func rodar(gravidade):
	#animacao
	$Animacao.rodar($Input, $Movimento)
	#movimento
	$Movimento.rodar(gravidade, $Input)
	mudarPosicao()
	#audio
	if not $Movimento/Fisica.noChao():
		gatilhoAudio = true
	else:
		gatilhoAudio = false
		
	
func mudarPosicao():
	global_position = $Movimento/Fisica.posicao
	emit_signal("mudarZIndex", $Movimento/Fisica.posicaoXY.y + 500*coeficienteZIndex)
		
func respawnar(posicao, posicaoZ):
	$Animacao.respawnar()
	coeficienteZIndex = 0
	$Movimento.respawnar(posicao, posicaoZ)

func mudarCoeficienteZ(inCoeficiente):
	coeficienteZIndex = inCoeficiente

func mudarPosicaoChao(inPosicao):
	if $Movimento/Fisica.posicaoZ.y <= inPosicao.y:
		$Movimento/Fisica.posicaoChaoZ = inPosicao

func mudarAtrito(inAtrito):
	$Movimento/Fisica.atrito = inAtrito
