extends Node

# sentido que o boneco ta olhando
var olhandoPro = "sul"
var colidindoNorte = false
var colidindoSul = false
var colidindoLeste = false
var colidindoOeste = false
var colidindo = false

func rodar(inGravidade, input):
	$Fisica.rodar(inGravidade)
	
	if input.apertouBotao('sul') and not colidindoSul:
		if input.apertouBotao('leste') || input.apertouBotao('oeste'):
			olhandoPro = 'diagonalSul'
		else:
			olhandoPro = 'sul'
		$Fisica.andar('sul')
	elif input.apertouBotao('norte') and not colidindoNorte:
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
	
	if input.apertouBotao('leste') and not colidindoLeste:
		if not (input.apertouBotao('norte') || input.apertouBotao('sul')):
			olhandoPro = 'horizonte'
		$Fisica.andar('leste')
	elif input.apertouBotao('oeste') and not colidindoOeste:
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
		
func respawnar(posicao):
	olhandoPro = 'sul'
	sairColisao()
	$Fisica.respawnar(posicao)

func colidir(sentidoColisao, posicaoZTerreno):
	if $Fisica.posicaoZ.y > posicaoZTerreno:
		colidindo = true
		if sentidoColisao == 'nordeste':
			colidindoNorte = true
			colidindoLeste = true
		elif sentidoColisao == 'noroeste':
			colidindoNorte = true
			colidindoOeste = true
		elif sentidoColisao == 'sudeste':
			colidindoSul = true
			colidindoLeste = true
		elif sentidoColisao == 'sudoeste':
			colidindoSul = true
			colidindoOeste = true
		elif sentidoColisao == 'norte':
			colidindoNorte = true
		elif sentidoColisao == 'leste':
			colidindoLeste = true
		elif sentidoColisao == 'oeste':
			colidindoOeste = true
		elif sentidoColisao == 'sul':
			colidindoSul = true

func sairColisao():
	colidindo = false
	colidindoNorte = false
	colidindoSul = false
	colidindoOeste = false
	colidindoLeste = false
