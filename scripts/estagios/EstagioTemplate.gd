extends Node2D

export var zIndexTerreno = 0

func _ready():
	$Terreno.z_index = zIndexTerreno

func tocarAudio(body, instrumento, nota):
	body.tocarAudio(instrumento, nota)

func sairColisao(body):
	body.sairColisao()

func mudarArea(body, posicaoChao, somaIndexZJogador, sentidoColisao):
	if sentidoColisao != 'sem colisao':
		body.colidir(sentidoColisao)
	body.mudarPosicaoChao(posicaoChao)
	body.mudarZIndex(zIndexTerreno + somaIndexZJogador)
