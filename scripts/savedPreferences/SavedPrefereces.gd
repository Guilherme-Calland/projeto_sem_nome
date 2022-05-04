extends Node
var posInicialTutorial = Vector2(-255, -130)
var posInicialEstagio1 = Vector2(0,-36)
var posInicialEstagio2 = Vector2(0,-5)

#var corTransicao = corAreaComum
#var corAreaComum = Color8(231, 231, 231)
#var corTutorial = Color8(146, 236, 201)
#var corEstagio1 = Color8(199, 132, 255)
#var corEstagio2 = Color8(255, 210, 103)

var posicaoInicial = posInicialEstagio1
var caminho = 'tutorial'

func iniciarTransicaoMudancaEstagio(animacao):
	$AnimationPlayer.play(animacao)


