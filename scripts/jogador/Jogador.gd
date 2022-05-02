extends KinematicBody2D

var indexJogador = 0
signal resetarZIndex
signal seExcluir

func rodar(gravidade):
	#animacao
	$Animacao.rodar($Input, $Movimento)
	$Animacao.indexJogador = indexJogador
	#movimento
	$Movimento.rodar(gravidade, $Input)
	mudarPosicao()
	
func mudarPosicao():
	global_position = $Movimento/Fisica.posicao

func respawnar(posicao, zIndex):
	emit_signal('resetarZIndex', zIndex)
	$Animacao.respawnar()
	$Movimento.respawnar(posicao)

func mudarPosicaoChao(inPosicao):
	$Movimento/Fisica.mudarPosicaoChao(inPosicao)

func estiverAcimaDaPosicao(inPosicao):
	return $Movimento/Fisica.posicaoZ.y <= inPosicao
	
func emUmChao(inPosicao):
	return inPosicao < 300000

func seExcluir():
	emit_signal("seExcluir")


