#include <sourcemod>

#include "mtf/filter"

#include "modules/filter.sp"

public Plugin myinfo = {
    name = "Multi-target filters",
    author = "Dron-elektron",
    description = "Additional multi-target filters",
    version = "1.1.0",
    url = "https://github.com/dronelektron/multi-target-filters"
};

public void OnPluginStart() {
    Filter_Create();
    RegPluginLibrary("multi-target-filters");
}
