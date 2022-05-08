extends CanvasLayer

var marcador1Pos
var marcador2Pos
var marcador3Pos
var marcador4Pos

var posMarcador = 0

var posicoesSoma = [
	Vector2(0,0),
	Vector2(50,0),
	Vector2(0,50),
	Vector2(50,50)
	]

func _ready():
	marcador1Pos = $Control/Player1/PlayerMarcador1/Marcador.rect_global_position
	marcador2Pos = $Control/Player2/PlayerMarcador2/Marcador.rect_global_position
	marcador3Pos = $Control/Player3/PlayerMarcador3/Marcador.rect_global_position
	marcador4Pos = $Control/Player4/PlayerMarcador4/Marcador.rect_global_position

func moverMarcadoresAuxilio():
	$Control/Player1/PlayerMarcador1/Marcador.rect_global_position = marcador1Pos + posicoesSoma[posMarcador]
	$Control/Player2/PlayerMarcador2/Marcador.rect_global_position = marcador2Pos + posicoesSoma[posMarcador]
	$Control/Player3/PlayerMarcador3/Marcador.rect_global_position = marcador3Pos + posicoesSoma[posMarcador]
	$Control/Player4/PlayerMarcador4/Marcador.rect_global_position = marcador4Pos + posicoesSoma[posMarcador]
	posMarcador = (posMarcador + 1)%4

func alternarIconeAudio(audioJogador, valor):
	if audioJogador == '1':
		$Control/Player1/Audio/Imagem/On.visible = !valor
		$Control/Player1/Audio/Imagem/Off.visible = valor
	elif audioJogador == '2':
		$Control/Player2/Audio/Imagem/On.visible = !valor
		$Control/Player2/Audio/Imagem/Off.visible = valor
	elif audioJogador == '3':
		$Control/Player3/Audio/Imagem/On.visible = !valor
		$Control/Player3/Audio/Imagem/Off.visible = valor
	elif audioJogador == '4':
		$Control/Player4/Audio/Imagem/On.visible = !valor
		$Control/Player4/Audio/Imagem/Off.visible = valor
