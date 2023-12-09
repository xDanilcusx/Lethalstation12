/datum/map_template/ruin/exoplanet/bunker_entrance
	name = "Bunker entrance"
	id = "bunker_entrance"
	description = "."
	prefix = "maps/random_ruins/complex_ruins/bunker/"
	suffixes = list("entrance-1.dmm","entrance-2.dmm")
	spawn_cost = 1
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS | TEMPLATE_FLAG_NO_RADS | TEMPLATE_FLAG_ALLOW_DUPLICATES
	ruin_tags = RUIN_HABITAT|RUIN_HUMAN|RUIN_WRECK
	apc_test_exempt_areas = list(/area/map_template/complex/bunker = NO_APC)

/datum/map_template/ruin/complex/bunker/entrance/marks
	name = "Entrance marks"
	id = "bunker_entrance_marks"
	suffixes = list("entrance-2-marks.dmm")
	door_x = 4
	door_y = 5

/obj/landmark/map_load_mark/complex/bunker/mark_for_marks
	name = "Entrance bunker pieces spawn"
	icon = 'icons/effects/landmarks.dmi'
	icon_state = "x"
	templates_type = /datum/map_template/ruin/complex/bunker/entrance
