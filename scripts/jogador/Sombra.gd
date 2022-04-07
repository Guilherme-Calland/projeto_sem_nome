extends KinematicBody2D

signal mudarPosicaoChaoECoeficienteZ
signal mudarCoeficienteZ
signal mudarPosicaoChao

func rodar(posicao):
	mudarPosicao(posicao)

func mudarPosicao(posicao):
	global_position = posicao
