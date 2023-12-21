
/// Для корректной работы генерации все пресеты комнат должны быть нечётного размера.

/datum/map_template/ruin/complex
	prefix = "maps/random_ruins/complex_ruins/"
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS | TEMPLATE_FLAG_NO_RADS

	/// Координаты центра входа в комнату писать сюда
	var/entrance_x = 1 // COUNT FROM ONE!!!
	var/entrance_y = 1 // COUNT FROM ONE!!!

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

		var/direction = mark.dir
		var/turn_angle = dir2angle(direction)

		message_admins("direction [direction] : type [mark.type]")
		message_admins("типаж [map.type]")
		if(turn_angle)
			var/newx = map.entrance_x
			var/newy = map.entrance_y
			message_admins("turn_angle [turn_angle]")
			for(var/to_turn = turn_angle + 180, to_turn > 0, to_turn -= 90)
				newx = map.entrance_y + abs(map.entrance_x - map.entrance_y)
				newy = map.entrance_x + abs(map.entrance_x - map.entrance_y)
			map.entrance_x = newx
			map.entrance_y = newy

		var/x_pos = mark.x - map.entrance_x + ceil(map.width/2)
		var/y_pos = mark.y - map.entrance_y + ceil(map.height/2)
		message_admins("x_pos = [mark.x] - [map.entrance_x] + [ceil(map.width/2)]")
		message_admins("y_pos = [mark.y] - [map.entrance_y] + [ceil(map.height/2)]")
		message_admins("x[x_pos] ; y[y_pos]")
		message_admins("----------------------------------")

		var/turf/doorway_loc = locate(x_pos, y_pos, mark.z)
		var/turf/location = get_step(doorway_loc, direction)

		/// DEBUG
		for(var/turf/to_check in map.get_affected_turfs(location, TRUE))
			to_check.color = COLOR_SABER_GREEN
		location.color = COLOR_AMBER
		doorway_loc.color = COLOR_SABER_BLUE

		if(!location)
			new dead_end(mark_turf)
			qdel(mark)
			continue

		var/is_overlapping
		for(var/turf/to_check in map.get_affected_turfs(location, TRUE))
			if(to_check.turf_flags & TURF_FLAG_NORUINS)
				is_overlapping = TRUE
				break

		if(is_overlapping || prob(mark.dead_end_chance))
			new dead_end(mark_turf)
			qdel(mark)
			continue

		var/list/doors = mark.door_types
		var/atom/door = pickweight(doors)
		if(!door)
			new dead_end(mark_turf)
			qdel(mark)
			continue

		door = new door(mark_turf)
		door.dir = direction

		if(!map.load(location, TRUE, turn_angle))
			new dead_end(mark_turf)

		qdel(mark)

	LAZYCLEARLIST(subtemplates_to_spawn)

/area/map_template/complex
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_NO_MODIFY
	base_turf = /turf/simulated/floor/exoplanet/complex/no_loot

/************************************
			LANDMARKS
************************************/

/obj/landmark/empty
	delete_me = TRUE

/obj/landmark/map_load_mark/complex
	icon = 'maps/random_ruins/complex_ruins/landmarks.dmi'
	icon_state = "arrow"
	dir = NORTH
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
