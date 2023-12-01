/datum/job/submap
	branch = /datum/mil_branch/civilian
	rank =   /datum/mil_rank/civ/contractor
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/contractor)
	required_language = null

/datum/map/company_ship
	branch_types = list(
		/datum/mil_branch/civilian
	)

	spawn_branch_types = list(
		/datum/mil_branch/civilian
	)

/*
 *  Branches
 *  ========
 */

/datum/mil_branch/civilian
	name = "Civilian"
	name_short = "Civ"
	email_domain = "freemail.net"
	allow_custom_email = TRUE

	rank_types = list(
		/datum/mil_rank/civ/contractor
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/contractor
	)

/datum/mil_rank/civ/contractor
	name = "Contractor"
