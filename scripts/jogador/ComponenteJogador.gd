extends Node2D

export var posicaoInicial = Vector2(0,0)
export var velocidadePadrao = 75.0
export var forcaPulo = 375.0

func _ready():
	z_index = 1
	connectSignals()

func rodar(gravidade):
	iniciarPartes(gravidade)

func connectSignals():
	$PosicaoXY.connect('mudarPosicaoChao', self, 'mudarPosicaoChao')
	$PosicaoXY.connect('tocarAudio', self, 'tocarAudio')
	$PosicaoXY.connect('mudarZIndex', self, 'mudarZIndex')

func mudarPosicaoChao(posicao):
	$Jogador.mudarPosicaoChao(posicao)

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

func mudarZIndex(index):
	z_index = index
