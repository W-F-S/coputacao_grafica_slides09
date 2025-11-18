extends Node2D

"""
	Define a textura de background, não esquecer de definir  imagem na aba de inspector
"""
@onready var polygon_node = $"/root/Root"



var geral = get_parent()

const SZ := Vector2(700, 700)
const P4 := Vector2(100, 100)# área do "padrão" (tiles)


var pattern_tint: Color = Color(1, 1, 1, 0.4)

var pattern_tex: Texture2D
@export var tiles_x: int = 4
@export var tiles_y: int = 4


func _ready() -> void:
	pattern_tex = load(polygon_node.TEX_1)

func _draw():
	_draw_pattern_grid(Rect2(P4, SZ))

func _draw_pattern_grid(r: Rect2) -> void:
	if not pattern_tex: return # Safety check
	var cell_w: float = r.size.x / float(tiles_x)
	var cell_h: float = r.size.y / float(tiles_y)
	for j in range(tiles_y):
		for i in range(tiles_x):
			var pos := r.position + Vector2(i * cell_w, j * cell_h)
			var rect := Rect2(pos, Vector2(cell_w, cell_h))
			draw_texture_rect(pattern_tex, rect, false, pattern_tint)
			
#funcao de click
func _input(event: InputEvent) -> void:		
	if event is InputEventKey and event.keycode == KEY_1 and event.pressed:
		pattern_tex = load(polygon_node.TEX_1)
		
	if event is InputEventKey and event.keycode == KEY_2 and event.pressed:
		pattern_tex = load(polygon_node.TEX_2)
	queue_redraw()
