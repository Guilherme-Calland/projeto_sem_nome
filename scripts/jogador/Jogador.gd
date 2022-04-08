extends KinematicBody2D

signal mudarZIndex
var coeficienteZIndex = 0

func _ready():
	$PosicaoXY.connect("respawnar", self, 'respawnar')
	$PosicaoXY.connect('mudarCoeficienteZ', self, 'mudarCoeficienteZ')
	$PosicaoXY.connect('mudarPosicaoChao', self, 'mudarPosicaoChao')
	$PosicaoXY.connect('mudarAtrito', self, 'mudarAtrito')
	
func rodar(gravidade):
	print(coeficienteZIndex)
	#animacao
	$Animacao.rodar($Input, $Movimento)
	#movimento
	$Movimento.rodar(gravidade, $Input)
	mudarPosicao()

func mudarPosicao():
	global_position = $Movimento/Fisica.posicao
	$PosicaoXY.global_position = $Movimento/Fisica.posicaoXY
	emit_signal("mudarZIndex", $Movimento/Fisica.posicaoXY.y + 500*coeficienteZIndex)
		
func respawnar(posicao, posicaoZ):
	coeficienteZIndex = 0
	$Movimento.respawnar(posicao, posicaoZ)
	$Animacao.respawnar()

func mudarCoeficienteZ(inCoeficiente, posicaoZ):
	if coeficienteZIndex <= inCoeficiente + 2 and coeficienteZIndex >= inCoeficiente - 2:
		if $Movimento/Fisica.posicaoZ.y == posicaoZ:
			coeficienteZIndex = inCoeficiente

func mudarPosicaoChao(inPosicao):
	if $Movimento/Fisica.posicaoZ.y <= inPosicao.y:
		$Movimento/Fisica.posicaoChaoZ = inPosicao

func mudarAtrito(inAtrito):
	$Movimento/Fisica.atrito = inAtrito

func tocarAudio(instrumento, nota, inCoeficienteZ, inPosicaoZ):
	if coeficienteZIndex == inCoeficienteZ and $Movimento/Fisica.posicaoZ.y == inPosicaoZ:
		$Audio.tocarAudio(instrumento, nota)
