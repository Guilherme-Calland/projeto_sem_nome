extends Node

const JOYSTICK_NORTE = 12
const JOYSTICK_SUL = 13
const JOYSTICK_OESTE = 14
const JOYSTICK_LESTE = 15
const JOYSTICK_ANALOGICO_ESQUERDO_HORIZONTAL = 0
const JOYSTICK_ANALOGICO_ESQUERDO_VERTICAL = 1

const JOYSTICK_PULAR = 0
const JOYSTICK_ACAO_SECUNDARIA = 2

var index_jogador = 0

func apertouBotao(botao):
	if botao == "leste":
		if Input.is_action_pressed("leste") and not Input.is_action_pressed('oeste'):
			return true
		if Input.is_joy_button_pressed(index_jogador, JOYSTICK_LESTE) and not Input.is_joy_button_pressed(index_jogador, JOYSTICK_OESTE):
			return true
		if Input.get_joy_axis(index_jogador, JOYSTICK_ANALOGICO_ESQUERDO_HORIZONTAL) == 1:
			return true
		
	if botao == "oeste":
		if Input.is_action_pressed("oeste") and not Input.is_action_pressed('leste'):
			return true
		if Input.is_joy_button_pressed(index_jogador, JOYSTICK_OESTE) and not Input.is_joy_button_pressed(index_jogador, JOYSTICK_LESTE):
			return true
		if Input.get_joy_axis(index_jogador, JOYSTICK_ANALOGICO_ESQUERDO_HORIZONTAL) == -1:
			return true
	
	if botao == "sul":
		if Input.is_action_pressed("sul") and not Input.is_action_pressed('norte'):
			return true
		if Input.is_joy_button_pressed(index_jogador, JOYSTICK_SUL) and not Input.is_joy_button_pressed(index_jogador, JOYSTICK_NORTE):
			return true
		if Input.get_joy_axis(index_jogador, JOYSTICK_ANALOGICO_ESQUERDO_VERTICAL) == 1:
			return true
		
	if botao == "norte":
		if Input.is_action_pressed("norte") and not Input.is_action_pressed('sul'):
			return true
		if Input.is_joy_button_pressed(index_jogador, JOYSTICK_NORTE) and not Input.is_joy_button_pressed(index_jogador, JOYSTICK_SUL):
			return true
		if Input.get_joy_axis(index_jogador, JOYSTICK_ANALOGICO_ESQUERDO_VERTICAL) == -1:
			return true
	
	if botao == "pular":
		if Input.is_action_pressed("pular"):
			return true
		if Input.is_joy_button_pressed(index_jogador, JOYSTICK_PULAR):
			return true
	
	if botao == 'acaoSecundaria':
		if Input.is_action_pressed("acaoSecundaria"):
			return true
		if Input.is_joy_button_pressed(index_jogador, JOYSTICK_ACAO_SECUNDARIA):
			return true
		if Input.is_joy_button_pressed(index_jogador, 4):
			return true
		if Input.is_joy_button_pressed(index_jogador, 6):
			return true
	return false
