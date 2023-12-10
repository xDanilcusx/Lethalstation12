#define CONCRETE_GREY_COLOR "#717171"

/turf/simulated/wall/r_wall/gray
	paint_color = CONCRETE_GREY_COLOR

/turf/simulated/floor/exoplanet/plating
	name = "plating"
	icon = 'icons/turf/flooring/plating.dmi'
	icon_state = "plating"

/turf/simulated/floor/exoplanet/plating/on_update_icon(update_neighbors)
	ClearOverlays()
	if(LAZYLEN(decals))
		AddOverlays(decals)

/turf/simulated/wall/r_wall/invincible
	desc = "A huge chunk of metal used to separate rooms. This one looks very durable."
	floor_type = /turf/simulated/floor/exoplanet/plating

/turf/simulated/wall/r_wall/invincible/New(newloc)
	..(newloc, MATERIAL_PLASTEEL,MATERIAL_TITANIUM)

/turf/simulated/wall/r_wall/invincible/can_damage_health()
	if(src) return FALSE
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
