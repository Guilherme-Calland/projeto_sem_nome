extends Node2D

# velocidade do boneco, export para podermos modificar enquanto jogamos
export var velocidade = 75
export var forcaPulo = 375

# vetores de direcao
var direcaoIsometrica = Vector2(0,0)
var direcaoCartesiana = Vector2(0,0)
var direcao = Vector2(0,0)

# para sabermos qual sentido ele esta olhando quando esta parado
var sentidoIsometrico = "sul"

#vetores cartesianos
var vetorCartesianoEixoX = Vector2(1, 0)
var vetorCartesianoEixoY = Vector2(0, -1)
var vetorCartesianoCima = vetorCartesianoEixoY
var vetorCartesianoBaixo = -vetorCartesianoEixoY

#vetores isometricos
var vetorIsometricoEixoX = Vector2(1, 0)
var vetorIsometricoEixoY = Vector2(0, -0.5)
var vetorIsometricoSul = -vetorIsometricoEixoY
var vetorIsometricoLeste = vetorIsometricoEixoX
var vetorIsometricoNorte = vetorIsometricoEixoY
var vetorIsometricoOeste = -vetorIsometricoEixoX

func rodar(atrito, gravidade, input):
	
	if input.apertouBotao("sul"):
		sentidoIsometrico = "sul"
		# clamp(valor, limite inferior, limite superior)
		direcaoIsometrica.y = clamp(direcaoIsometrica.y + (vetorIsometricoSul.y * atrito), vetorIsometricoNorte.y * velocidade, vetorIsometricoSul.y * velocidade)
	elif input.apertouBotao("norte"):
		sentidoIsometrico = "norte"
		direcaoIsometrica.y = clamp(direcaoIsometrica.y + (vetorIsometricoNorte.y * atrito), vetorIsometricoNorte.y * velocidade, vetorIsometricoSul.y * velocidade)
	else:
		if direcaoIsometrica.y > 0:
			direcaoIsometrica.y = clamp(direcaoIsometrica.y + (vetorIsometricoNorte.y * atrito), 0, direcaoIsometrica.y)
		elif direcaoIsometrica.y < 0:
			direcaoIsometrica.y = clamp(direcaoIsometrica.y + (vetorIsometricoSul.y * atrito), direcaoIsometrica.y, 0)
		
	if input.apertouBotao("oeste"):
		sentidoIsometrico = "horizontal"
		direcaoIsometrica.x = clamp(direcaoIsometrica.x + (vetorIsometricoOeste.x * atrito), vetorIsometricoOeste.x * velocidade, vetorIsometricoLeste.x * velocidade)
	elif input.apertouBotao("leste"):
		sentidoIsometrico = "horizontal"
		direcaoIsometrica.x = clamp(direcaoIsometrica.x + (vetorIsometricoLeste.x * atrito), vetorIsometricoOeste.x * velocidade, vetorIsometricoLeste.x * velocidade)
	else:
		if direcaoIsometrica.x > 0:
			direcaoIsometrica.x = clamp(direcaoIsometrica.x + vetorIsometricoOeste.x * atrito, 0, direcaoIsometrica.x)
		elif direcaoIsometrica.x < 0:
			direcaoIsometrica.x = clamp(direcaoIsometrica.x + vetorIsometricoLeste.x * atrito, direcaoIsometrica.x, 0)
	
	if input.apertouBotao("pular"):
		direcaoCartesiana = vetorCartesianoCima * forcaPulo
	
	direcao = direcaoIsometrica + direcaoCartesiana
