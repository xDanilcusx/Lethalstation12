
/// Для корректной работы генерации все пресеты комнат должны быть нечётного размера.

/datum/map_template/ruin/complex
	prefix = "maps/random_ruins/complex_ruins/"
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS | TEMPLATE_FLAG_NO_RADS

	/// Координаты турфа "двери" в комнату писать сюда
	var/door_x = 1 // COUNT FROM ONE!!!
	var/door_y = 1 // COUNT FROM ONE!!!

/datum/map_template/ruin/complex/after_load(z)
	for(var/obj/landmark/map_load_mark/complex/mark in subtemplates_to_spawn)
		subtemplates_to_spawn -= mark
		var/list/map_types = mark.templates
		if(!LAZYLEN(map_types))
			continue

		var/turf/mark_turf = get_turf(mark)
		var/turf/dead_end = mark.wall_type

		var/datum/map_template/ruin/complex/map = pick(map_types)
		map = new map()

		var/x_pos = mark.x - map.door_x + ceil(map.width/2)
		var/y_pos = mark.y - map.door_y + ceil(map.height/2)

		var/turf/doorway_loc = locate(x_pos, y_pos, mark.z)

		var/direction = mark.dir
		var/turf/location = get_step(doorway_loc, direction)

		if(!location)
			new dead_end(mark_turf)
			continue

		var/is_overlaping
		for(var/turf/to_check in map.get_affected_turfs(location, TRUE))
			if(to_check.turf_flags & TURF_FLAG_NORUINS)
				is_overlaping = TRUE
				break

		if(is_overlaping || prob(mark.dead_end_chance))
			new dead_end(mark_turf)
			continue

		var/list/doors = mark.door_types
		var/atom/door = pickweight(doors)
		if(!door)
			new dead_end(mark_turf)
			continue

		door = new door(mark_turf)
		door.dir = direction

		if(!map.load(location, TRUE))
			new dead_end(mark_turf)

		qdel(mark)

	LAZYCLEARLIST(subtemplates_to_spawn)

/area/map_template/complex
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_NO_MODIFY
	base_turf = /turf/simulated/floor/exoplanet/plating

/************************************
			LANDMARKS
************************************/

/obj/landmark/empty
	delete_me = TRUE

/obj/landmark/map_load_mark/complex
	icon = 'maps/random_ruins/complex_ruins/landmarks.dmi'
	icon_state = "arrow"
	var/dead_end_chance = 55
	/// Тип карты, подтипы которой которые будут спавнится этой лендмаркой. Сам родитель в список входить не будет.
	var/templates_type
	/// Тип стен. На данный момент используется только для тупиков.
	var/turf/wall_type = /turf/simulated/wall/r_wall/invincible
	/// Список путей дверей и шансов на их спавн.
	var/list/door_types = list(
		/obj/landmark/empty = 1
	)

/obj/landmark/map_load_mark/complex/Initialize()
	. = ..()
	if(templates_type)
		templates = subtypesof(templates_type)
