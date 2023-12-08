/datum/map_template/ruin/complex
	prefix = "maps/random_ruins/complex_ruins/"
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS | TEMPLATE_FLAG_NO_RADS

	/// Координаты турфа "двери" в комнату писать сюда
	var/door_x = 1 // COUNT FROM ONE!!!
	var/door_y = 1 // COUNT FROM ONE!!!

/datum/map_template/ruin/complex/after_load(z)
	for(var/obj/landmark/map_load_mark/complex/mark in subtemplates_to_spawn)
		subtemplates_to_spawn -= mark
		if(!LAZYLEN(mark.templates))
			continue

		var/datum/map_template/ruin/complex/map = pick(mark.templates)
		var/turf/mark_turf = get_turf(mark)

		var/list/doors = mark.door_types
		if(LAZYLEN(doors))
			var/atom/door = pickweight(doors)
			if(door)
				door = new door(get_turf(mark))
				door.dir = mark.dir

			/// Тупик, нет смысла генерить следующую комнату
			if(isturf(door))
				continue

		map = new map()
		var/x_pos = mark.x - map.door_x + ceil(map.width/2)
		var/y_pos = mark.y - map.door_y + ceil(map.height/2)

		var/turf/location = locate(x_pos, y_pos, mark.z)
		location = get_step(location, mark.dir)

		if(!map.load(location, TRUE))
			var/atom/dead_end = doors[1]
			new dead_end(mark_turf)

		qdel(mark)

	LAZYCLEARLIST(subtemplates_to_spawn)

/obj/landmark/map_load_mark/complex
	icon = 'maps/random_ruins/complex_ruins/landmarks.dmi'
	icon_state = "arrow"
	var/list/door_types = list() // Список путей и шансов на их спавн. Первый путь из списка считается стеной для тупиков.
	var/templates_type

/obj/landmark/map_load_mark/complex/Initialize()
	. = ..()
	templates = subtypesof(templates_type)

/area/map_template/complex
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_NO_MODIFY
	base_turf = /turf/simulated/floor/exoplanet/plating

/obj/landmark/empty
	delete_me = TRUE
