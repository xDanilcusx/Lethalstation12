//A 'wound' system for space suits.
//Breaches greatly increase the amount of lost gas and decrease the armour rating of the suit.
//They can be healed with plastic or metal sheeting.

/datum/breach
	var/class = 0                           // Size. Lower is smaller. Uses floating point values!
	var/descriptor                          // 'gaping hole' etc.
	var/damtype = DAMAGE_BURN               // Punctured or melted
	var/patched = FALSE
	var/obj/item/clothing/suit/space/holder // Suit containing the list of breaches holding this instance.
	var/static/list/breach_brute_descriptors = list(
		"tiny puncture",
		"ragged tear",
		"large split",
		"huge tear",
		"gaping wound"
		)

	var/static/list/breach_burn_descriptors = list(
		"small burn",
		"melted patch",
		"sizable burn",
		"large scorched area",
		"huge scorched area"
		)

/obj/item/clothing/suit/space

	var/can_breach = 1                      // Set to 0 to disregard all breaching.
	var/list/breaches = list()              // Breach datum container.
	var/resilience = 0.2                    // Multiplier that turns damage into breach class. 1 is 100% of damage to breach, 0.1 is 10%. 0.2 -> 50 brute/burn damage to cause 10 breach damage
	var/breach_threshold = 3                // Min damage before a breach is possible. Damage is subtracted by this amount, it determines the "hardness" of the suit.
	var/damage = 0                          // Current total damage. Does not count patched breaches.
	var/brute_damage = 0                    // Specifically brute damage. Includes patched punctures.
	var/burn_damage = 0                     // Specifically burn damage. Includes patched burns.
	item_flags = null

/datum/breach/proc/update_descriptor()

	//Sanity...
	class = clamp(round(class), 1, 5)
	//Apply the correct descriptor.
	if (damtype == DAMAGE_BURN)
		descriptor = breach_burn_descriptors[class]
	else if (damtype == DAMAGE_BRUTE)
		descriptor = breach_brute_descriptors[class]
	if(patched)
		descriptor = "patched [descriptor]"

//Repair a certain amount of brute or burn damage to the suit.
/obj/item/clothing/suit/space/proc/repair_breaches(damtype, amount, mob/user)

	if(!can_breach || !breaches || !length(breaches))
		to_chat(user, "There are no breaches to repair on \the [src].")
		return

	var/list/valid_breaches = list()

	for(var/datum/breach/B in breaches)
		if(B.damtype == damtype)
			valid_breaches += B

	if(!length(valid_breaches))
		to_chat(user, "There are no breaches to repair on \the [src].")
		return

	var/amount_left = amount
	for(var/datum/breach/B in valid_breaches)
		if(!amount_left) break

		if(B.class <= amount_left)
			amount_left -= B.class
			valid_breaches -= B
			breaches -= B
		else
			B.class	-= amount_left
			amount_left = 0
			B.update_descriptor()

	user.visible_message(
		SPAN_NOTICE("\The [user] patches some of the damage on \the [src]."),
		SPAN_NOTICE("You patch some of the damage on \the [src].")
	)
	calc_breach_damage()

/obj/item/clothing/suit/space/proc/create_breaches(damtype, amount)

	amount -= src.breach_threshold
	amount *= src.resilience

	if(!can_breach || amount <= 0)
		return

	if(!breaches)
		breaches = list()

	if(damage > 25) return //We don't need to keep tracking it when it's at 250% pressure loss, really.

	//Increase existing breaches.
	for(var/datum/breach/existing in breaches)

		if(existing.damtype != damtype)
			continue

		//keep in mind that 10 breach damage == full pressure loss.
		//a breach can have at most 5 breach damage
		if (existing.class < 5)
			var/needs = 5 - existing.class
			if(amount < needs)
				existing.class += amount
				amount = 0
			else
				existing.class = 5
				amount -= needs

			if (existing.damtype == DAMAGE_BRUTE)
				var/message = "\The [existing.descriptor] on \the [src] gapes wider[existing.patched ? ", tearing the patch" : ""]!"
				visible_message(SPAN_WARNING(message))
			else if (existing.damtype == DAMAGE_BURN)
				var/message = "\The [existing.descriptor] on \the [src] widens[existing.patched ? ", ruining the patch" : ""]!"
				visible_message(SPAN_WARNING(message))

			existing.patched = FALSE

	if (amount)
		//Spawn a new breach.
		var/datum/breach/B = new()
		breaches += B

		B.class = min(amount,5)

		B.damtype = damtype
		B.update_descriptor()
		B.holder = src

		if (B.damtype == DAMAGE_BRUTE)
			visible_message(SPAN_WARNING("\A [B.descriptor] opens up on \the [src]!"))
		else if (B.damtype == DAMAGE_BURN)
			visible_message(SPAN_WARNING("\A [B.descriptor] marks the surface of \the [src]!"))

	calc_breach_damage()

