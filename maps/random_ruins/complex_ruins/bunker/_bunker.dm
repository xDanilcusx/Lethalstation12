/datum/map_template/ruin/complex/bunker
	prefix = "maps/random_ruins/complex_ruins/bunker/"
	apc_test_exempt_areas = list(/area/map_template/complex/bunker = NO_APC)

/area/map_template/complex/bunker
	name = "\improper Abandoned Bunker"
	icon_state = "blue"

/obj/landmark/map_load_mark/complex/bunker
	name = "Bunker Piece"
	door_types = list(
		/turf/simulated/wall/r_wall/gray/bunker = 1,
		/obj/machinery/door/unpowered/simple = 2,
		/obj/landmark/empty = 3
	)

/obj/landmark/map_load_mark/complex/bunker/north
	templates_type = /datum/map_template/ruin/complex/bunker/north
	dir = NORTH

/obj/landmark/map_load_mark/complex/bunker/east
//	templates_type = /datum/map_template/ruin/complex/bunker/east
	dir = EAST

/obj/landmark/map_load_mark/complex/bunker/south
//	templates_type = /datum/map_template/ruin/complex/bunker/south
	dir = SOUTH

/obj/landmark/map_load_mark/complex/bunker/west
//	templates_type = /datum/map_template/ruin/complex/bunker/west
	dir = WEST

#include "entrance.dm"
#include "north/concrete_hallway.dm"
