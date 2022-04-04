extends KinematicBody2D

var pacoteJogador

func _ready():
	pacoteJogador = {
		'input': $Input,
		'fisica' : $Fisica
	}

func rodar(atrito):
	
	#fisica
	$Fisica.rodar(atrito, pacoteJogador['input'])
	mover()
	
	#animacao
	$Animacao.rodar(pacoteJogador)
	
			
func mover():
	#metodo que precisa rodar para ele se mover a cada frame
	move_and_slide($Fisica.direcao, $Fisica.vetorNorte)
