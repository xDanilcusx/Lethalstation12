/obj/overmap/visitable/ship/empty_space
	name = "Empty space"
	desc = "//ERROR//."
	icon_state = "sector"
	sector_flags = OVERMAP_SECTOR_KNOWN|OVERMAP_SECTOR_IN_SPACE|OVERMAP_SECTOR_BASE
	scannable = FALSE
	initial_restricted_waypoints = list("Company" = list("nav_drone_ship"))

/obj/overmap/visitable/ship/landable/company_ship
	name = "Drone ship"
	desc = "Small semi-automated vessel, broadcasting \"SALVAGE DUTY IN PROGRESS, DO NOT DISTURB\"."
	shuttle = "Company"
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECONDS
	vessel_mass = 3000
	skill_needed = SKILL_EXPERIENCED
	vessel_size = SHIP_SIZE_TINY
	fore_dir = EAST

/obj/shuttle_landmark/company_ship
	name = "Drone ship Landing Zone"
	landmark_tag = "nav_drone_ship"
	/// Если убрать это дерьмо - после взлёта мы будем встречать эмбиенс космоса и анимацию левитации
	base_turf = /turf/simulated/floor/plating
	base_area = /area/maintenance

/obj/shuttle_landmark/transit/company_ship
	name = "In transit"
	landmark_tag = "nav_transit_drone_ship"

/datum/shuttle/autodock/overmap/company_ship
	name = "Company"
	current_location = "nav_drone_ship"
	landmark_transition = "nav_transit_drone_ship"
	warmup_time = 6
	move_time = 30
	knockdown = 0
	range = 0

	ceiling_type = /turf/simulated/floor/shuttle_ceiling
	shuttle_area = /area/main_ship
	skill_needed = SKILL_UNSKILLED
	flags = SHUTTLE_FLAGS_PROCESS

/obj/machinery/computer/shuttle_control/explore/company_ship
	name = "shuttle control console"
	shuttle_tag = "Company"

/*
 *  Basic ships
 *  ========
 */

/obj/overmap/visitable/ship/torch
	name = "SEV Torch"
	desc = "A frankensteined HNS Mako-class corvette, broadcasting SCGEC codes and the designation \"SEV Torch, HSC-4-13-X\"."
	fore_dir = WEST
	vessel_mass = 100000
	burn_delay = 2 SECONDS
	sector_flags = OVERMAP_SECTOR_KNOWN|OVERMAP_SECTOR_IN_SPACE|OVERMAP_SECTOR_BASE
	known_ships = list(
		/obj/overmap/visitable/ship/landable/exploration_shuttle,
		/obj/overmap/visitable/ship/landable/aquila,
		/obj/overmap/visitable/ship/landable/guppy
	)

	initial_restricted_waypoints = list(
		"Charon" = list("nav_hangar_charon"), 	//can't have random shuttles popping inside the ship
		"Guppy" = list("nav_hangar_guppy"),
		"Aquila" = list("nav_hangar_aquila"),
		"Skrellian Scout" = list("nav_skrellscout_dock"), //restricts Skrell Scoutship specific docking waypoint on deck 4 portside
		"Skrellian Shuttle" = list("nav_skrellscoutsh_altdock"),
		"Rescue" = list("nav_ert_dock"), //restricts ERT Shuttle specific docking waypoint on deck 4 portside
		"ITV The Reclaimer" = list("nav_hangar_gantry_torch"), //gantry shuttles
		"ITV Vulcan" = list("nav_hangar_gantry_torch_two"),
		"ITV Spiritus" = list("nav_hangar_gantry_torch_three"),
		"SRV Venerable Catfish" = list("nav_verne_5"), //docking location for verne shuttle
		"Cyclopes" = list("nav_merc_dock"),
		"ICGNV Hound" = list("nav_hound_dock"),
		"SFV Arbiter" = list("nav_sfv_arbiter_dock")
	)

	initial_generic_waypoints = list(
		//start Bridge Deck
		"nav_merc_deck5",
		"nav_ninja_deck5",
		"nav_skipjack_deck5",
		"nav_ert_deck5",
		"nav_bridge_charon",
		"nav_bridge_guppy",
		"nav_bridge_aquila",

		//start First Deck
		"nav_merc_deck1",
		"nav_ninja_deck1",
		"nav_skipjack_deck1",
		"nav_ert_deck4",
		"nav_deck4_charon",
		"nav_deck4_guppy",
		"nav_deck4_aquila",

		//start Second Deck
		"nav_merc_deck2",
		"nav_ninja_deck2",
		"nav_skipjack_deck2",
		"nav_ert_deck3",
		"nav_deck3_charon",
		"nav_deck3_guppy",
		"nav_deck3_aquila",

		//start Third Deck
		"nav_merc_deck3",
		"nav_ninja_deck3",
		"nav_skipjack_deck3",
		"nav_ert_deck2",
		"nav_deck2_charon",
		"nav_deck2_guppy",
		"nav_deck2_aquila",

		//start Forth Deck
		"nav_merc_deck4",
		"nav_ninja_deck4",
		"nav_skipjack_deck4",
		"nav_ert_deck1",
		"nav_deck1_charon",
		"nav_deck1_guppy",
		"nav_deck1_aquila",
		"nav_vox_raider_dock",

		//start Hanger Deck
		"nav_merc_hanger",
		"nav_ninja_hanger",
		"nav_skipjack_hanger",
		"nav_ert_hanger",
	)

