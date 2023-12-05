/obj/machinery/power/apc/debug/drone_ship
	cell_type = /obj/item/cell/infinite
	locked = FALSE

/obj/machinery/power/apc/debug/drone_ship/attackby(obj/item/W, mob/user)
	return FALSE

/obj/machinery/atmospherics/unary/engine/Initialize()
	. = ..()
	controller = new(src)
	update_nearby_tiles(need_rebuild=1)

	for(var/ship in SSshuttle.ships)
		var/obj/overmap/visitable/ship/S = ship
		if(S.check_ownership(src))
			S.engines |= controller
			break

/obj/machinery/computer/modular/preset/company_console
	default_software = list(
		/datum/computer_file/program/camera_monitor,
		/datum/computer_file/program/records,
		/datum/computer_file/program/supply,
	)
