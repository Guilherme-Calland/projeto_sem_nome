extends Node

# sentido que o boneco ta olhando
var olhandoPro = "sul"

func rodar(inGravidade, input):
	$Fisica.rodar(inGravidade)
	
	if input.apertouBotao('sul'):
		if input.apertouBotao('leste') || input.apertouBotao('oeste'):
			olhandoPro = 'diagonalSul'
		else:
			olhandoPro = 'sul'
		$Fisica.andar('sul')
	elif input.apertouBotao('norte'):
		if input.apertouBotao('leste') || input.apertouBotao('oeste'):
			olhandoPro = 'diagonalNorte'
		else:
			olhandoPro = 'norte'
		$Fisica.andar('norte')
	else: 
		if $Fisica.sentido('sul'):
			$Fisica.parar('sul')
		elif $Fisica.sentido('norte'):
			$Fisica.parar('norte')
	
	if input.apertouBotao('leste'):
		if not (input.apertouBotao('norte') || input.apertouBotao('sul')):
			olhandoPro = 'horizonte'
		$Fisica.andar('leste')
	elif input.apertouBotao('oeste'):
		if not (input.apertouBotao('norte') || input.apertouBotao('sul')):
			olhandoPro = 'horizonte'
		$Fisica.andar('oeste')
	else:
		if $Fisica.sentido('leste'):
			$Fisica.parar('leste')
		elif $Fisica.sentido('oeste'):
			$Fisica.parar('oeste')
	
	if input.apertouBotao('pular') and $Fisica.noChao():
		$Fisica.pular()
	
	if not $Fisica.noChao():
		$Fisica.cair()
	else:
		$Fisica.ficarNoChao()
	
	if input.apertouBotao('acaoSecundaria'):
		$Fisica.correndo = true
	else:
		$Fisica.correndo = false
		
func respawnar(posicao, posicaoZ):
	olhandoPro = 'sul'
	$Fisica.respawnar(posicao, posicaoZ)
