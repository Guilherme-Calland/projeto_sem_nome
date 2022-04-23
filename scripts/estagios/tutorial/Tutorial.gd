extends "res://scripts/estagios/RodarEstagio.gd"

var posicoesRespawn = [Vector2(-255,-130), Vector2(286, 138), Vector2(1023, 507), Vector2(1986, 28)]
var posicoesCamera = [Vector2(95, -150), Vector2(660, 300), Vector2(1265, 285), Vector2(2440,-223)]
var zIndexesRespawn = [1,1,3,1]
var gameLocalIndex = 0

var posicoesMarcadorXilofone = [
	Vector2(2111- 59, -240-17),
	Vector2(2161- 59, -240-17),
	Vector2(2111- 59, -190-17),
	Vector2(2161- 59, -190-17)
]

var posicoesMarcadorXilofone2 = [
	Vector2(2112, -81 ),
	Vector2(2080, -96 ),
	Vector2(2049, -81 ),
	Vector2(2080, -65 ),
]

var posicoesMarcadorPandeiro1 = [
	Vector2(2111,-190),
	Vector2(2161, -190),
	Vector2(2111, -140),
	Vector2(2161, -140),
]

var posicoesMarcadorBumbo = [
	Vector2(2112,-240),
	Vector2(2161, -240),
	Vector2(2211, -240),
	Vector2(2260, -240),
	Vector2(2111, -190),
	Vector2(2161, -190),
	Vector2(2211, -190),
	Vector2(2260, -190),
]

var indexBumbo = 0
var indexIntrumento = 0
var indexXilofone = 0

func _process(_delta):
	if gameLocalIndex == 2:
		$Cenario/Controller.visible = false
		$Cenario/Controller2.visible = true
	if gameLocalIndex == 3:
		$Cenario/Controller2.visible = false
		$Cenario/Controller3.visible = true
		$Cenario/Controller4.visible = true
	if gameLocalIndex == 4:
		$Cenario/Controller3.visible = false
		$Cenario/Controller4.visible = false
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

func _on_AuxiliarAudio700BPM_finished():
	$AuxiliarAudio700BPM.play()
	moverMarcadorBumbo()
	indexBumbo = (indexBumbo + 1)%8
	if (indexBumbo + 1)%2 == 0:
		moverMarcadoresInstrumento()
		indexIntrumento = (indexIntrumento + 1)%4
	if (indexBumbo + 1)%3 == 0:
		indexXilofone = (indexXilofone + 1)%4
	
func moverMarcadorBumbo():
	$Cenario/Auxilios/AuxilioBumbo/Marcador.global_position = posicoesMarcadorBumbo[indexBumbo] + Vector2(417, -222)

func moverMarcadoresInstrumento():
	$Cenario/Auxilios/AuxilioXilofone/Marcador.global_position = posicoesMarcadorXilofone[indexIntrumento]
	$Cenario/Auxilios/AuxilioPandeiro1/Marcador.global_position = posicoesMarcadorPandeiro1[indexIntrumento] + Vector2(138, -109)
