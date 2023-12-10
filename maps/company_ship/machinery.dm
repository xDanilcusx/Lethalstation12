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

/obj/machinery/recharger
	allowed_devices = list(/obj/item/device/flashlight, /obj/item/gun/energy, /obj/item/gun/magnetic/railgun, /obj/item/melee/baton, /obj/item/cell, /obj/item/modular_computer, /obj/item/device/suit_sensor_jammer, /obj/item/stock_parts/computer/battery_module, /obj/item/shield_diffuser, /obj/item/clothing/mask/smokable/ecig, /obj/item/device/radio)

/obj/machinery/recharger/wallcharger
	allowed_devices = list(/obj/item/device/flashlight, /obj/item/gun/energy, /obj/item/gun/magnetic/railgun, /obj/item/melee/baton, /obj/item/cell, /obj/item/modular_computer, /obj/item/device/suit_sensor_jammer, /obj/item/stock_parts/computer/battery_module, /obj/item/shield_diffuser, /obj/item/clothing/mask/smokable/ecig, /obj/item/device/radio)

/obj/machinery/light/complex
	light_type = /obj/item/light/tube/warm/complex

/obj/machinery/light/complex/attackby(obj/item/W, mob/user)
	if (isScrewdriver(W))
		return
	..()

/obj/item/light/tube/warm/complex
	broken_chance = 50
