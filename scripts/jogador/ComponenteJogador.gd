extends Node2D

func rodar(atrito, gravidade):
	$Jogador.rodar(atrito, gravidade)
	$Sombra.rodar($Jogador/Fisica.direcaoIsometrica)
