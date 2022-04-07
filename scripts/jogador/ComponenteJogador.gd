extends Node2D

export var posicaoInicial = Vector2(0,0)

func _ready():
	connectSignals()
	$Jogador.respawnar(posicaoInicial)

func rodar(atrito, gravidade):
	$Jogador.rodar(atrito, gravidade)
	$Sombra.rodar($Jogador/Movimento/Fisica.posicaoChao)

func mudarZIndex(index):
	z_index = index

func connectSignals():
	$Jogador.connect('mudarZIndex', self, 'mudarZIndex')
	$Sombra.connect('mudarPosicaoChaoECoeficienteZ', self, 'mudarPosicaoChaoECoeficienteZ')
	$Sombra.connect('mudarPosicaoChao', self, 'mudarPosicaoChao')
	$Sombra.connect('mudarCoeficienteZ', self, 'mudarCoeficienteZ')
	
func mudarPosicaoChaoECoeficienteZ(inPosicao, coeficienteZ, cond1, cond2):
	if $Jogador.coeficienteZIndex == cond1 || $Jogador.coeficienteZIndex == cond2:
		$Jogador/Movimento/Fisica.posicaoChaoZ = inPosicao
		$Jogador.coeficienteZIndex = coeficienteZ

func mudarPosicaoChao(inPosicao):
	$Jogador/Movimento/Fisica.posicaoChaoZ = inPosicao

func mudarCoeficienteZ(inCoeficiente):
	$Jogador.coeficienteZIndex = inCoeficiente
