/obj/item/clothing/suit/space/void/company
	name = "old space suit"
	desc = "An orange spacesuit sporting clean lines and somewhat durable plating. Old, smelly, and slightly suspicious."
	icon_state = "syndicate"
	item_state_slots = list(
		slot_l_hand_str = "space_suit_syndicate",
		slot_r_hand_str = "space_suit_syndicate",
	)
	helmet = /obj/item/clothing/head/helmet/space/company
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen_emergency_double
	item_flags = ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_INVALID_FOR_CHAMELEON

/obj/item/clothing/head/helmet/space/company
	name = "old space helmet"
	icon_state = "syndicate-helm-black"
	item_state = "syndicate-helm-black"
	camera = /obj/machinery/camera/network/helmet
	tint = TINT_MODERATE

/obj/structure/closet/red
	closet_appearance = /singleton/closet_appearance/red

/singleton/closet_appearance/red
	decals = list("lower_vent")
	color = COLOR_RED_GRAY
