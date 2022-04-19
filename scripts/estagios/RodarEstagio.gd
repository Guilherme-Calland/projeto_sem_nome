extends Node2D

export var gravidade = 20
var qtdJoysticks = 0

func _ready():
	Input.connect("joy_connection_changed", self, "onJoyConnectionChanged")
	for i in range(0,4):
		if Input.is_joy_known(i):
			instanciarNovoPlayer(i)

#essa funcao roda 1 vez por frame
func _process(_delta):
	iniciarJogadores()

func iniciarJogadores():
	var jogadores = $Jogadores.get_children()
	for j in jogadores:
		j.rodar(gravidade)

func respawnar(body, posicao):
	body.respawnar(posicao)
	
func onJoyConnectionChanged(idDispositivo, connectado):
	if connectado:
		instanciarNovoPlayer(idDispositivo)
	else:
		removerPlayer(idDispositivo)

func _input(_event):
	if Input.is_action_just_pressed('testeInstanciar') and not Input.is_action_just_pressed('testeRemover'):
		instanciarNovoPlayer(1)
	elif Input.is_action_just_pressed('testeRemover') and not Input.is_action_just_pressed("testeInstanciar"):
		removerPlayer(1)

func instanciarNovoPlayer(idDispositivo):
	qtdJoysticks += 1
	if idDispositivo != 0:
		print('Jogador ' + str(qtdJoysticks + 1) +  ' se juntou ao jogo.')
		var player = preload("res://cenas/jogador/ComponenteJogador.tscn").instance()
		player.posicaoInicial = $Jogadores.get_children().pop_back().get_child(2).global_position + Vector2(20, 10)
		player.indexJogador = qtdJoysticks
		$Jogadores.add_child(player)

func removerPlayer(idDispositivo):
	if $Jogadores.get_child_count() > 1:
		print('Jogador ' + str(qtdJoysticks + 1) +  ' saiu do jogo.')
		$Jogadores.get_child(qtdJoysticks).queue_free()
		qtdJoysticks -= 1
		
func tocarAudio(body, instrumento, nota):
	body.tocarAudio(instrumento, nota)

func mudarArea(body, posicaoChao, indexZJogador):
	body.mudarPosicaoChao(posicaoChao)
	body.mudarZIndex(indexZJogador)
