extends KinematicBody2D

signal mudarZIndex

func rodar(atrito, gravidade):
	#fisica
	$Movimento.rodar(atrito, gravidade, $Input)
	mudarPosicao()
	#animacao
	$Animacao.rodar($Input, $Movimento)

func mudarPosicao():
	global_position = $Movimento/Fisica.posicao

func respawnar():
	$Movimento.reiniciarPosicao()
	$Animacao.respawnar()
	emit_signal("mudarZIndex", 1)
