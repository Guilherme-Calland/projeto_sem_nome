extends Node

# velocidade do boneco, export para podermos modificar enquanto jogamos
export var velocidade = 75
export var forcaPulo = 375

# vetores de base
var vetorX = Vector2(1, 0.5)
var vetorY = Vector2(1, -0.5)
var vetorZ = Vector2(0, -1)

# vetores do plano XY formado pelo vetorX e vetorY
var vetorSul = (vetorX - vetorY)/2
var vetorLeste = (vetorX + vetorY)/2
var vetorNorte = (vetorY - vetorX)/2
var vetorOeste = -(vetorX + vetorY)/2

# vetores do plano Z formado pelo vetorZ
var vetorCima = vetorZ
var vetorBaixo = -vetorZ

# vetor sentido no plano XY
var sentidoXY = Vector2(0, 0)

# vetor sentido da reta Z
var sentidoZ = Vector2(0, 0)

# variaveis do mundo
var atrito
var gravidade

func andar(inSentido):
	if inSentido == 'sul':
		# clamp(valor, limite inferior, limite superior)		
		sentidoXY.y = clamp(sentidoXY.y + (vetorSul.y * atrito), vetorNorte.y * velocidade,  vetorSul.y * velocidade)
	elif inSentido == 'leste':
		sentidoXY.x = clamp(sentidoXY.x + (vetorLeste.x * atrito), vetorOeste.x * velocidade, vetorLeste.x * velocidade)
	elif inSentido == 'norte':
		sentidoXY.y = clamp(sentidoXY.y + (vetorNorte.y * atrito),  vetorNorte.y * velocidade,  vetorSul.y * velocidade)
	elif inSentido == 'oeste':
		sentidoXY.x = clamp(sentidoXY.x + (vetorOeste.x * atrito),  vetorOeste.x * velocidade, vetorLeste.x * velocidade)

func sentido(valor):
	if valor == 'sul':
		return sentidoXY.y > 0
	elif valor == 'leste':
		return sentidoXY.x > 0
	elif valor == 'norte':
		return sentidoXY.y < 0
	elif valor == 'oeste':
		return sentidoXY.x < 0
	
func parar(valor):
	if valor == 'sul':
		sentidoXY.y = sentidoXY.y + vetorNorte.y * atrito
	elif valor == 'leste':
		sentidoXY.x = sentidoXY.x + vetorOeste.x * atrito
	elif valor == 'norte':
		sentidoXY.y = sentidoXY.y + vetorSul.y * atrito
	elif valor == 'oeste':
		sentidoXY.x = sentidoXY.x + vetorLeste.x * atrito

