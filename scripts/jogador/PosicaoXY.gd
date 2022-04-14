extends KinematicBody2D

signal mudarPosicaoChao
signal mudarZIndex
signal tocarAudio
signal colisao
signal sairColisao

func rodar(posicao):
	global_position = posicao

func mudarPosicaoChao(posicaoZChao, posicaoZTerreno):
	emit_signal('mudarPosicaoChao', posicaoZChao, posicaoZTerreno)

func mudarZIndex(index, posicaoZTerreno):
	emit_signal('mudarZIndex', index, posicaoZTerreno)

func colidir(sentidoColisao, posicaoZTerreno):
	emit_signal('colisao', sentidoColisao, posicaoZTerreno)

func sairColisao():
	emit_signal('sairColisao')

func tocarAudio(intrumento, nota):
	emit_signal('tocarAudio', intrumento, nota)

	
