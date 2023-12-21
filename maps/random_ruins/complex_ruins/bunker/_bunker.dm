/datum/map_template/ruin/complex/bunker
	name = "bunker piece"
	id = "bunker_piece"
	prefix = "maps/random_ruins/complex_ruins/bunker/templates/"
	apc_test_exempt_areas = list(/area/map_template/complex/bunker = NO_APC)

/area/map_template/complex/bunker
	name = "\improper Abandoned Bunker"
	icon_state = "blue"
	requires_power = 0

/turf/simulated/wall/r_wall/invincible/bunker
	paint_color = CONCRETE_GREY_COLOR

/obj/landmark/map_load_mark/complex/bunker
	name = "Bunker Piece"
	dir = 10 // :)
	wall_type = /turf/simulated/wall/r_wall/invincible/bunker
	templates_type = /datum/map_template/ruin/complex/bunker/room
	door_types = list(
		/obj/machinery/door/unpowered/simple/iron = 2,
		/obj/landmark/empty = 1
	)

/obj/landmark/map_load_mark/complex/bunker/east
	dir = EAST

/obj/landmark/map_load_mark/complex/bunker/east/no_dead_ends
	dead_end_chance = 0

/obj/landmark/map_load_mark/complex/bunker/north
	dir = NORTH

/obj/landmark/map_load_mark/complex/bunker/north/no_dead_ends
	dead_end_chance = 0

/obj/landmark/map_load_mark/complex/bunker/south
	dir = SOUTH

/obj/landmark/map_load_mark/complex/bunker/south/no_dead_ends
	dead_end_chance = 0

/obj/landmark/map_load_mark/complex/bunker/west
	dir = WEST

/obj/landmark/map_load_mark/complex/bunker/west/no_dead_ends
	dead_end_chance = 0

#include "entrance.dm"
#include "templates.dm"
