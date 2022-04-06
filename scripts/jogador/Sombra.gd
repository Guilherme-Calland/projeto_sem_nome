extends KinematicBody2D

signal mudarPosicaoChaoECoeficienteZ
signal mudarZIndex

func rodar(posicao):
	mudarPosicao(posicao)

func mudarPosicao(posicao):
	global_position = posicao

func mudarPosicaoChaoEZIndex(posicao, coeficienteZ, coeficienteCondicaoZ):
	emit_signal('mudarPosicaoChaoECoeficienteZ', posicao, coeficienteZ, coeficienteCondicaoZ)
	

