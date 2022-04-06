extends Node2D

export var posicaoInicial = Vector2(0,0)

func _ready():
	connectSignals()
	$Jogador.respawnar(posicaoInicial)

func rodar(atrito, gravidade):
	$Jogador.rodar(atrito, gravidade)
	$Sombra.rodar($Jogador/Movimento/Fisica.posicaoChao)

func mudarZIndex(index):
	print(z_index)
	print($Jogador.global_position)
	z_index = index

func mudarPosicaoChao(posicao):
	$Jogador/Movimento/Fisica.posicaoChaoZ = posicao

func connectSignals():
	$Jogador.connect('mudarZIndex', self, 'mudarZIndex')
	$Sombra.connect('mudarPosicaoChaoECoeficienteZ', self, 'mudarPosicaoChaoECoeficienteZ')
	
