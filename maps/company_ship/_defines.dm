#define MANEUVER_STAMINA_LOSS_MOD -3
#define MANEUVER_COOLDOWN_MOD 0.6
#define LEAP_RANGE_ADD 0.5

#define LOOT_ALL           1
#define LOOT_SUBTYPES_ONLY 2

#define BUNKER_LOOT_TYPES list(\
	/obj/item/ironing_iron = LOOT_ALL,\
	/obj/item/glass_jar = LOOT_ALL,\
	/obj/item/bikehorn = LOOT_ALL,\
	/obj/item/haircomb = LOOT_ALL,\
	/obj/item/archaeological_find = LOOT_SUBTYPES_ONLY,\
	/obj/item/instrument = LOOT_SUBTYPES_ONLY,\
	/obj/item/material = LOOT_SUBTYPES_ONLY,\
	/obj/item/grenade = LOOT_SUBTYPES_ONLY,\
	/obj/item/stack = LOOT_SUBTYPES_ONLY,\
	/obj/item/dice = LOOT_SUBTYPES_ONLY,\
	/obj/item/disk = LOOT_SUBTYPES_ONLY\
)
