extends Node2D

export var posicaoInicial = Vector2(0,0)
export var velocidadePadrao = 75.0
export var forcaPulo = 375.0

func _ready():
	z_index = 1
	connectSignals()
	$Jogador/Movimento/Fisica.posicaoX.x = posicaoInicial.x
	$Jogador/Movimento/Fisica.posicaoY.y = posicaoInicial.y

func rodar(gravidade):
	iniciarPartes(gravidade)

func connectSignals():
	$PosicaoXY.connect('mudarPosicaoChao', self, 'mudarPosicaoChao')
	$PosicaoXY.connect('tocarAudio', self, 'tocarAudio')
	$PosicaoXY.connect('mudarZIndex', self, 'mudarZIndex')
	$PosicaoXY.connect('colisao', self, 'colidir')
	$PosicaoXY.connect('sairColisao', self, 'sairColisao')

func mudarAtrito(inAtrito):
	$Jogador.mudarAtrito(inAtrito)

func tocarAudio(intrumento, nota):
	if $Jogador/Movimento/Fisica.noChao():
		$Audio.tocarAudio(intrumento, nota)

func iniciarPartes(gravidade):
	$Jogador.rodar(gravidade)
	$Jogador/Movimento/Fisica.velocidadePadrao = velocidadePadrao
	$Jogador/Movimento/Fisica.forcaPulo = forcaPulo
	$Sombra.rodar($Jogador/Movimento/Fisica.posicaoChao)
	$PosicaoXY.rodar($Jogador/Movimento/Fisica.posicaoXY)

func mudarPosicaoChao(posicaoZChao, posicaoZTerreno):
	$Jogador.mudarPosicaoChao(posicaoZChao, posicaoZTerreno)

func mudarZIndex(index, posicaoZTerreno):
	if $Jogador/Movimento/Fisica.acimaDaPosicao(posicaoZTerreno):
		z_index = index

func colidir(sentidoColisao, posicaoZTerreno):
	$Jogador/Movimento.colidir(sentidoColisao, posicaoZTerreno)

func sairColisao():
	$Jogador/Movimento.sairColisao()
