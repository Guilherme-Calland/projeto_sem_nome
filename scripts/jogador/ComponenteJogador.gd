extends Node2D

export var posicaoInicial = Vector2(0,0)
export var velocidadePadrao = 75.0
export var forcaPulo = 375.0
export var indexJogador = 0

func _ready():
	z_index = 1
	connectSignals()
	$Jogador.respawnar(posicaoInicial)
	global_position = posicaoInicial

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

func mudarAtrito(inAtrito):
	$Jogador.mudarAtrito(inAtrito)

func tocarAudio(instrumento, nota):
	if $Jogador/Movimento/Fisica.noChao():
		if not $Audio.playing:
			$Audio.tocarAudio(instrumento, nota)
		else:
			$AudioAuxiliar.tocarAudio(instrumento, nota)
		
func iniciarPartes(gravidade):
	$Jogador/Input.index_jogador = indexJogador
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

func resetarZIndex():
	z_index = 1

func colidir(sentidoColisao, posicaoZTerreno):
	$Jogador/Movimento.colidir(sentidoColisao, posicaoZTerreno)

func sairColisao():
	$Jogador/Movimento.sairColisao()

func engatilharColisaoInstrumento(b):
	$ColisaoIntrumento/CollisionShape2D.set_deferred('disabled', !b)

func mostrarSombra(m):
	$Sombra.visible = m
