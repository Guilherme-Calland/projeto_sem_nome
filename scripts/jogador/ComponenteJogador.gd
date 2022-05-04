extends Node2D

export var posicaoInicial = Vector2(0,0)
export var velocidadePadrao = 75.0
export var forcaPulo = 375.0
export var indexJogador = 0

func _ready():
	$Jogador.respawnar(posicaoInicial, 1)
	global_position = posicaoInicial
	connectSignals()

func rodar(gravidade):
	iniciarPartes(gravidade)
	#assim no Ysort ele vai ficar na frente ou atras do jogador
	global_position = $Jogador/Movimento/Fisica.posicaoXY
	$Jogador.indexJogador = indexJogador
	
func connectSignals():
	$PosicaoXY.connect('mudarPosicaoChao', self, 'mudarPosicaoChao')
	$PosicaoXY.connect('tocarAudio', self, 'tocarAudio')
	$ColisaoIntrumento.connect('tocarAudio', self, 'tocarAudio')
	$PosicaoXY.connect('mudarZIndex', self, 'mudarZIndex')
	$PosicaoXY.connect('colisao', self, 'colidir')
	$PosicaoXY.connect('sairColisao', self, 'sairColisao')
	$Jogador/Movimento.connect('aterrisando', self, 'engatilharColisaoInstrumento')
	$Jogador/Animacao.connect('mostrarSombra', self, 'mostrarSombra')
	$Jogador.connect('resetarZIndex', self, 'resetarZIndex')
	$Jogador.connect("seExcluir", self, "seExcluir")
	$Jogador/Animacao.connect("seTornarVisivel", self, "seTornarVisivel")

func mudarAtrito(inAtrito):
	$Jogador.mudarAtrito(inAtrito)

func tocarAudio(instrumento, nota):
	if $Jogador/Movimento/Fisica.noChao():
		if not $Audio.playing:
			$Audio.tocarAudio(instrumento, nota)
		elif not $Audio/AudioAuxiliar1.playing:
			$Audio/AudioAuxiliar1.tocarAudio(instrumento, nota)
		elif not $Audio/AudioAuxiliar2.playing:
			$Audio/AudioAuxiliar2.tocarAudio(instrumento, nota)
		elif not $Audio/AudioAuxiliar3.playing:
			$Audio/AudioAuxiliar3.tocarAudio(instrumento, nota)
		
		
func iniciarPartes(gravidade):
	$Jogador/Input.index_jogador = indexJogador
	$PosicaoXY.indexJogador = indexJogador
	$Jogador.rodar(gravidade)
	$Jogador/Movimento/Fisica.velocidadePadrao = velocidadePadrao
	$Jogador/Movimento/Fisica.forcaPulo = forcaPulo
	$Sombra.rodar($Jogador/Movimento/Fisica.posicaoChao)
	$PosicaoXY.rodar($Jogador/Movimento/Fisica.posicaoXY)
	$ColisaoIntrumento.global_position = $Jogador.global_position

func mudarPosicaoChao(posicaoZChao):
	if $Jogador/Movimento/Fisica.posicaoZ.y <= 0:
		$Jogador.mudarPosicaoChao(posicaoZChao)

func mudarZIndex(index):
	if $Jogador/Movimento/Fisica.posicaoZ.y <= 0:
		z_index = index

func resetarZIndex(index):
	z_index = index

func colidir(sentidoColisao, posicaoZTerreno):
	$Jogador/Movimento.colidir(sentidoColisao, posicaoZTerreno)

func sairColisao():
	$Jogador/Movimento.sairColisao()

func engatilharColisaoInstrumento(b):
	$ColisaoIntrumento/CollisionShape2D.set_deferred('disabled', !b)

func mostrarSombra(m):
	$Sombra.visible = m
	
func teleportar():
	$Jogador/Animacao.teleportar()

func seExcluir():
	queue_free()

func acimaDoChao():
	return $Jogador/Movimento/Fisica.posicaoZ.y <= 0
