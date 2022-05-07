extends Node

var posInicialAreaComum = Vector2(191,-164)
var posInicialTutorial = Vector2(-255, -130)
var posInicialEstagio1 = Vector2(0,-36)
var posInicialEstagio2 = Vector2(0,-5)

var posicaoInicial = posInicialEstagio1
var caminho = 'tutorial'

func iniciarTransicaoMudancaEstagio(animacao):
	$AnimationPlayer.play(animacao)


