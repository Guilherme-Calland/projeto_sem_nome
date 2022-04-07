extends KinematicBody2D

signal mudarPosicaoChaoECoeficienteZ
signal mudarCoeficienteZ
signal mudarPosicaoChao

func rodar(posicao):
	mudarPosicao(posicao)

func mudarPosicao(posicao):
	global_position = posicao

func mudarPosicaoChaoECoeficienteZ(posicao, coeficienteZ, cond1, cond2):
	emit_signal('mudarPosicaoChaoECoeficienteZ', posicao, coeficienteZ, cond1, cond2)

func mudarCoeficienteZ(inCoeficiente):
	emit_signal('mudarCoeficienteZ', inCoeficiente)

func mudarPosicaoChao(inPosicao):
	emit_signal('mudarPosicaoChao', inPosicao)