/obj/overmap/visitable/ship/landable/exploration_shuttle
	name = "Charon"
	desc = "An SSE-U11 long range shuttle, broadcasting SCGEC codes and the callsign \"Torch-2 Charon\"."
	shuttle = "Charon"
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECONDS
	vessel_mass = 3000
	fore_dir = NORTH
	skill_needed = SKILL_BASIC
	vessel_size = SHIP_SIZE_SMALL
	known_ships = list(
		/obj/overmap/visitable/ship/torch,
		/obj/overmap/visitable/ship/landable/aquila,
		/obj/overmap/visitable/ship/landable/guppy
	)

/obj/overmap/visitable/ship/landable/aquila
	name = "Aquila"
	desc = "A PM-24 modular transport, broadcasting SCGEC codes and the callsign \"Torch-1 Aquila\"."
	shuttle = "Aquila"
	vessel_mass = 10000
	max_speed = 1/(1 SECONDS)
	burn_delay = 0.5 SECONDS //spammable, but expensive
	fore_dir = NORTH
	vessel_size = SHIP_SIZE_SMALL
	known_ships = list(
		/obj/overmap/visitable/ship/torch,
		/obj/overmap/visitable/ship/landable/exploration_shuttle,
		/obj/overmap/visitable/ship/landable/guppy
	)

/obj/overmap/visitable/ship/landable/guppy
	name = "Guppy"
	desc = "An SSE-U3 utility pod, broadcasting SCGEC codes and the callsign \"Torch-3 Guppy\"."
	shuttle = "Guppy"
	max_speed = 1/(3 SECONDS)
	burn_delay = 2 SECONDS
	vessel_mass = 1800
	fore_dir = SOUTH
	skill_needed = SKILL_BASIC
	vessel_size = SHIP_SIZE_TINY
	known_ships = list(
		/obj/overmap/visitable/ship/torch,
		/obj/overmap/visitable/ship/landable/exploration_shuttle,
		/obj/overmap/visitable/ship/landable/aquila
	)

/obj/machinery/computer/shuttle_control/explore/aquila
	name = "aquila control console"
	shuttle_tag = "Aquila"

/obj/machinery/computer/shuttle_control/explore/exploration_shuttle
	name = "shuttle control console"
	shuttle_tag = "Charon"

/obj/machinery/computer/shuttle_control/explore/guppy
	name = "guppy control console"
	shuttle_tag = "Guppy"
