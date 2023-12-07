#include "mapsystem\map_preferences.dm"
#include "mapsystem\map_ranks.dm"
#include "mapsystem\maps.dm"
#include "mapsystem\maps_announcements.dm"
#include "mapsystem\maps_areas.dm"
#include "mapsystem\maps_jobs.dm"
#include "mapsystem\maps_unit_testing.dm"
#include "unit_tests\unit_testing.dm"

#include "example\example_define.dm" // Always included because tests. May be fixable later.

#include "using.dm"

GLOBAL_DATUM_INIT(using_map, /datum/map, new using_map_DATUM)

#include "antag_spawn\antag_spawn_bases.dm"
#include "antag_spawn\ert\ert.dm"
#include "antag_spawn\heist\heist.dm"
#include "antag_spawn\mercenary\mercenary.dm"
#include "antag_spawn\ninja\ninja.dm"
#include "antag_spawn\vox\voxraider.dm"
#include "antag_spawn\wizard\wizard.dm"

#include "away\away_sites.dm"
#include "away_sites_testing\away_sites_testing_define.dm"
#include "random_ruins\exoplanet_ruins\exoplanet_ruins.dm"
#include "random_ruins\space_ruins\space_ruins.dm"

#include "random_ruins\complex_ruins\complex_ruins.dm"
#include "random_ruins\complex_ruins\bunker\_bunker.dm"
