extends Node2D

export var gravidade = 20
var qtdJoysticks = 1
var proximoEstagio

func _ready():
	Input.connect("joy_connection_changed", self, "onJoyConnectionChanged")
	for i in range(0,4):
		if Input.get_joy_name(i) != '':
			instanciarNovoPlayer(i)

#essa funcao roda 1 vez por frame
func _process(_delta):
	iniciarJogadores()

func iniciarJogadores():
	var jogadores = $Jogadores.get_children()
	for j in jogadores:
		j.rodar(gravidade)
	
func onJoyConnectionChanged(idDispositivo, connectado):
	if connectado:
		instanciarNovoPlayer(idDispositivo)
	else:
		removerPlayer()

func _input(_event):
	if Input.is_action_just_pressed('testeInstanciar') and not Input.is_action_just_pressed('testeRemover'):
		instanciarNovoPlayer(1)
	elif Input.is_action_just_pressed('testeRemover') and not Input.is_action_just_pressed("testeInstanciar"):
		removerPlayer()

func instanciarNovoPlayer(idDispositivo):
	if idDispositivo != 0:
		qtdJoysticks += 1
		print('Jogador ' + str(qtdJoysticks) +  ' se juntou ao jogo.')
		var player = preload("res://cenas/jogador/ComponenteJogador.tscn").instance()
		player.posicaoInicial = $Jogadores.get_children().pop_back().get_child(2).global_position + Vector2(20, 10)
		player.indexJogador = qtdJoysticks - 1
		$Jogadores.add_child(player)

func removerPlayer():
	if $Jogadores.get_child_count() > 1:
		print('Jogador ' + str(qtdJoysticks) +  ' saiu do jogo.')
		$Jogadores.get_child(qtdJoysticks - 1).queue_free()
		qtdJoysticks -= 1
		
func tocarAudio(body, instrumento, nota):
	body.tocarAudio(instrumento, nota)

func mudarArea(body, posicaoChao, indexZJogador):
	body.mudarPosicaoChao(posicaoChao)
	body.mudarZIndex(indexZJogador)

func entrarEstagio(_body, estagioNome):
	if estagioNome == 'tutorial':
		proximoEstagio = "res://cenas/estagios/tutorial/Tutorial.tscn"
	elif estagioNome == 'areaComum':
		proximoEstagio = "res://cenas/estagios/areaComum/AreaComum.tscn"
	$TrocarEstagioTimer.start()

func _on_Timer_timeout():
	var jogadores = $Jogadores.get_children()
	for j in jogadores:
		j.teleportar()
	$EstagioTimer2.start()

func _on_EstagioTimer2_timeout():
	get_tree().change_scene(proximoEstagio)

