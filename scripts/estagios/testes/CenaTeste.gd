extends Node2D

export var gravidade = 20
var atrito = 75

#essa funcao roda 1 vez por frame
func _process(delta):
	$ComponenteJogador.rodar(atrito, gravidade)

# sinal que é chamado quando o boneco entra em um terreno diferente
func mudarAtrito(_body, inAtrito):
	atrito = inAtrito
