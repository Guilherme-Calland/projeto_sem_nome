extends Node2D

func _ready():
	connectSignals()

func rodar(atrito, gravidade):
	var posicaoSombra = $Jogador/Movimento/Fisica.posicaoXY + $Jogador/Movimento/Fisica.posicaoChaoZ
	
	$Jogador.rodar(atrito, gravidade)
	$Sombra.rodar(posicaoSombra)

func mudarZIndex(index):
	z_index = index

func mudarPosicaoChao(posicao):
	$Jogador/Movimento/Fisica.posicaoChaoZ = posicao

func connectSignals():
	$Jogador.connect('mudarZIndex', self, 'mudarZIndex')
	$Sombra.connect('mudarZIndex', self, 'mudarZIndex')
	$Sombra.connect('mudarPosicaoChao', self, 'mudarPosicaoChao')
