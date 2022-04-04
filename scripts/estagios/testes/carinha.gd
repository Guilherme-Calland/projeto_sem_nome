extends KinematicBody2D

var direcao = Vector2(0,0)

func rodar():
	if Input.is_action_pressed("sul"):
		direcao.y = 200
	
	move_and_slide(direcao, Vector2(0,-1))
