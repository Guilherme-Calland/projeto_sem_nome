extends KinematicBody2D

signal respawnar
signal mudarPosicaoChao
signal mudarCoeficienteZ
signal mudarAtrito

func respawnar(posicao):
	emit_signal("respawnar", posicao)

func mudarPosicaoChao(posicao):
	emit_signal('mudarPosicaoChao', posicao)

func mudarCoeficienteZ(inCoeficiente, posicaoZ, atras):
	emit_signal('mudarCoeficienteZ', inCoeficiente, posicaoZ, atras)

func mudarAtrito(inAtrito):
	emit_signal("mudarAtrito", inAtrito)

