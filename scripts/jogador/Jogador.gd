extends KinematicBody2D

signal mudarZIndex

func rodar(atrito, gravidade):
	#animacao
	$Animacao.rodar($Input, $Movimento)
	#movimento
	$Movimento.rodar(atrito, gravidade, $Input)
	mudarPosicao()

func mudarPosicao():
	global_position = $Movimento/Fisica.posicao
	emit_signal("mudarZIndex", global_position.y)

func respawnar(posicao):
	$Movimento.respawnar(posicao)
	$Animacao.respawnar()
