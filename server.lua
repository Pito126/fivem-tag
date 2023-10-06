local adminList = {
    ["license:xxxxxxxxxxxxxxxxxxxxxxxxxxxx"] = "OWNER",  -- Replace xxx with FiveM license
    ["discord:yyyyyyyyyyyyyyyyyyyy"] = "ADMIN",  -- Replace yyyy with Discord ID
    ["discord:yyyyyyyyyyyyyyyyyyyy"] = "TRIAL ADMIN", 
}

RegisterCommand("tag", function(source, args, rawCommand)
    local playerId = source
    local playerIdentifiers = GetPlayerIdentifiers(playerId)
    for _, id in pairs(playerIdentifiers) do
        if adminList[id] then
            local rank = adminList[id]
            TriggerClientEvent('displayAdminTag', playerId, rank)
            return
        end
    end
    TriggerClientEvent('chatMessage', playerId, 'SYSTEM', {255, 0, 0}, "You are not an admin!")
end, false)
