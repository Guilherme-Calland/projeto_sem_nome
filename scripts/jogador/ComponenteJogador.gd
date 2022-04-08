extends Node2D

export var posicaoInicial = Vector2(0,0)
export var velocidadePadrao = 75

func _ready():
	connectSignals()
	$Jogador.respawnar(posicaoInicial, Vector2(0, -200))

func rodar(gravidade):
	$Jogador.rodar(gravidade)
	$Sombra.rodar($Jogador/Movimento/Fisica.posicaoChao)
	
	$Jogador/Movimento/Fisica.velocidadePadrao = velocidadePadrao

func mudarZIndex(index):
	z_index = index

func connectSignals():
	$Jogador.connect('mudarZIndex', self, 'mudarZIndex')