//Calculates the current extent of the damage to the suit.
/obj/item/clothing/suit/space/proc/calc_breach_damage()

	damage = 0
	brute_damage = 0
	burn_damage = 0
	var/all_patched = TRUE

	if(!can_breach || !breaches || !length(breaches))
		SetName(initial(name))
		return 0

	for(var/datum/breach/B in breaches)
		if(!B.class)
			src.breaches -= B
			qdel(B)
		else
			if(!B.patched)
				all_patched = FALSE
				damage += B.class

			if (B.damtype == DAMAGE_BRUTE)
				brute_damage += B.class
			else if (B.damtype == DAMAGE_BURN)
				burn_damage += B.class

	if(damage >= 3)
		if(brute_damage >= 3 && brute_damage > burn_damage)
			SetName("punctured [initial(name)]")
		else if(burn_damage >= 3 && burn_damage > brute_damage)
			SetName("scorched [initial(name)]")
		else
			SetName("damaged [initial(name)]")
	else if(all_patched)
		SetName("patched [initial(name)]")
	else
		SetName(initial(name))

	return damage

//Handles repairs (and also upgrades).

/obj/item/clothing/suit/space/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/stack/material))
		var/repair_power = 0
		switch(W.get_material_name())
			if(MATERIAL_STEEL)
				repair_power = 2
			if(MATERIAL_PLASTIC)
				repair_power = 1

		if(!repair_power)
			return

		if(istype(loc,/mob/living/carbon/human))
			var/mob/living/carbon/human/H = loc
			if(H.wear_suit == src)
				to_chat(user, SPAN_WARNING("You cannot repair \the [src] while it is being worn."))
				return

		if(burn_damage <= 0)
			to_chat(user, "There is no surface damage on \the [src] to repair.") //maybe change the descriptor to more obvious? idk what
			return

		var/obj/item/stack/P = W
		var/use_amt = min(P.get_amount(), 3)
		if(use_amt && P.use(use_amt))
			repair_breaches(DAMAGE_BURN, use_amt * repair_power, user)
		return

	else if(isWelder(W))

		if(istype(loc,/mob/living/carbon/human))
			var/mob/living/carbon/human/H = loc
			if(H.wear_suit == src)
				to_chat(user, SPAN_WARNING("You cannot repair \the [src] while it is being worn."))
				return

		if (brute_damage <= 0)
			to_chat(user, "There is no structural damage on \the [src] to repair.")
			return

		var/obj/item/weldingtool/WT = W
		if(!WT.remove_fuel(5))
			return

		repair_breaches(DAMAGE_BRUTE, 3, user)
		return

	else if(istype(W, /obj/item/tape_roll))
		var/datum/breach/target_breach		//Target the largest unpatched breach.
		for(var/datum/breach/B in breaches)
			if(B.patched)
				continue
			if(!target_breach || (B.class > target_breach.class))
				target_breach = B

		if(!target_breach)
			to_chat(user, "There are no open breaches to seal with \the [W].")
		else
			playsound(src, 'sound/effects/tape.ogg',25)
			var/mob/living/carbon/human/H = user
			if(!istype(H)) return
			var/is_worn = istype(loc, /mob/living)
			if(do_after(user, (H.wear_suit == src ? 6 : 3) SECONDS, is_worn ? loc : src, is_worn ? DO_DEFAULT | DO_USER_UNIQUE_ACT | DO_PUBLIC_PROGRESS : DO_PUBLIC_UNIQUE)) //Sealing a breach on your own suit is awkward and time consuming
				user.visible_message(
					SPAN_NOTICE("\The [user] uses \the [W] to seal \the [target_breach.descriptor] on \the [src]."),
					SPAN_NOTICE("You use \the [W] to seal \the [target_breach.descriptor] on \the [src].")
				)
				target_breach.patched = TRUE
				target_breach.update_descriptor()
				calc_breach_damage()
		return

	..()

/obj/item/clothing/suit/space/examine(mob/user)
	. = ..()
	if(can_breach && breaches && length(breaches))
		for(var/datum/breach/B in breaches)
			to_chat(user, SPAN_DANGER("It has \a [B.descriptor]."))

/obj/item/clothing/suit/space/get_pressure_weakness(pressure)
	. = ..()
	if(can_breach && damage)
		. = min(1, . + damage*0.1)
