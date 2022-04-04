extends Node2D

export var atrito = 75

func _process(_delta):
	$Jogador.rodar(atrito)
