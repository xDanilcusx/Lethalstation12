/turf/simulated/wall/r_wall/gray
	paint_color = "#717171"

/turf/simulated/wall/r_wall/gray/bunker
	health_max = 90000

/turf/simulated/wall/r_wall/gray/bunker/attackby(obj/item/W, mob/user)
	return FALSE

/turf/simulated/floor/exoplanet/plating
	name = "plating"
	icon = 'icons/turf/flooring/plating.dmi'
	icon_state = "plating"

/turf/simulated/floor/exoplanet/plating/on_update_icon(update_neighbors)
	ClearOverlays()
	if(LAZYLEN(decals))
		AddOverlays(decals)
