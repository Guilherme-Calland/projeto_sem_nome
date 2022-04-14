extends KinematicBody2D

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

func mudarPosicaoChao(inPosicao, posicaoZTerreno):
	$Movimento/Fisica.mudarPosicaoChao(inPosicao, posicaoZTerreno)

func estiverAcimaDaPosicao(inPosicao):
	return $Movimento/Fisica.posicaoZ.y <= inPosicao
	
func emUmChao(inPosicao):
	return inPosicao < 300000
