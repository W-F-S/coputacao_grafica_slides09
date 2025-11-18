extends Node2D
const SZ := Vector2(110, 110)
const P4 := Vector2(160, 160)# área do "padrão" (tiles)

const spacing = Vector2(0, 0)

const TEX_1 = "res://imagens/tex_1.svg"
const TEX_2 = "res://imagens/tex_2.svg"
var current_text = TEX_1

var poly_points_1: PackedVector2Array = PackedVector2Array([
	Vector2(100, 100),  # Novo ponto de início
	Vector2(200, 100),  # Ponto arbitrário modificado
	Vector2(200, 150),  # Ponto arbitrário modificado
	Vector2(100, 150)   # Ponto arbitrário modificado
])

var hexagon: PackedVector2Array = PackedVector2Array([
	Vector2(100.0, 100.0), # Novo ponto de início
	Vector2(250.0, 100.0), # Ponto arbitrário modificado
	Vector2(325.0, 175.0), # Ponto arbitrário modificado
	Vector2(250.0, 250.0), # Ponto arbitrário modificado
	Vector2(100.0, 250.0), # Ponto arbitrário modificado
	Vector2(25.0, 175.0)   # Ponto arbitrário modificado
])

var star_points_array: PackedVector2Array = PackedVector2Array([
	Vector2(100.0, 100.0), # Novo ponto de início
	Vector2(110.0, 130.0), # Ponto arbitrário modificado
	Vector2(150.0, 135.0), # Ponto arbitrário modificado
	Vector2(120.0, 155.0), # Ponto arbitrário modificado
	Vector2(130.0, 180.0), # Ponto arbitrário modificado
	Vector2(100.0, 160.0), # Ponto arbitrário modificado
	Vector2(70.0, 180.0),  # Ponto arbitrário modificado
	Vector2(80.0, 155.0),  # Ponto arbitrário modificado
	Vector2(50.0, 135.0),  # Ponto arbitrário modificado
	Vector2(90.0, 130.0)   # Ponto arbitrário modificado
])	

var triangle_points: PackedVector2Array = PackedVector2Array([
	Vector2(100, 100),  # Top point
	Vector2(150, 400),  # Bottom-left point
	Vector2(450, 400)   # Bottom-right point
])

# --- COLOR DEFINITIONS ---
# All color and texture variables remain here for simplicity.

var alfa = 1

var c_v0: Color = Color(1, 0, 0, alfa)
var c_v1: Color = Color(0, 1, 0, alfa)
var c_v2: Color = Color(0, 0, 1, alfa)
var c_v3: Color = Color(1, 1, 0, alfa)
var c_v4: Color = Color(0, 1, 1, alfa)
var c_v5: Color = Color(1, 0, 1, alfa)

func _ready() -> void:
	randomize()
	queue_redraw()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		_randomize_palette()
		queue_redraw()

		
# Adicione esta função ao seu script Node2D
func _offset_polygon_x(polygon: PackedVector2Array, offset_x: float) -> PackedVector2Array:
	var modified_polygon := PackedVector2Array()
	for vertex in polygon:
		var new_vertex := Vector2(vertex.x + offset_x, vertex.y)
		modified_polygon.append(new_vertex)
	return modified_polygon

#funcao de click



func _randomize_palette() -> void:
	# gera um conjunto de cores
	alfa = 1
	c_v0 = Color(randf(), 0.0, 0.0, alfa)
	c_v1 = Color(0.0, randf(), 0.0, alfa)
	c_v2 = Color(0.0, 0.0, randf(),alfa)
	c_v3 = Color(randf(), 0, randf(), alfa)
	c_v4 = Color(randf(), randf(), 0, alfa)
	c_v5 = Color(0, randf(), randf(), alfa)
