#if !defined(using_map_DATUM)

	#include "areas.dm"
	#include "lobby.dm"
	#include "overmap.dm"
	#include "presets.dm"
	#include "procs.dm"
	#include "ranks.dm"
	#include "setup.dm"
	#include "shuttles.dm"
	#include "turfs.dm"
	#include "simplemobs.dm"

	#include "spawners.dm"
	#include "job/jobs.dm"
	#include "job/outfits/misc_outfits.dm"

	#include "ship.dmm"
//	#include "z1_admin.dmm"
//	#include "z2_transit.dmm"

	#include "../away/empty.dmm"

	#define using_map_DATUM /datum/map/company_ship

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Company Ship

#endif
