/datum/map/company_ship/roundend_player_status()
	for(var/mob/Player in GLOB.player_list)
		if(Player.mind && !isnewplayer(Player))
			if(Player.stat != DEAD)
				var/turf/playerTurf = get_turf(Player)
				if(evacuation_controller.round_over() && evacuation_controller.emergency_evacuation)
					if(isStationLevel(playerTurf.z))
						to_chat(Player, SPAN_INFO("<b>You managed to survive, but were marooned on [station_name()] as [Player.real_name]...</b>"))
					else if (isEscapeLevel(playerTurf.z))
						to_chat(Player, SPAN_COLOR("green", "<b>You managed to survive the events on [station_name()] as [Player.real_name].</b>"))
					else
						to_chat(Player, SPAN_INFO("<b>You managed to survive, but were marooned in the sector as [Player.real_name]...</b>"))
				else if(issilicon(Player))
					to_chat(Player, SPAN_COLOR("green", "<b>You remain operational after the events on [station_name()] as [Player.real_name].</b>"))
				else if (isNotStationLevel(playerTurf.z))
					to_chat(Player, SPAN_INFO("<b>You managed to survive, but were marooned in the sector as [Player.real_name]...</b>"))
				else
					to_chat(Player, SPAN_INFO("<b>You got through just another workday on [station_name()] as [Player.real_name].</b>"))
			else
				if(isghost(Player))
					var/mob/observer/ghost/O = Player
					if(!O.started_as_observer)
						to_chat(Player, SPAN_COLOR("red", "<b>You did not survive the events on [station_name()]...</b>"))
				else
					to_chat(Player, SPAN_COLOR("red", "<b>You did not survive the events on [station_name()]...</b>"))


/datum/map/company_ship/roundend_summary(list/data)
	var/desc
	var/survivors = data["surviving_total"]
	var/escaped_total = data["escaped_total"]
	var/marooned_total = data["left_behind_total"]
	var/ghosts = data["ghosts"]
	var/offship_players = data["offship_players"]

	if(survivors > 0)
		desc += "There [survivors > 1 ? "were <b>[survivors] survivors</b>" : "was <b>one survivor</b>"]"
		desc += " (<b>[escaped_total > 0 ? escaped_total : "none"] escaped, [marooned_total] marooned</b>),"
		data += " [offship_players > 1 ? "<b>[offship_players] off-ship players</b>" : "<b>one off-ship player</b>"]"
		data += " and <b>[ghosts] ghosts</b>.<br>"
	else
		desc += "There were <b>no survivors</b>, <b>[offship_players] off-ship players</b>, (<b>[ghosts] ghosts</b>)."

	return desc

/singleton/maneuver/perform(mob/living/user, atom/target, strength, reflexively = FALSE)
	if(can_be_used_by(user, target))
		var/do_flags = DO_DEFAULT | DO_USER_UNIQUE_ACT
		if(!reflexively)
			do_flags |= DO_PUBLIC_PROGRESS | DO_BAR_OVER_USER
			show_initial_message(user, target)
		user.face_atom(target)
		. = (!delay || reflexively || (do_after(user, delay, target, do_flags) && can_be_used_by(user, target)))
		if(cooldown)
			user.last_special = world.time + cooldown
		if(stamina_cost)
			user.adjust_stamina(stamina_cost * MANEUVER_STAMINA_LOSS_MOD)
