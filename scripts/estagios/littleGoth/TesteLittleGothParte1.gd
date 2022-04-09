extends "res://scripts/estagios/EstagioTemplate.gd"

func _ready():
	var jogadores = $Jogadores.get_children()
	for j in jogadores:
		j.connect("tocarMusicaEstagio", self, "tocarMusicaEstagio")

func _on_MudarEstagio_body_entered(_body):
	engatilharProximasNotas()

func _on_Tocar_body_entered(body):
	body.tocarMusicaEstagio()

func engatilharProximasNotas():
	$Gatilhos/Audio/Parte2.global_position = Vector2(0, 0)
	$Gatilhos/Audio/Parte1.queue_free()
	$Terreno/Parte2.global_position = Vector2(0, 0)
	$Terreno/Parte1.queue_free()
	$Gatilhos/Estagio/MudarEstagio.queue_free()

func tocarMusicaEstagio():
	if not $Musica.playing:
		$Musica.play()
