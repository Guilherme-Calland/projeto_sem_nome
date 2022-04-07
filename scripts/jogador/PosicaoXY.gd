extends KinematicBody2D

signal respawnar
signal mudarPosicaoChao
signal mudarCoeficienteZ

func respawnar(posicao):
	emit_signal("respawnar", posicao)

func mudarPosicaoChao(posicao):
	emit_signal('mudarPosicaoChao', posicao)

func mudarCoeficienteZ(inCoeficiente):
	emit_signal('mudarCoeficienteZ', inCoeficiente)
