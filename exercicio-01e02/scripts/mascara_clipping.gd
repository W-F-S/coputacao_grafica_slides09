extends Node2D



var fill_color: Color = Color.BLACK
var geral = get_parent()
@onready var polygon_node = $"/root/Root"


func _ready():
	geral = get_parent()

	if geral:	
		geral.hexagon = geral._offset_polygon_x(geral.hexagon, 100)
		geral.star_points_array = geral._offset_polygon_x(geral.star_points_array, 400)
		geral.triangle_points = geral._offset_polygon_x(geral.triangle_points, 500)
		
	
func _draw():
	set_process_input(true)

	if geral:	
		draw_polygon(geral.triangle_points, PackedColorArray([geral.c_v0, 
			geral.c_v1, 
			geral.c_v2]))
		draw_polyline(geral.triangle_points, Color(0, 0, 1, 1), 3.0)
		
		draw_polygon(geral.hexagon, PackedColorArray([
			geral.c_v0, 
			geral.c_v1, 
			geral.c_v2, 
			geral.c_v3, 
			geral.c_v4, 
			geral.c_v5]))
		draw_polyline(geral.hexagon, Color(0, 1, 0, 1), 3.0)
		
		draw_polygon(geral.star_points_array, PackedColorArray([
			geral.c_v0, 
			geral.c_v1, 
			geral.c_v2, 
			geral.c_v3, 
			geral.c_v4,
			geral.c_v0, 
			geral.c_v1, 
			geral.c_v2, 
			geral.c_v3,
			geral.c_v5 ]))
		draw_polyline(geral.star_points_array, Color(1, 0, 0, 1), 3.0)
	

#funcao de click
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		geral._randomize_palette()
		queue_redraw()
