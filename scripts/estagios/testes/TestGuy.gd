extends KinematicBody2D

var motion = Vector2(0,0)

func rodar():
	if Input.is_action_pressed("leste"):
		print('hello world')
		motion.x = 400
	
	move_and_slide(motion, Vector2(0, -1))
