extends Node2D

export var gravidade = 10

func _process(delta):
	$Jogador.rodar(gravidade)
