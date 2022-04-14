extends KinematicBody2D

signal mudarZIndex

func rodar(gravidade):
	#animacao
	$Animacao.rodar($Input, $Movimento)
	#movimento
	$Movimento.rodar(gravidade, $Input)
	mudarPosicao()
	
func mudarPosicao():
	global_position = $Movimento/Fisica.posicao

func respawnar(posicao):
	$Animacao.respawnar()
	$Movimento.respawnar(posicao)
	emit_signal('mudarZIndex', 1, 0)

func mudarPosicaoChao(inPosicao):
	$Movimento/Fisica.mudarPosicaoChao(inPosicao)

func estiverAcimaDaPosicao(inPosicao):
	return $Movimento/Fisica.posicaoZ.y <= inPosicao
	
func emUmChao(inPosicao):
	return inPosicao < 300000
