--[[

    *******************************
    * Miner and Botany Leve Doer  *
    *******************************

    *************************
    *  Version -> 0.0.0.1  *
    *************************

    Version Notes:
    0.0.0.1  ->    Quarrymill leves added. I borrow functions from the hunt log doer, diadem gathering, questionable companion and leve turn in scripts

    ***************
    * Description *
    ***************

    A SND Lua script that allows you to approach a compatible npc and accept the leves according to a whitelist and blacklist. The script will then navigate to the necessary location and initiate the leve. It will gather what is necessary until you teleport back to town.
    The script doesn't yet handle failing, so please make sure to gear up as needed to do the leves. If you fail and/or otherwise just want to start the leves without having the script accept them for you. You need to disable the whitelist if statement and comment out the leves you don't want manually.
    Accepting the levequests is slow and the more leves that are added to the list the slower the script will be. This will be fixed in a later version.
    *********************
    *  Required Plugins *
    *********************

    -> vnavmesh: https://puni.sh/api/repository/veyn
    -> SomethingNeedDoing (Expanded Edition) [Make sure to press the lua button when you import this] -> https://puni.sh/api/repository/croizat
    -> YesAlready:

    *****************************
    *  Required Plugin Settings *
    *****************************
    -> YesAlready:
                1. I need to go back and see what my settings are, but basically any message from the leves that can be processed with yesalready needs to be processed.
                2. YesAlready should auto accept the leve, auto intiate the leave, and auto teleport you back to town
    -> SomethingNeedDoing (Expanded Edition):
                1. Make sure to press the lua button when you import this

    ***********
    * Credits *
    ***********

    Author(s): CacahuetesManu
    Functions borrowed from: McVaxius, Umbra, LeafFriend, plottingCreeper and Mootykins, UcahnPatates, Leontopodium Nivale
]]

--[[

**************
*  Settings  *
**************
]]
--Choose either "Mining" or "Botany"
classneeded = "Botany"
Difficulty = 0

--Walk or Fly?
local mount = true -- have you unlocked mounts yet?
local move_type = "walk"



--These variables help with pathing and are used for unstucking
local interval_rate = 0.5
local timeout_threshold = 3
local ping_radius = 20

--[[
********************************
*  Helper Functions and Files  *
********************************
]]

NPC = {
    ["153"] = { Town = "Quarrymill", Name = "Nyell", X = 201.52588, Y = 9.736246, Z = -61.44812 }
}


blacklist = {
    ["Tag, You're It"] = true,     -- Does not play nice, do not activate
    ["Over the Underbush"] = true, -- in the middle of town. too many obstacles. Did not record the slot for this leve
    ["Fueling the Flames"] = true, -- nodes too far apart and also in the middle of town
}

levecoords = {
    --Quarrymill--
    --Mining--
    ["Baby, Light My Way"] = { Type = "Mining", X = 305.13522, Y = 10.998776, Z = -187.67111, slot = 4, ID = 737, node = "Mineral Deposit" },
    ["Can't Start a Fire"] = { Type = "Mining", X = 157.14229, Y = 17.953588, Z = -122.16721, slot = 8, ID = 735, node = "Mineral Deposit" },
    ["Tag, You're It"] = { Type = "Mining", X = 169.9021, Y = 8.155407, Z = -55.027515, slot = 2, ID = 736, node = "Mineral Deposit" },
    ["Fool Me Twice"] = { Type = "Mining", X = 257.7487, Y = 5.7759, Z = 50.023853, slot = 6, ID = 734, node = "Mineral Deposit" },
    --Botany--
    ["Nowhere to Slide"] = { Type = "Botany", X = -15.507979, Y = -1.5860113, Z = -53.834297, slot = 7, ID = 690, node = "Mature Tree" },
    ["Appleanche"] = { Type = "Botany", X = 205.21, Y = 29.400064, Z = -159.53403, slot = 2, ID = 696, node = "Mature Tree" },
    ["Moon in Rouge"] = { Type = "Botany", X = 169.97406, Y = 16.808193, Z = -149.16562, slot = 2, ID = 695, node = "Lush Vegetation Patch" },
    ["Over the Underbush"] = { Type = "Botany", X = 191.24551, Y = 6.615365, Z = -46.26381, slot = 2, ID = 694, node = "Mature Tree" },
    ["Fueling the Flames"] = { Type = "Botany", X = -184.36719, Y = 8.558928, Z = -48.451057, slot = 6, ID = 693, node = "Mature Tree" },
    ["Mushroom Gobblin\'"] = { Type = "Botany", X = 305.94687, Y = -0.4670663, Z = -10.3980875, slot = 7, ID = 697, node = "Mature Tree" },
    --Costa Del Sol--
}

