extends KinematicBody2D

var pacoteJogador

func rodar(atrito, gravidade):
	#fisica
	$Movimento.rodar(atrito, gravidade, $Input)
	mover()
	#animacao
	$Animacao.rodar($Input, $Movimento)
	
func mover():
	# metodo que precisa rodar para ele se mover a cada frame
	# o metodo espera como parametros o vetor de sentido e um vetor que aponta para cima
	move_and_slide($Movimento/Fisica.sentido, $Movimento/Fisica.vetorCima)
