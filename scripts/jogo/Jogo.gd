extends Node2D

var recursoProximaCena

func _ready():
	$AreaComum.connect("mudarEstagio", self, "mudarEstagio")

func mudarEstagio(estagio):
	get_child(0).queue_free()
	$Timer.start()
	if estagio == 'tutorial':
		recursoProximaCena = load("res://cenas/estagios/tutorial/Tutorial.tscn")

func _on_Timer_timeout():
	var proximaCena = recursoProximaCena.instance()
	add_child(proximaCena)
