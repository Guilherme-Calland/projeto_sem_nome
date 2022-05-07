extends "res://scripts/estagios/RodarEstagio.gd"

var indexMusica = 0
var indexBaixo = 0
var indexXilofone = 0
var indexFim = 48

var notasBaixo = ['C5', 'E5', 'A4', 'C5', 'F4', 'A4', 'G4', 'B4','C5', 'G4', 'C4']
var notasXilofone1 = ['C6', 'F5', 'E6', 'F6', 'G6', 'F6', 'C6', 'F5', 'C6'] 
var notasXilofone2 = ['A5', 'G5', 'C6', 'B5', 'E6', 'B5', 'A5', 'G5', 'C5']

func respawnar(body):
	body.respawnar(Vector2(0,-36), 1)

func _on_AuxiliarAudio350BPM_finished():
	if indexMusica <= indexFim:
		$Audios/AuxiliarAudio350BPM.play()
		$GUI.moverMarcadoresAuxilio()
		indexMusica += 1
		if indexMusica >= 5:
			tocarInstrumentosAcompanhamento()
		if indexMusica >= 13:
			if indexXilofone <= 8:
				tocarInstrumentoJogadoresAusentes()

func tocarInstrumentosAcompanhamento():
	if indexBaixo < notasBaixo.size():
		if indexMusica <= indexFim - 10:
			indexBaixo = indexBaixo % 8
		$Audios/Baixo.tocarAudio('baixo', notasBaixo[indexBaixo])
		indexBaixo += 1
	
func tocarInstrumentoJogadoresAusentes():
	if indexBaixo%4 == 1:
		$Audios/Xilofone1.tocarAudio('xilofone2', notasXilofone1[indexXilofone])
	elif indexBaixo%4 == 2:
		$Audios/Pandeiro1.tocarAudio('pandeiro', '')
	elif indexBaixo%4 == 3:
		$Audios/Xilofone2.tocarAudio('xilofone2', notasXilofone2[indexXilofone])
		indexXilofone += 1
	elif indexBaixo%4 == 0:
		$Audios/Pandeiro2.tocarAudio('pandeiro', '')
	
