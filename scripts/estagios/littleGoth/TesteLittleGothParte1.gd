extends "res://scripts/estagios/EstagioTemplate.gd"

signal mudarEstagio

func _on_MudarEstagio_body_entered(_body):
	$Gatilhos/Audio/Parte1.queue_free()
	$Gatilhos/Audio/Parte2.global_position = Vector2(0,0)
	$Gatilhos/Estagio/MudarEstagio.queue_free()
