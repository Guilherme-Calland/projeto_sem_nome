extends Node2D

export var atrito1 = 75.0
export var atrito2 = 0.75

var atrito = atrito1

#essa funcao roda 1 vez por frame
func _process(delta):
	$Jogador.rodar(atrito)

func _on_AreaGelo_body_entered(body):
	atrito = atrito2

func _on_AreaGelo_body_exited(body):
	atrito = atrito1
