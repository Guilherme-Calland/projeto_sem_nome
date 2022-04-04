extends Node2D

# velocidade do boneco, export para podermos modificar enquanto jogamos
export var velocidade = 75
export var forcaPulo = 375
# vetor de direcao
var direcao = Vector2(0,0)
# para sabermos qual sentido ele esta olhando quando esta parado
var sentido = "sul"

#vetores cartesianos
var vetorCartesianoEixoX = Vector2(1, 0)
var vetorCartesianoEixoY = Vector2(0, -1)
var vetorCima = Vector2(0, vetorCartesianoEixoY.y)
var vetorBaixo = Vector2(0, -vetorCartesianoEixoY.y)

#vetores isometricos
var vetorIsometricoEixoX = Vector2(1, 0)
var vetorIsometricoEixoY = Vector2(0, -0.5)
var vetorSul = Vector2(0, -vetorIsometricoEixoY.y)
var vetorLeste = Vector2(vetorIsometricoEixoX.x, 0)
var vetorNorte = Vector2(0, vetorIsometricoEixoY.y)
var vetorOeste = Vector2(-vetorIsometricoEixoX.x, 0)

func rodar(atrito, gravidade, input):
	
	if input.apertouBotao("sul"):
		sentido = "sul"
		# clamp(valor, limite inferior, limite superior)
		direcao.y = clamp(direcao.y + (vetorSul.y * atrito), vetorNorte.y * velocidade, vetorSul.y * velocidade)
	elif input.apertouBotao("norte"):
		sentido = "norte"
		direcao.y = clamp(direcao.y + (vetorNorte.y * atrito), vetorNorte.y * velocidade, vetorSul.y * velocidade)
	else:
		if direcao.y > 0:
			direcao.y = clamp(direcao.y + (vetorNorte.y * atrito), 0, direcao.y)
		elif direcao.y < 0:
			direcao.y = clamp(direcao.y + (vetorSul.y * atrito), direcao.y, 0)
		
	if input.apertouBotao("oeste"):
		sentido = "horizontal"
		direcao.x = clamp(direcao.x + (vetorOeste.x * atrito), vetorOeste.x * velocidade, vetorLeste.x * velocidade)
	elif input.apertouBotao("leste"):
		sentido = "horizontal"
		direcao.x = clamp(direcao.x + (vetorLeste.x * atrito), vetorOeste.x * velocidade, vetorLeste.x * velocidade)
	else:
		if direcao.x > 0:
			direcao.x = clamp(direcao.x + vetorOeste.x * atrito, 0, direcao.x)
		elif direcao.x < 0:
			direcao.x = clamp(direcao.x + vetorLeste.x * atrito, direcao.x, 0)
	
#	if input.apertouBotao("pular"):
#		direcao.y = vetorCima.y * forcaPulo
#
#	if not noChao():
#		direcao.y += vetorBaixo.y * gravidade
	
