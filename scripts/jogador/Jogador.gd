extends KinematicBody2D

signal mudarZIndex
var coeficienteZIndex = 0

func _ready():
	$PosicaoXY.connect("respawnar", self, 'respawnar')
	$PosicaoXY.connect('mudarCoeficienteZ', self, 'mudarCoeficienteZ')
	$PosicaoXY.connect('mudarPosicaoChao', self, 'mudarPosicaoChao')
func rodar(atrito, gravidade):
	#animacao
	$Animacao.rodar($Input, $Movimento)
	#movimento
	$Movimento.rodar(atrito, gravidade, $Input)
	mudarPosicao()

func mudarPosicao():
	global_position = $Movimento/Fisica.posicao
	$PosicaoXY.global_position = $Movimento/Fisica.posicaoXY
	emit_signal("mudarZIndex", $Movimento/Fisica.posicaoXY.y + 500*coeficienteZIndex)
		
func respawnar(posicao):
	$Movimento.respawnar(posicao)
	coeficienteZIndex = 0
	$Animacao.respawnar()

func mudarCoeficienteZ(inCoeficiente):
	coeficienteZIndex = inCoeficiente

func mudarPosicaoChao(inPosicao):
	$Movimento/Fisica.posicaoChaoZ = inPosicao

