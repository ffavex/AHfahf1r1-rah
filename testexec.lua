local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Replace with your actual URL
local keyValidationUrl = "https://vexxexploits.repl.co/checkkey.php?Checkkey="
local blacklistUrl = "https://replit.com/@vexxexploits/Authenticationn#blacklistedhwids.txt"

-- Your key goes here
G.Key = "YourKeyHere"

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

    -- Place your main script logic here
    print("Key is valid and user is not blacklisted. Executing main script...")
    -- Add your main code here
end

-- Execute the main function
main()
