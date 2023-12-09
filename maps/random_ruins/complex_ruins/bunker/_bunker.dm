/datum/map_template/ruin/complex/bunker
	prefix = "maps/random_ruins/complex_ruins/bunker/"
	apc_test_exempt_areas = list(/area/map_template/complex/bunker = NO_APC)

/area/map_template/complex/bunker
	name = "\improper Abandoned Bunker"
	icon_state = "blue"
	base_turf = /turf/simulated/floor/exoplanet/plating

/obj/landmark/map_load_mark/complex/bunker
	name = "Bunker Piece"
	door_types = list(
		/turf/simulated/wall/r_wall/gray/bunker = 4,
		/obj/machinery/door/unpowered/simple/iron = 1,
		/obj/landmark/empty = 1
	)

/obj/landmark/map_load_mark/complex/bunker/east
	templates_type = /datum/map_template/ruin/complex/bunker/east
	dir = EAST

/obj/landmark/map_load_mark/complex/bunker/east/no_dead_ends/Initialize()
	. = ..()
	door_types.Cut(1,2)

/obj/landmark/map_load_mark/complex/bunker/north
	templates_type = /datum/map_template/ruin/complex/bunker/north
	dir = NORTH

/obj/landmark/map_load_mark/complex/bunker/north/no_dead_ends/Initialize()
	. = ..()
	door_types.Cut(1,2)

/obj/landmark/map_load_mark/complex/bunker/south
	templates_type = /datum/map_template/ruin/complex/bunker/south
	dir = SOUTH

/obj/landmark/map_load_mark/complex/bunker/south/no_dead_ends/Initialize()
	. = ..()
	door_types.Cut(1,2)

/obj/landmark/map_load_mark/complex/bunker/west
	templates_type = /datum/map_template/ruin/complex/bunker/west
	dir = WEST

/obj/landmark/map_load_mark/complex/bunker/west/no_dead_ends/Initialize()
	. = ..()
	door_types.Cut(1,2)

#include "entrance.dm"

#include "east/concrete_hallway.dm"

#include "north/concrete_hallway.dm"

#include "south/concrete_hallway.dm"

#include "west/concrete_hallway.dm"
