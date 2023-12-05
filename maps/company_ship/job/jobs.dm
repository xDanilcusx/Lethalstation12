/datum/map/company_ship
	allowed_jobs = list(
		/datum/job/assistant
	)

/datum/map/company_ship
	default_assistant_title = "Company Asset"

/datum/job
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/contractor)
	required_language = LANGUAGE_SPACER

/datum/job/assistant
	title = "Company Asset"
	supervisors = "the Company"
	outfit_type = /singleton/hierarchy/outfit/job/torch/passenger
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/contractor)
	alt_titles = list()
	announced = FALSE

	total_positions = 4
	spawn_positions = 4
	economic_power = 0
	min_goals = 2
	max_goals = 7

	skill_points = 0
	max_skill = list(
		SKILL_BUREAUCRACY = SKILL_MAX,
		SKILL_FINANCE = SKILL_MIN,
		SKILL_EVA = SKILL_BASIC,
		SKILL_PILOT = SKILL_MIN,
		SKILL_HAULING = SKILL_TRAINED,
		SKILL_COMPUTER = SKILL_BASIC,
		SKILL_BOTANY = SKILL_MIN,
		SKILL_COOKING = SKILL_BASIC,
		SKILL_COMBAT = SKILL_TRAINED,
		SKILL_WEAPONS = SKILL_MIN,
		SKILL_FORENSICS = SKILL_MIN,
		SKILL_CONSTRUCTION = SKILL_TRAINED,
		SKILL_ELECTRICAL = SKILL_MIN,
		SKILL_ATMOS = SKILL_MIN,
		SKILL_ENGINES = SKILL_MIN,
		SKILL_DEVICES = SKILL_MAX,
		SKILL_SCIENCE = SKILL_EXPERIENCED,
		SKILL_MEDICAL = SKILL_EXPERIENCED,
		SKILL_ANATOMY = SKILL_TRAINED,
		SKILL_CHEMISTRY = SKILL_BASIC
	)
	min_skill = list(
		SKILL_BUREAUCRACY = SKILL_MAX,
		SKILL_FINANCE = SKILL_MIN,
		SKILL_EVA = SKILL_BASIC,
		SKILL_PILOT = SKILL_MIN,
		SKILL_HAULING = SKILL_TRAINED,
		SKILL_COMPUTER = SKILL_BASIC,
		SKILL_BOTANY = SKILL_MIN,
		SKILL_COOKING = SKILL_BASIC,
		SKILL_COMBAT = SKILL_TRAINED,
		SKILL_WEAPONS = SKILL_MIN,
		SKILL_FORENSICS = SKILL_MIN,
		SKILL_CONSTRUCTION = SKILL_TRAINED,
		SKILL_ELECTRICAL = SKILL_MIN,
		SKILL_ATMOS = SKILL_MIN,
		SKILL_ENGINES = SKILL_MIN,
		SKILL_DEVICES = SKILL_MAX,
		SKILL_SCIENCE = SKILL_EXPERIENCED,
		SKILL_MEDICAL = SKILL_EXPERIENCED,
		SKILL_ANATOMY = SKILL_TRAINED,
		SKILL_CHEMISTRY = SKILL_BASIC
	)
