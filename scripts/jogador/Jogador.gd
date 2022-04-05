extends KinematicBody2D

var pacoteJogador

func rodar(atrito, gravidade):
	#fisica
	$Movimento.rodar(atrito, gravidade, $Input)
	mudarPosicao()
	#animacao
	$Animacao.rodar($Input, $Movimento)

func mudarPosicao():
	global_position = $Movimento/Fisica.posicao
