/turf/simulated/floor/exoplanet/complex
	name = "plating"
	icon = 'icons/turf/flooring/plating.dmi'
	icon_state = "plating"
	var/loot_chance = 1
	var/sentry_chance = 0.2
	var/landmine_chance = 0.2
	var/list/loot_table = BUNKER_LOOT_TYPES

/turf/simulated/floor/exoplanet/complex/Initialize()
	. = ..()

	if(prob(landmine_chance))
		return

	if(prob(sentry_chance))
		return

	if(prob(loot_chance))
		var/loot_type = pick(loot_table)
		var/which_types = loot_table[loot_type]

		var/list/actual_list = (which_types==LOOT_ALL ? typesof_real(loot_type) : subtypesof_real(loot_type))

		var/booty = pick(actual_list)
		new booty(src)

/turf/simulated/floor/exoplanet/complex/on_update_icon(update_neighbors)
	ClearOverlays()
	if(LAZYLEN(decals))
		AddOverlays(decals)

/turf/simulated/floor/exoplanet/complex/no_loot
	loot_chance = 0
	sentry_chance = 0
	landmine_chance = 0

/turf/simulated/floor/exoplanet/complex/concrete
	name = "concrete"
	desc = "Stone-like artificial material."
	icon = 'icons/turf/flooring/misc.dmi'
	icon_state = "concrete"

/turf/simulated/floor/exoplanet/complex/concrete/on_update_icon()
	ClearOverlays()
	if(burnt)
		AddOverlays(get_damage_overlay("burned[(x + y) % 3]", BLEND_MULTIPLY))
	if(broken)
		AddOverlays(get_damage_overlay("broken[(x + y) % 5]", BLEND_MULTIPLY))

/turf/simulated/floor/exoplanet/complex/concrete/melt()
	burnt = TRUE
	update_icon()

#define CONCRETE_GREY_COLOR "#717171"

/turf/simulated/wall/r_wall/gray
	paint_color = CONCRETE_GREY_COLOR

/turf/simulated/wall/r_wall/invincible
	desc = "A huge chunk of metal used to separate rooms. This one looks very durable."
	floor_type = /turf/simulated/floor/exoplanet/complex/no_loot

/turf/simulated/wall/r_wall/invincible/New(newloc)
	..(newloc, MATERIAL_PLASTEEL,MATERIAL_TITANIUM)

/turf/simulated/wall/r_wall/invincible/can_damage_health()
	if (src) return FALSE
	..()

/turf/simulated/wall/r_wall/invincible/attack_hand()
	return FALSE

/turf/simulated/wall/r_wall/invincible/attackby()
	return FALSE

/turf/simulated/wall/r_wall/invincible/fire_act()
	return FALSE

/turf/simulated/wall/r_wall/invincible/ex_act()
	return FALSE

/turf/simulated/wall/r_wall/invincible/bunker/attackby(obj/item/W, mob/user)
	return FALSE