--[[
************************
*  Required Functions  *
************************
]]

-- Call user provided input to figure out if we should work on Class Log or Hunt Log

function Truncate1Dp(num)
    return truncate and ("%.1f"):format(num) or num
end

function ParseNodeDataString(string)
    return Split(string, ",")
end

function GetDistanceToNode(node)
    local given_node = ParseNodeDataString(node)
    return GetDistanceToPoint(tonumber(given_node[2]), tonumber(given_node[3]), tonumber(given_node[4]))
end

function Split(inputstr, sep)
    if sep == nil then sep = "%s" end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

function SquaredDistance(x1, y1, z1, x2, y2, z2)
    local success, result = pcall(function()
        local dx = x2 - x1
        local dy = y2 - y1
        local dz = z2 - z1
        local dist = math.sqrt(dx * dx + dy * dy + dz * dz)
        return math.floor(dist + 0.5)
    end)
    if success then
        return result
    else
        return nil
    end
end

function WithinUnits(x1, y1, z1, x2, y2, z2, units)
    local dist = SquaredDistance(x1, y1, z1, x2, y2, z2)
    if dist then
        return dist <= units
    else
        return false
    end
end

function CheckNavmeshReady()
    was_ready = NavIsReady()
    while not NavIsReady() do
        yield("/echo Building navmesh, currently at " .. Truncate1Dp(NavBuildProgress() * 100) .. "%")
        yield("/wait " .. (interval_rate * 10))
    end
end

function MountFly()
    if HasFlightUnlocked(GetZoneID()) then
        while not GetCharacterCondition(4) do
            yield('/mount "Company Chocobo"')
            repeat
                yield("/wait " .. interval_rate)
            until not IsPlayerCasting() and not GetCharacterCondition(57)
        end
        if not GetCharacterCondition(81) and GetCharacterCondition(4) and not GetCharacterCondition(77) and
            not (IsInZone(146) or IsInZone(180)) then -- vnavmesh has problems flying around Outer La Noscea, Southern Thanalan, and Central Coerthas Highlands
            repeat
                yield("/echo Jumping to mount")
                yield('/gaction "Jump"')
                yield("/wait " .. interval_rate)
            until GetCharacterCondition(77) and not GetCharacterCondition(48)
        end
    end
end

function StopMoveFly()
    PathStop()
    while PathIsRunning() do
        yield("/wait " .. interval_rate)
    end
end

function Dismount()
    if GetCharacterCondition(77) then
        local random_j = 0
        ::DISMOUNT_START::
        CheckNavmeshReady()

        local land_x
        local land_y
        local land_z
        local i = 0
        while not land_x or not land_y or not land_z do
            land_x = QueryMeshPointOnFloorX(GetPlayerRawXPos() + math.random(0, random_j),
                GetPlayerRawYPos() + math.random(0, random_j), GetPlayerRawZPos() + math.random(0, random_j), false, i)
            land_y = QueryMeshPointOnFloorY(GetPlayerRawXPos() + math.random(0, random_j),
                GetPlayerRawYPos() + math.random(0, random_j), GetPlayerRawZPos() + math.random(0, random_j), false, i)
            land_z = QueryMeshPointOnFloorZ(GetPlayerRawXPos() + math.random(0, random_j),
                GetPlayerRawYPos() + math.random(0, random_j), GetPlayerRawZPos() + math.random(0, random_j), false, i)
            i = i + 1
        end
        NodeMoveFly("land," .. land_x .. "," .. land_y .. "," .. land_z)


        local timeout_start = os.clock()
        repeat
            yield("/wait " .. interval_rate)
            if os.clock() - timeout_start > timeout_threshold then
                random_j = random_j + 1
                goto DISMOUNT_START
            end
        until not PathIsRunning()

        yield('/mount "Company Chocobo"')

        timeout_start = os.clock()
        repeat
            yield("/wait " .. interval_rate)
            if os.clock() - timeout_start > timeout_threshold then
                random_j = random_j + 1
                goto DISMOUNT_START
            end
        until not GetCharacterCondition(77)
    end
    if GetCharacterCondition(4) then
        yield('/mount "Company Chocobo"')
        repeat
            yield("/wait " .. interval_rate)
        until not GetCharacterCondition(4)
    end
