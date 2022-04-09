extends "res://scripts/estagios/EstagioTemplate.gd"

signal mudarEstagio

func _on_MudarEstagio_body_entered(_body):
	$Gatilhos/Audio.queue_free()
