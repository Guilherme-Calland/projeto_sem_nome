extends KinematicBody2D

signal mudarPosicaoChao

func rodar(posicao):
	mudarPosicao(posicao)

func mudarPosicao(posicao):
	global_position = posicao

func mudarPosicaoChao(posicao):
	emit_signal('mudarPosicaoChao', posicao)

