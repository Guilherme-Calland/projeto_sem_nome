extends Node
	
func apertouBotao(botao):
	if botao == "leste":
		return Input.is_action_pressed("leste") and not Input.is_action_pressed('oeste')
	
	if botao == "oeste":
		return Input.is_action_pressed("oeste") and not Input.is_action_pressed('leste')
	
	if botao == "sul":
		return Input.is_action_pressed("sul") and not Input.is_action_pressed('norte')
	
	if botao == "norte":
		return Input.is_action_pressed("norte") and not Input.is_action_pressed('sul')
	
	if botao == "pular":
		return Input.is_action_just_pressed("pular")
