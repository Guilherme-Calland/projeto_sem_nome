extends Node2D

export var posicaoInicial = Vector2(0,0)
export var velocidadePadrao = 75.0
export var forcaPulo = 375.0
export var gatilhoAudio = false
signal tocarMusicaEstagio

func _ready():
	z_index = 1
	connectSignals()

func rodar(gravidade):
	iniciarPartes(gravidade)
	escutarGatilhoAudio()

func connectSignals():
	$PosicaoXY.connect('mudarPosicaoChao', self, 'mudarPosicaoChao')
	$PosicaoXY.connect('tocarAudio', self, 'tocarAudio')
	$PosicaoXY.connect('tocarMusicaEstagio', self, 'tocarMusicaEstagio')
	$PosicaoXY.connect('mudarZIndex', self, 'mudarZIndex')

func mudarPosicaoChao(posicao):
	$Jogador.mudarPosicaoChao(posicao)

func mudarAtrito(inAtrito):
	$Jogador.mudarAtrito(inAtrito)

func tocarAudio(intrumento, nota):
	if $Jogador/Movimento/Fisica.noChao():
		$Audio.tocarAudio(intrumento, nota)

func escutarGatilhoAudio():
	if not gatilhoAudio: 
		if not $Jogador/Movimento/Fisica.noChao():
			gatilhoAudio = true
	elif gatilhoAudio:
		$PosicaoXY.global_position = Vector2(0, -5000)
		if $Jogador/Movimento/Fisica.noChao():
			gatilhoAudio = false

func iniciarPartes(gravidade):
	$Jogador.rodar(gravidade)
	$Jogador/Movimento/Fisica.velocidadePadrao = velocidadePadrao
	$Jogador/Movimento/Fisica.forcaPulo = forcaPulo
	$Sombra.rodar($Jogador/Movimento/Fisica.posicaoChao)
	$PosicaoXY.rodar($Jogador/Movimento/Fisica.posicaoXY)

func tocarMusicaEstagio():
	if $Jogador/Movimento/Fisica.noChao():
		emit_signal("tocarMusicaEstagio")

func mudarZIndex(index):
	z_index = index
