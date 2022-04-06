extends KinematicBody2D

signal mudarPosicaoChaoECoeficienteZ

func rodar(posicao):
	mudarPosicao(posicao)

func mudarPosicao(posicao):
	global_position = posicao


