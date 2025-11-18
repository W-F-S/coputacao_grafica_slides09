extends Node3D

# Referência para o nó SpotLight3D. 
# ATENÇÃO: Verifique se o seu nó SpotLight3D está nomeado como 'SpotLight3D' 
# na árvore de cena, ou ajuste a referência '$SpotLight3D'.
@onready var spot_light: SpotLight3D = $SpotLight3D 

# Função embutida para detectar todos os eventos de input (cliques, teclas, etc.)
func _input(event: InputEvent):
	# Verifica se o evento é um clique de botão do mouse (botão principal, pressionado)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		mudar_cor_luz()

# Função simples para gerar uma cor aleatória e aplicá-la à luz
func mudar_cor_luz():
	# Cria uma nova cor com valores RGB (Vermelho, Verde, Azul) aleatórios (0.0 a 1.0)
	var nova_cor = Color(randf(), randf(), randf())
	
	# Aplica a cor gerada à propriedade light_color da SpotLight3D
	spot_light.light_color = nova_cor
	
	# Opcional: Você também pode aumentar a intensidade para cores mais vibrantes
	# spot_light.light_energy = 2.0 
	
	print("Cor da luz alterada para: ", nova_cor)
