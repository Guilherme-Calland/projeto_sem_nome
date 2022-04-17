extends "res://scripts/estagios/RodarEstagio.gd"

var xilofoneNotas = ['C6','A5','F5','G5','E6','C6','F6', 'B5', 'G6', 'E6','F6', 'B5','C6','A5','F5','G5','C6']
var xilofonePosicoes = [
	Vector2(160, 90), # C6
	Vector2(289, 31), # A5
	Vector2(353, 63), # F5
	Vector2(417, 95), # G5
	Vector2(480, 126), # E6
	Vector2(415, 160), # C6
	Vector2(321,142), # F6
	Vector2(286, 96), # B5
	Vector2(351,128), # G6
	Vector2(289, 94), # E6
	Vector2(353,63), # F6
	Vector2(450,80), # B5
	Vector2(350,60), # C6
	Vector2(480,90), # A5
	Vector2(418,127), # F5
	Vector2(450,140), # G5
	Vector2(510,170), # C6
]
var xilofoneIndex = 0


var pandeiroPosicoes = [
	Vector2(190, 108), 
	Vector2(257, 140), 
	Vector2(320, 173),
	Vector2(288, 156),
	Vector2(350, 125),
	Vector2(287, 92),
	Vector2(224, 59),
	Vector2(289, 27), 
	Vector2(350, 60), 
	Vector2(420, 90), 
	Vector2(350,60), 
	Vector2(415, 92), 
	Vector2(480, 123), 
	Vector2(415,155),
	Vector2(450, 140),
	Vector2(480,160),
	Vector2(544,188)
]
var pandeiroIndex = 0

func _ready():
	$Gatilhos/Xilofone.global_position = xilofonePosicoes[0]
	$Gatilhos/Pandeiro.global_position = pandeiroPosicoes[0]
	
func _process(_delta):
	if Input.is_action_pressed('start'):
		if not $Musica/Faixa1.playing:
			$Musica/Faixa1.play()

func tocarAudioEEngatilharProximo(body, instrumento):
	if instrumento == 'xilofone':
		body.tocarAudio('xilofone',xilofoneNotas[xilofoneIndex])
		xilofoneIndex += 1
		if xilofoneIndex >= xilofoneNotas.size():
			xilofoneIndex = 0
		$Gatilhos/Xilofone.global_position = xilofonePosicoes[xilofoneIndex]
	elif instrumento == 'pandeiro':
		body.tocarAudio('pandeiro', '')
		pandeiroIndex += 1
		if pandeiroIndex >= pandeiroPosicoes.size():
			pandeiroIndex = 0
		$Gatilhos/Pandeiro.global_position = pandeiroPosicoes[pandeiroIndex]
