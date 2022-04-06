extends KinematicBody2D

signal mudarZIndex
signal mudarPosicaoChao

func rodar(posicao):
	mudarPosicao(posicao)

func mudarPosicao(posicao):
	global_position = posicao

func mudarPosicaoChao(posicao, zIndex):
	emit_signal('mudarZIndex', zIndex)
	emit_signal('mudarPosicaoChao', posicao)

