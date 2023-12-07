/datum/map/company_ship
	name = "Drone Ship"
	full_name = "Drone Ship"
	path = "company_ship"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK
	config_path = "config/torch_config.txt"

	admin_levels  = list(2)
	escape_levels = list(3)
	empty_levels  = list(4)
	accessible_z_levels = list("1"=1,"2"=2,"12"=30)
	overmap_size = 9
	overmap_event_areas = 1

	allowed_spawns = list("Cryogenic Storage")
	default_spawn = "Cryogenic Storage"

	station_name  = "Drone Ship"
	station_short = "Drone Ship"
	dock_name     = "Space"
	boss_name     = "The Company"
	boss_short    = "Company"
	company_name  = "The Company"
	company_short = "Company"

	map_admin_faxes = list(
		"The Company"
	)

	//These should probably be moved into the evac controller...
	shuttle_docked_message = "Attention all hands: Jump preparation complete. The bluespace drive is now spooling up, secure all stations for departure. Time to jump: approximately %ETD%."
	shuttle_leaving_dock = "Attention all hands: Jump initiated, exiting bluespace in %ETA%."
	shuttle_called_message = "Attention all hands: Jump sequence initiated. Transit procedures are now in effect. Jump in %ETA%."
	shuttle_recall_message = "Attention all hands: Jump sequence aborted, return to normal operating conditions."

	evac_controller_type = /datum/evacuation_controller/starship

	use_overmap = 1
	num_exoplanets = 2

	away_site_budget = 0
	min_offmap_players = 0

	welcome_sound = null