end

function NodeMoveFly()
    CheckNavmeshReady()
    if mount == true and move_type == "fly" then
        MountFly()
        yield("/vnav flyflag")
    elseif mount == true and move_type == "walk" then
        while not GetCharacterCondition(4) do
            yield('/mount "Company Chocobo"')
            repeat
                yield("/wait " .. interval_rate)
            until not IsPlayerCasting() and not GetCharacterCondition(57)
        end
        yield("/vnav moveflag")
    else
        yield("/vnav moveflag")
    end
end

function unstuckflag()
    if PathIsRunning() then
        local retry_timer = 0
        while PathIsRunning() do
            local success1, x1 = pcall(GetPlayerRawXPos)
            local success2, y1 = pcall(GetPlayerRawYPos)
            local success3, z1 = pcall(GetPlayerRawZPos)
            if not (success1 and success2 and success3) then
                goto continue
            end
            yield("/wait 2.0034")
            local success4, x2 = pcall(GetPlayerRawXPos)
            local success5, y2 = pcall(GetPlayerRawYPos)
            local success6, z2 = pcall(GetPlayerRawZPos)
            if not (success4 and success5 and success6) then
                goto continue
            end
            if WithinUnits(x1, y1, z1, x2, y2, z2, 3) and PathIsRunning() then
                yield("/vnav stop")
                retry_timer = retry_timer + 1
                yield("/hold W <wait.2.0>")
                yield("/gaction jump")
                yield("/release W")
                yield("/vnav reload")
                NodeMoveFly()
                yield("/wait 1.0034")
            elseif retry_time == 4 then
                yield("/vnav reload")
                yield("/wait 1.0021")
                retry_timer = retry_timer + 1
            elseif retry_time == 8 then
                yield("/vnav stop")
                yield("/echo Pathing failed")
                --Go back home somewhere
                yield("/li auto")
                yield("/pcraft stop")
            else
                retry_timer = 0
            end
            ::continue::
        end
    end
end

function unstucktarget(target)
    if PathIsRunning() then
        local retry_timer = 0
        while PathIsRunning() do
            local success1, x1 = pcall(GetPlayerRawXPos)
            local success2, y1 = pcall(GetPlayerRawYPos)
            local success3, z1 = pcall(GetPlayerRawZPos)
            if not (success1 and success2 and success3) then
                goto continue
            end
            yield("/wait 1.0034")
            local success4, x2 = pcall(GetPlayerRawXPos)
            local success5, y2 = pcall(GetPlayerRawYPos)
            local success6, z2 = pcall(GetPlayerRawZPos)
            if not (success4 and success5 and success6) then
                goto continue
            end
            if WithinUnits(x1, y1, z1, x2, y2, z2, 3) and PathIsRunning() then
                retry_timer = retry_timer + 1
                yield("/hold W <wait.1.0>")
                yield("/gaction jump")
                yield("/release W")
                yield("/vnav reload")
                yield("/wait 1.0034")
            elseif retry_time == 2 then
                yield("/vnav reload")
                yield("/target " .. target)
                yield("/wait 1.0021")
                if HasTarget() then
                    PathfindAndMoveTo(GetTargetRawXPos(), GetTargetRawYPos(), GetTargetRawZPos())
                    yield("/wait 1.0035")
                end
                retry_timer = retry_timer + 1
            elseif retry_time == 4 then
                yield("/vnav stop")
                yield("/echo Pathing failed")
                --Go back home somewhere
                yield("/li auto")
                yield("/pcraft stop")
            else
                retry_timer = 0
            end
            ::continue::
        end
    end
end

