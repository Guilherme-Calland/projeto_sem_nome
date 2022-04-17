extends "res://scripts/estagios/EstagioTemplate.gd"

export var gravidade = 20

#essa funcao roda 1 vez por frame
func _process(_delta):
	iniciarJogadores()

func iniciarJogadores():
	var jogadores = $Jogadores.get_children()
	for j in jogadores:
		j.rodar(gravidade)

func respawnar(body, posicao):
	body.respawnar(posicao)
	
