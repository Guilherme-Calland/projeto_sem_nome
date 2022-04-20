extends "res://scripts/estagios/RodarEstagio.gd"

var posicoesRespawn = [Vector2(-255,-130), Vector2(286, 138)]
var posicoesCamera = [Vector2(95, -140), Vector2(660, 300)]
var gameLocalIndex = 0

func _ready():
	moverCamera()
	

func respawnar(body):
	body.respawnar(posicoesRespawn[gameLocalIndex - 1])

func onMoverCameraGatilho(_body):
	moverCamera()

func moverCamera():
	$Camera2D.global_position = posicoesCamera[gameLocalIndex]
	gameLocalIndex += 1
	$Gatilhos/MoverCamera.get_child(0).queue_free()
	
