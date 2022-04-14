extends Node2D

export var zIndexTerreno = 0

export var posicaoZTerreno = 0
export var posicaoZQueda = 0

var posicaoZChaoMap

func _ready():
	$Terreno.z_index = zIndexTerreno
	posicaoZChaoMap = {
		0 : posicaoZTerreno,
		1 : posicaoZQueda
	}

func tocarAudio(body, instrumento, nota):
	body.tocarAudio(instrumento, nota)

func sairColisao(body):
	body.sairColisao()

func mudarArea(body, indexChao, somaIndexZJogador, sentidoColisao):
	if sentidoColisao != 'sem colisao':
		body.colidir(sentidoColisao, posicaoZTerreno)
	body.mudarPosicaoChao(posicaoZChaoMap[indexChao], posicaoZTerreno)
	body.mudarZIndex(zIndexTerreno + somaIndexZJogador, posicaoZTerreno)
