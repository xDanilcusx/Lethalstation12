/mob/living/carbon/human
	throw_range = 2

/mob/living/carbon/human/get_acrobatics_multiplier(singleton/maneuver/attempting_maneuver)
	. = ..() * 0.5

	. += ((get_skill_value(SKILL_HAULING) - SKILL_MIN)/(SKILL_MAX - SKILL_MIN))
	//Perhaps one day this should grab logic from organs directly
	var/obj/item/organ/internal/augment/boost/muscle/aug = internal_organs_by_name["[BP_R_LEG]_aug"]
	if(istype(aug))
		. += aug.get_acrobatics_modifier()

	// Broken limb checks
	for (var/_limb in BP_LEGS_FEET)
		var/obj/item/organ/external/limb = get_organ(_limb)
		if (!limb)
			continue
		if (limb.status & ORGAN_BROKEN)
			. -= limb.splinted ? 0.25 : 0.5

	. += LEAP_RANGE_ADD

/datum/species/human
	maneuvers = list(
		/singleton/maneuver/leap
	)

/singleton/cultural_info/culture/human
	secondary_langs = list(LANGUAGE_SPACER)
