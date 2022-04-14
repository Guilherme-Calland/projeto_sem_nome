extends Node2D

export var gravidade = 20
var atrito = 75

#essa funcao roda 1 vez por frame
func _process(_delta):
	$Jogadores/ComponenteJogador.rodar(atrito, gravidade)

# sinal que é chamado quando o boneco entra em um terreno diferente
func mudarAtrito(_body, inAtrito):
	atrito = inAtrito

func mudarPosicaoChaoECoeficienteZ(body, posicao, coeficienteZ, coeficienteCondicaoZ1, coeficienteCondicaoZ2):
	body.mudarPosicaoChaoECoeficienteZ(posicao, coeficienteZ, coeficienteCondicaoZ1, coeficienteCondicaoZ2)
	
func respawnar(body, posicao):
	body.respawnar(posicao)

func iniciarJogadores():
	var jogadores = $Jogadores.get_children()
	for j in jogadores:
		j.rodar(atrito, gravidade)

func mudarCoeficienteZ(body, inCoeficiente):
	body.mudarCoeficienteZ(inCoeficiente)

func mudarPosicaoChao(body, posicao):
	body.mudarPosicaoChao(posicao)
