/datum/map/company_ship
	name = "empty space"
	full_name = "empty space"
	path = "company_ship"
	flags = null
	config_path = "config/torch_config.txt"

	admin_levels  = list(3)
	escape_levels = list(4)
	empty_levels  = list(5)
	accessible_z_levels = list("1"=1,"2"=30)
	overmap_size = 7
	overmap_event_areas = 5

	allowed_spawns = list("Cryogenic Storage")
	default_spawn = "Cryogenic Storage"

	station_name  = "empty space"
	station_short = "empty space"
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

	default_law_type = /datum/ai_laws/solgov
	use_overmap = 1
	num_exoplanets = 2

	away_site_budget = 3
	min_offmap_players = 0

	welcome_sound = null
