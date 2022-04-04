extends KinematicBody2D

var direcaoIsometrica = Vector2(0,0)
var direcaoCartesiana = Vector2(0,0)
var direcao = Vector2(0,0)
var vetorCartesianoEixoY = Vector2(0, -1)
var vetorCartesianoCima = vetorCartesianoEixoY
var vetorCartesianoBaixo = -vetorCartesianoEixoY

func rodar(inDirecaoIsometrica):
	direcaoIsometrica = inDirecaoIsometrica
	direcao = direcaoIsometrica + direcaoCartesiana
	mover(direcaoIsometrica)

func mover(inDirecaoIsometrica):
	move_and_slide(inDirecaoIsometrica, vetorCartesianoCima)
