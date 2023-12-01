/datum/map/company_ship
	allowed_jobs = list(
		/datum/job/assistant
	)

/datum/map/company_ship
	default_assistant_title = "Company Asset"

/datum/job
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/contractor
	)
	required_language = LANGUAGE_HUMAN_EURO

/datum/job/assistant
	title = "Company Asset"
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Company"
	economic_power = 6
	announced = FALSE
	outfit_type = /singleton/hierarchy/outfit/job/torch/passenger
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(
		/datum/mil_rank/civ/contractor
	)
	min_goals = 2
	max_goals = 7
