extends KinematicBody2D

var pacoteJogador

func rodar(atrito, gravidade):
	#fisica
	$Fisica.rodar(atrito, gravidade, $Input)
	mover()
	#animacao
	$Animacao.rodar($Input, $Fisica)
	
func mover():
	#metodo que precisa rodar para ele se mover a cada frame
	move_and_slide($Fisica.direcao, $Fisica.vetorCartesianoCima)
