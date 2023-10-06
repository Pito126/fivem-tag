local adminList = {
    ["discord:yyyyyyyyyyyyyyyyyyyy"] = "OWNER", -- You can choose between using discord or license ["discord:yyy"], ["license:yyy"]
    ["discord:yyyyyyyyyyyyyyyyyyyy"] = "ADMIN",
    ["license:yyyyyyyyyyyyyyyyyyyy"] = "TRIAL ADMIN",
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
    TriggerClientEvent('chatMessage', playerId, 'SYSTEM', {255, 0, 0}, "You are not admin!")
end, false)
