extends Node2D

func rodar(atrito, gravidade):
	var posicaoSombra = $Jogador/Movimento/Fisica.posicaoXY + $Jogador/Movimento/Fisica.posicaoChaoZ
	
	$Jogador.rodar(atrito, gravidade)
	$Sombra.rodar(posicaoSombra)
