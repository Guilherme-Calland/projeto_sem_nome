extends Node2D

export var gravidade = 20
export var atrito = 75

func _process(_delta):
	$ComponenteJogador.rodar(atrito, gravidade)
