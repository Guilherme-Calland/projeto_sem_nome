extends "res://scripts/estagios/RodarEstagio.gd"

var indexIntrumento = 0

func respawnar(body):
	body.respawnar(Vector2(0,-36), 1)

func _on_AuxiliarAudio350BPM_finished():
	$Audios/AuxiliarAudio350BPM.play()
	$GUI.moverMarcadoresAuxilio()
