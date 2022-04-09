extends KinematicBody2D

signal mudarPosicaoChao
signal mudarCoeficienteZ
signal mudarAtrito
signal tocarAudio
signal tocarMusicaEstagio

func rodar(posicao):
	global_position = posicao

func mudarPosicaoChao(posicao):
	emit_signal('mudarPosicaoChao', posicao)

func mudarCoeficienteZ(inCoeficiente):
	emit_signal('mudarCoeficienteZ', inCoeficiente)

func mudarAtrito(inAtrito):
	emit_signal("mudarAtrito", inAtrito)

func tocarAudio(intrumento, nota):
	emit_signal('tocarAudio', intrumento, nota)
	
func tocarMusicaEstagio():
	emit_signal("tocarMusicaEstagio")
