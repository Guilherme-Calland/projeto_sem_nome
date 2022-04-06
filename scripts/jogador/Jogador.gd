extends KinematicBody2D

signal mudarZIndex
var coeficienteZIndex = 0

func rodar(atrito, gravidade):
	#animacao
	$Animacao.rodar($Input, $Movimento)
	#movimento
	$Movimento.rodar(atrito, gravidade, $Input)
	mudarPosicao()

func mudarPosicao():
	global_position = $Movimento/Fisica.posicao
	emit_signal("mudarZIndex", $Movimento/Fisica.posicaoXY.y + 500*coeficienteZIndex)

func respawnar(posicao):
	$Movimento.respawnar(posicao)
	coeficienteZIndex = 0
	$Animacao.respawnar()
