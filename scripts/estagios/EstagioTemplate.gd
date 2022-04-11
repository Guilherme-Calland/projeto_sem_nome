extends Node2D

export var gravidade = 20

#essa funcao roda 1 vez por frame
func _process(_delta):
	iniciarJogadores()

# sinal que é chamado quando o boneco entra em um terreno diferente
func mudarAtrito(body, inAtrito):
	body.mudarAtrito(inAtrito)

func respawnar(body, posicao):
	body.respawnar(posicao)

func iniciarJogadores():
	var jogadores = $Jogadores.get_children()
	for j in jogadores:
		j.rodar(gravidade)

func mudarPosicaoChao(body, posicao):
	body.mudarPosicaoChao(posicao)

func tocarAudio(body, instrumento, nota):
	body.tocarAudio(instrumento, nota)

func mudarZIndex(body, index):
	body.mudarZIndex(index)

