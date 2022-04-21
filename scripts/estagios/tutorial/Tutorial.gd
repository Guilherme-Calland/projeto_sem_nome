extends "res://scripts/estagios/RodarEstagio.gd"

var posicoesRespawn = [Vector2(-255,-130), Vector2(286, 138), Vector2(1023, 507), Vector2(1986, 28)]
var posicoesCamera = [Vector2(95, -150), Vector2(660, 300), Vector2(1465, 285), Vector2(2440,-223)]
var zIndexesRespawn = [1,1,3,1]
var gameLocalIndex = 0

func _process(_delta):
	if gameLocalIndex == 2:
		$"Cenario/Xbox-Controller2".visible = true
		$"Cenario/Xbox-Controller".visible = false
	if gameLocalIndex == 3:
		$"Cenario/Xbox-Controller3".visible = true
		$"Cenario/Xbox-Controller4".visible = true
	if gameLocalIndex == 4:
		$"Cenario/Xbox-Controller3".visible = false
		$"Cenario/Xbox-Controller4".visible = false
		$Cenario/Auxilios.visible = true

func _ready():
	$Camera2D.global_position = posicoesCamera[gameLocalIndex]
	gameLocalIndex += 1

func respawnar(body):
	body.respawnar(posicoesRespawn[gameLocalIndex- 1], zIndexesRespawn[gameLocalIndex - 1])

func onMoverCameraGatilho(_body):
	moverCamera()

func moverCamera():
	$Camera2D.global_position = posicoesCamera[gameLocalIndex]
	$Gatilhos/MoverCamera.get_child(0).queue_free()
	gameLocalIndex += 1
	
