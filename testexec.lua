G.Key = "TEST123"
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Replace with your actual URL
local keyValidationUrl = "https://vexxexploits.repl.co/checkkey.php?Checkkey="
local blacklistUrl = "https://replit.com/@vexxexploits/Authenticationn#blacklistedhwids.txt"

-- Function to get the player's client ID (user ID)
local function getClientID()
    return player.UserId
end

-- Function to check if the key is valid
local function checkKey(inputKey)
    local url = keyValidationUrl .. HttpService:UrlEncode(inputKey)
    local success, response = pcall(function()
        return HttpService:GetAsync(url)
    end)

    if success then
        local result = HttpService:JSONDecode(response)
        return result.valid
    else
        return false
    end
end

-- Function to check if the client ID is blacklisted
local function isBlacklisted(clientID)
    local success, response = pcall(function()
        return HttpService:GetAsync(blacklistUrl)
    end)

    if success then
        local blacklistedIDs = response:split("\n")
        for _, id in ipairs(blacklistedIDs) do
            if tonumber(id) == clientID then
                return true
            end
        end
    end
    return false
end

-- Main execution logic
local function main()
    local clientID = getClientID()

    -- Check if the player is blacklisted
    if isBlacklisted(clientID) then
        player:Kick("Blacklisted User")
        return
    end

    -- Check if the key is valid
    if not checkKey(G.Key) then
        player:Kick("Invalid Key")
        return
    end

    -- Key is valid; execute another script
    print("Key is valid and user is not blacklisted. Executing main script...")
    
    local scriptToExecute = [[
      "https://raw.githubusercontent.com/ffavex/AHfahf1r1-rah/refs/heads/main/thiefliferemedy.lua"
        print("Main script executed successfully!")
    ]]

    -- Execute the additional script using loadstring
    local success, loadError = pcall(function()
        loadstring("https://raw.githubusercontent.com/ffavex/AHfahf1r1-rah/refs/heads/main/thiefliferemedy.lua")()
    end)

    if not success then
        warn("Error executing main script: " .. loadError)
    end
end

-- Execute the main function
main()
