extends Node2D

export var gravidade = 20
var atrito = 75

#essa funcao roda 1 vez por frame
func _process(_delta):
	$Jogadores.get_child(0).rodar(atrito, gravidade)
#	$Jogadores.get_child(1).rodar(atrito, gravidade)
#	$Jogadores.get_child(2).rodar(atrito, gravidade)
#	$Jogadores.get_child(3).rodar(atrito, gravidade)

# sinal que é chamado quando o boneco entra em um terreno diferente
func mudarAtrito(_body, inAtrito):
	atrito = inAtrito

func mudarPosicaoChao(body, posicao):
	body.mudarPosicaoChao(posicao)

func respawnar(body, posicao):
	body.respawnar(posicao)
	