function MountandMovetoFlag()
    if IsInZone(GetFlagZone()) == true then
        MountFly()
        local rng_offset = 0
        ::APPROXPATH_START::
        CheckNavmeshReady()

        local node = string.format("NAMENOTGIVEN,%1.f,%1.f,%1.f", rawX, rawY, rawZ)
        NodeMoveFly()
        repeat
            yield("/wait " .. interval_rate)
            unstuckflag()
        until GetDistanceToNode(node) < ping_radius
        StopMoveFly()
        Dismount()
        return true
    end
end

function TargetedInteract(target)
    yield("/target " .. target)
    yield("/echo 123")
    repeat
        yield("/wait 0.10017")
        unstucktarget(target)
    until GetDistanceToTarget() < 6
    yield("/vnav stop")
    yield("/wait 1.001812")
    yield("/interact")
    repeat
        yield("/wait 0.10018")
        unstucktarget(target)
    until IsAddonReady("Gathering") or IsLeveComplete()
    yield("/vnav stop")
end

function IsLeveComplete()
    return WithinUnits(NPC[Zone].X, NPC[Zone].Y, NPC[Zone].Z, GetPlayerRawXPos(), GetPlayerRawYPos(), GetPlayerRawZPos(),
        10)
end

function AcceptLeves()
    whitelist = {}
    for key, values in pairs(levecoords) do
        for i = 43, 40, -1 do
            if GetNodeText("GuildLeve", 11, i, 4) == key then
                if not blacklist[key] and levecoords[key].Type == classneeded then
                    yield("/callback JournalDetail true 3 " .. levecoords[key].ID)
                    whitelist[key] = true
                    yield("/wait 0.5028")
                end
            end
            yield("/wait 1.0874")
        end
    end
end

-----------------

---Accept Leves---
Zone = tostring(GetZoneID())

yield("/target " .. NPC[Zone].Name)
yield("/wait 1.089")
yield("/vnav movetarget")
yield("/wait 3.089")
yield("/interact")
yield("/wait 1.091")
yield("/callback SelectString true 1")

AcceptLeves()

yield("/wait 1.091")

yield("/callback GuildLeve true -1")
yield("/wait 1")
yield("/callback SelectString true 4")
yield("/echo hell12oo")

for key, values in pairs(levecoords) do
    yield("/echo helloo")
    if whitelist[key] then
        Whichleve = key
        yield("/echo hellooooo")
        NodeSelection = levecoords[Whichleve].slot - 1

        rawX = levecoords[Whichleve].X
        rawY = levecoords[Whichleve].Y
        rawZ = levecoords[Whichleve].Z
        yield("/echo hello009oooo")
        SetMapFlag(levecoords[Whichleve].Zone, rawX, rawY, rawZ)
        yield("/echo hellooo967oo")
        MountandMovetoFlag()


        --START LEVE
        if IsNodeVisible("Journal", 1) == false then
            yield("/journal")
        end

        yield("/wait 1.0012")

        yield("/callback Journal true 13 " .. levecoords[Whichleve].ID .. " 2")

        yield("/callback JournalDetail true 4 " .. levecoords[Whichleve].ID)

        yield("/wait 1.00345")


        yield("/callback GuildLeveDifficulty true 3 " .. Difficulty)
        yield("/wait 1.00346")
        yield("/callback GuildLeveDifficulty true 0 4")

        --- Start Gathering --

        while not IsLeveComplete() do
            yield("/wait 1.00347")
            yield("/target " .. levecoords[Whichleve].node)
            yield("/wait 1.00348")
            yield("/vnav movetarget")

            TargetedInteract(levecoords[Whichleve].node)

            repeat
                yield("/wait 0.10018")
                yield("/pcall Gathering true " .. NodeSelection)
                yield("/wait 0.10024")
                while GetCharacterCondition(42) and IsInZone(886) == false do
                    yield("/wait 0.20013")
                end
            until not IsAddonReady("Gathering")
            yield("/wait 0.100165")
        end



        --Teleport back/ return leve
        yield("/wait 5.089")
        yield("/target Nyell")
        yield("/wait 1.089")
        yield("/interact")
        yield("/wait 1.091")
        yield("/callback SelectString true 0")
        yield("/wait 2.091")
        yield("/callback SelectString true 4")
    end
end
