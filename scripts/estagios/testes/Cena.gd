extends "res://scripts/estagios/EstagioTemplate.gd"

func _on_StaticBody2D_body_entered(body):
	body.limitEast()
