extends Node2D

export var gravidade = 20
var qtdJoysticks = 1
var proximoEstagio
var proximoEstagioNome

var jogadorObservado
var gatilhoMudarEstagio = false

func _ready():
	jogadorObservado = $Jogadores.get_child(0) 
	Input.connect("joy_connection_changed", self, "onJoyConnectionChanged")
	for i in range(0,4):
		if Input.get_joy_name(i) != '':
			instanciarNovoPlayer(i)

#essa funcao roda 1 vez por frame
func _process(_delta):
	iniciarJogadores()
	observarMudancaEstagio()

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

func entrarEstagio(body, estagioNome):
	jogadorObservado = $Jogadores.get_child(body.indexJogador)
	if jogadorObservado.acimaDoChao():
		gatilhoMudarEstagio = true
		proximoEstagioNome = estagioNome
		
func _on_Timer_timeout():
	var jogadores = $Jogadores.get_children()
	for j in jogadores:
		j.teleportar()
	$EstagioTimer2.start()

func _on_EstagioTimer2_timeout():
	get_tree().change_scene(proximoEstagio)

func trocarEstagio(estagioNome):
	gatilhoMudarEstagio = false
	$TrocarEstagioTimer.start()
	if estagioNome == 'tutorial':
		SharedPreferences.iniciarTransicaoMudancaEstagio('transicaoTutorial')
		SharedPreferences.caminho = 'tutorial'
		SharedPreferences.posicaoInicial = SharedPreferences.posInicialTutorial
		proximoEstagio = "res://cenas/estagios/tutorial/Tutorial.tscn"
	elif estagioNome == 'areaComum':
		SharedPreferences.iniciarTransicaoMudancaEstagio('transicaoAreaComum')
		if SharedPreferences.caminho == 'tutorial':
			SharedPreferences.posicaoInicial = Vector2(191,-164)
		elif SharedPreferences.caminho == 'estagio1':
			SharedPreferences.posicaoInicial = Vector2(287,-120)
		elif SharedPreferences.caminho == 'estagio2':
			SharedPreferences.posicaoInicial = Vector2(385,-70)
		else:
			SharedPreferences.posicaoInicial = Vector2(0,0)
		proximoEstagio = "res://cenas/estagios/areaComum/AreaComum.tscn"
	elif estagioNome == 'estagio1':
		SharedPreferences.iniciarTransicaoMudancaEstagio('transicaoEstagio1')
		SharedPreferences.caminho = 'estagio1'
		SharedPreferences.posicaoInicial = SharedPreferences.posInicialEstagio1
		proximoEstagio = "res://cenas/estagios/estagio1/estagio1.tscn"
	elif estagioNome == 'estagio2':
		SharedPreferences.iniciarTransicaoMudancaEstagio('transicaoEstagio2')
		SharedPreferences.caminho = 'estagio2'
		SharedPreferences.posicaoInicial = SharedPreferences.posInicialEstagio2
		proximoEstagio = "res://cenas/estagios/estagio2/estagio2.tscn"
	else: 
		$TrocarEstagioTimer.stop()

func observarMudancaEstagio():
	if gatilhoMudarEstagio:
		if jogadorObservado.noChao():
			trocarEstagio(proximoEstagioNome)
		if !jogadorObservado.acimaDoChao():
			gatilhoMudarEstagio = false
