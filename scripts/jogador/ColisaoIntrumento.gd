extends KinematicBody2D

signal tocarAudio

func tocarAudio(intrumento, nota):
	emit_signal('tocarAudio', intrumento, nota)
