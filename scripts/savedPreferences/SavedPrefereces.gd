extends Node

var posInicialAreaComum = Vector2(191,-164)
var posInicialTutorial = Vector2(-255, -130)
var posInicialEstagio1 = Vector2(0,-36)
var posInicialEstagio2 = Vector2(0,-5)

var posicaoInicial = posInicialTutorial
var caminho = 'tutorial'

func iniciarTransicaoMudancaEstagio(animacao):
	$AnimationPlayer.play(animacao)


