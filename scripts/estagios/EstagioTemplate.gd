extends Node2D

export var gravidade = 20

#essa funcao roda 1 vez por frame
func _process(_delta):
	iniciarJogadores()

# sinal que é chamado quando o boneco entra em um terreno diferente
func mudarAtrito(body, inAtrito):
	body.mudarAtrito(inAtrito)

func respawnar(body, posicao, posicaoZ):
	body.respawnar(posicao, posicaoZ)

func iniciarJogadores():
	var jogadores = $Jogadores.get_children()
	for j in jogadores:
		j.rodar(gravidade)

func mudarCoeficienteZ(body, inCoeficiente):
	body.mudarCoeficienteZ(inCoeficiente)

func mudarPosicaoChao(body, posicao):
	body.mudarPosicaoChao(posicao)

func tocarAudio(body, instrumento, nota):
	body.tocarAudio(instrumento, nota)

