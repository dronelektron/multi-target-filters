void Filter_Create() {
    AddMultiTargetFilter("@spectators", Filter_Spectators, "spectators", MULTI_LINGUAL_YES);

    AddMultiTargetFilter("@allies", Filter_Allies, "allies", MULTI_LINGUAL_YES);
    AddMultiTargetFilter("@allies-alive", Filter_AlliesAlive, "alive allies", MULTI_LINGUAL_YES);
    AddMultiTargetFilter("@allies-dead", Filter_AlliesDead, "dead allies", MULTI_LINGUAL_YES);

    AddMultiTargetFilter("@axis", Filter_Axis, "axis", MULTI_LINGUAL_YES);
    AddMultiTargetFilter("@axis-alive", Filter_AxisAlive, "alive axis", MULTI_LINGUAL_YES);
    AddMultiTargetFilter("@axis-dead", Filter_AxisDead, "dead axis", MULTI_LINGUAL_YES);
}

bool Filter_Spectators(const char[] pattern, ArrayList clients) {
    Filter_Apply(clients, TEAM_SPECTATOR, HEALTH_ALL);

    return PATTERN_RECOGNIZED_YES;
}

bool Filter_Allies(const char[] pattern, ArrayList clients) {
    Filter_Apply(clients, TEAM_ALLIES, HEALTH_ALL);

    return PATTERN_RECOGNIZED_YES;
}

bool Filter_AlliesAlive(const char[] pattern, ArrayList clients) {
    Filter_Apply(clients, TEAM_ALLIES, HEALTH_ALIVE);

    return PATTERN_RECOGNIZED_YES;
}

bool Filter_AlliesDead(const char[] pattern, ArrayList clients) {
    Filter_Apply(clients, TEAM_ALLIES, HEALTH_DEAD);

    return PATTERN_RECOGNIZED_YES;
}

bool Filter_Axis(const char[] pattern, ArrayList clients) {
    Filter_Apply(clients, TEAM_AXIS, HEALTH_ALL);

    return PATTERN_RECOGNIZED_YES;
}

bool Filter_AxisAlive(const char[] pattern, ArrayList clients) {
    Filter_Apply(clients, TEAM_AXIS, HEALTH_ALIVE);

    return PATTERN_RECOGNIZED_YES;
}

bool Filter_AxisDead(const char[] pattern, ArrayList clients) {
    Filter_Apply(clients, TEAM_AXIS, HEALTH_DEAD);

    return PATTERN_RECOGNIZED_YES;
}

static void Filter_Apply(ArrayList clients, int team, int health) {
    for (int client = 1; client <= MaxClients; client++) {
        if (!IsClientInGame(client) || GetClientTeam(client) != team) {
            continue;
        }

        bool push = false;

        push |= health == HEALTH_ALL;
        push |= health == HEALTH_ALIVE && IsPlayerAlive(client);
        push |= health == HEALTH_DEAD && !IsPlayerAlive(client);

        if (push) {
            clients.Push(client);
        }
    }
}
