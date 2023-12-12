/obj/item/tank/oxygen_emergency_double
	slot_flags = SLOT_BELT | SLOT_BACK

/obj/item/clothing/suit/space/void/company
	name = "old space suit"
	desc = "An orange spacesuit sporting clean lines and somewhat durable plating. Old, smelly, and slightly suspicious."
	icon_state = "syndicate"
	item_state_slots = list(
		slot_l_hand_str = "space_suit_syndicate",
		slot_r_hand_str = "space_suit_syndicate",
	)
	helmet = /obj/item/clothing/head/helmet/space/void/company
	boots = /obj/item/clothing/shoes/magboots
	item_flags = ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_INVALID_FOR_CHAMELEON

/obj/item/clothing/head/helmet/space/void/company
	name = "old space helmet"
	icon_state = "syndicate-helm-black"
	item_state = "syndicate-helm-black"
	camera = /obj/machinery/camera/network/helmet
	action_button_name = null
	brightness_on = FALSE
	tint = TINT_MODERATE

/obj/structure/closet/red
	closet_appearance = /singleton/closet_appearance/red

/singleton/closet_appearance/red
	decals = list("lower_vent")
	color = COLOR_RED_GRAY

/obj/item/device/flashlight
	var/obj/item/cell/device/cell = /obj/item/cell/device/standard
	var/power_usage = 160

/obj/item/device/flashlight/get_cell()
	return cell

/obj/item/device/flashlight/Initialize()
	. = ..()
	if(ispath(cell))
		cell = new cell(src)

/obj/item/device/flashlight/attack_self(mob/user)
	if (flashlight_flags & FLASHLIGHT_ALWAYS_ON)
		to_chat(user, "You cannot toggle the [name].")
		return FALSE

	if (!isturf(user.loc))
		to_chat(user, "You cannot turn the [name] on while in this [user.loc].")//To prevent some lighting anomalities.
		return FALSE

	if (flashlight_flags & FLASHLIGHT_SINGLE_USE && on)
		to_chat(user, "The [name] is already lit.")
		return FALSE

	var/obj/item/cell/has_cell = get_cell()
	if (!has_cell || !has_cell.check_charge(power_usage * CELLRATE))
		to_chat(user, "You try to enable [name], but nothing happens...")
		return FALSE

	on = !on

	if (on)
		START_PROCESSING(SSobj, src)
	if (on && activation_sound)
		playsound(get_turf(src), activation_sound, 75, 1)
	set_flashlight()
	update_icon()
	user.update_action_buttons()
	return TRUE

/obj/item/device/flashlight/Process()
	if(power_usage && on)
		var/obj/item/cell/has_cell = get_cell()
		if(!has_cell) // No cell
			on = FALSE
			set_flashlight()
			STOP_PROCESSING(SSobj, src)
			update_icon()
			return FALSE
		if(!has_cell.checked_use(power_usage * CELLRATE)) // Use power and display if we run out.
			on = FALSE
			set_flashlight()
			STOP_PROCESSING(SSobj, src)
			visible_message(SPAN_WARNING("[icon2html(src, viewers(src))] [src] lets out a quiet click as it powers down."), SPAN_WARNING("You hear \a [src] let out a quiet click."))
			update_icon()
			return FALSE

/obj/item/device/flashlight/examine(mob/user, distance)
	. = ..()
	if(power_usage && cell)
		if(distance <= 1 || loc == user) // нужно будет переписать эту проверку ради всего святого
			to_chat(user, SPAN_NOTICE("\The [src] charge meter reads [round(cell.percent(), 0.1)]%."))

/obj/item/device/flashlight/upgraded
	w_class = ITEM_SIZE_NORMAL
	power_usage = 80

/obj/structure/railing/mapped
	init_color = "#c7b446"
