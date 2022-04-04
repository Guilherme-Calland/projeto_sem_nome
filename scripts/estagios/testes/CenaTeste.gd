extends Node2D

export var atritoMato = 75.0
export var atritoGelo = 0.75
export var gravidade = 20

var atrito = atritoMato

#essa funcao roda 1 vez por frame
func _process(delta):
	$Jogador.rodar(atrito, gravidade)

func _on_AreaGelo_body_entered(body):
	atrito = atritoGelo

func _on_AreaGelo_body_exited(body):
	atrito = atritoMato
