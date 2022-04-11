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

func mudarPosicaoChao(inPosicao):
	if estiverAcimaDaPosicao(inPosicao):
		$Movimento/Fisica.posicaoChaoZ = inPosicao
	if emUmChao(inPosicao):
		$Movimento/Fisica.valorSecundarioZ = inPosicao

func mudarAtrito(inAtrito):
	$Movimento/Fisica.atrito = inAtrito

func estiverAcimaDaPosicao(inPosicao):
	return $Movimento/Fisica.posicaoZ.y <= inPosicao.y
	
func emUmChao(inPosicao):
	return inPosicao.y < 300000
