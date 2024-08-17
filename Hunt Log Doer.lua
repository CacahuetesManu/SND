--Choose either "class" to do your class log or "GC" to do your Grand Company Log
route = "GC"
--Choose what rank to start 1,2, 3, 4 or 5
RankToDo = 3
-------------------REQUIRED FILES---------------------
---YOU NEED TO DOWNLOAD CHAT COORDINATES PLUGIN,VNAVMESH, RSR, and BMR.

--Load Required Files. YOU NEED TO UPDATE THE LUA PATH IN THE SND CONFIG TO MATCH WHERE YOU PUT FILES
--JSON handler is from https://github.com/Egor-Skriptunoff/json4lua/blob/master/json.lua
local json = require("json")

--I made this territories dictionary to quickly change between zone ID and zone name.
require("Territories")
--Monster log is from Hunty Plugin https://github.com/Infiziert90/Hunty/tree/mas
open = io.open
--CHANGE THE DIRECTORY PATH TO MATCH WHERE YOU PUT THE FILE
monsters = open("C:\\Users\\%YOUR USER NAME ON PC%\\AppData\\Roaming\\XIVLauncher\\pluginConfigs\\SomethingNeedDoing\\monsters.json")
local stringmonsters = monsters:read "*a"
monsters:close()

---------------------REQUIRED FUNCTIONS-------------------------

-- Call user provided input to figure out if we should work on Class Log or Hunt Log

if route == "class" then
    LogFinder = tostring(GetClassJobId())
elseif route == "GC" then
    LogFinder = tostring(GetPlayerGC() + 10000)
end

-- This Function is used within json.traverse to figure out where in the JSON we want to extract data.

local function my_callback(path, json_type, value)
    if
        #path == 4
        and path[#path - 2] == LogFinder
        and path[#path - 1] == RankToDo
    then
        CurrentLog = value
        return true
    end
end

-- The following Functions I got from : credit: LeafFriend, plottingCreeper and Mootykins. I adapted to meet the needs of this script

interval_rate = 0.5
timeout_threshold = 3
ping_radius = 10

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

function CheckNavmeshReady()
    was_ready = NavIsReady()
    while not NavIsReady() do
        Id_Print("Building navmesh, currently at " .. Truncate1Dp(NavBuildProgress() * 100) .. "%")
        yield("/wait " .. (interval_rate * 10))
    end
end

function MountFly()
    while not GetCharacterCondition(4) do
        yield('/gaction "Mount Roulette"')
        repeat
            yield("/wait " .. interval_rate)
        until not IsPlayerCasting() and not GetCharacterCondition(57)
    end
    if not GetCharacterCondition(81) and GetCharacterCondition(4) and not GetCharacterCondition(77) then
        repeat
            yield('/gaction "Jump"')
            yield("/wait " .. interval_rate)
        until GetCharacterCondition(77) and not GetCharacterCondition(48)
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

        yield('/gaction "Mount Roulette"')

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
        yield('/gaction "Mount Roulette"')
        repeat
            yield("/wait " .. interval_rate)
        until not GetCharacterCondition(4)
    end
end

function NodeMoveFly(node, force_moveto)
    local force_moveto = force_moveto or false
    local x = tonumber(ParseNodeDataString(node)[2]) or 0
    local y = tonumber(ParseNodeDataString(node)[3]) or 0
    local z = tonumber(ParseNodeDataString(node)[4]) or 0
    last_move_type = last_move_type or "NA"

    CheckNavmeshReady()
    start_pos = Truncate1Dp(GetPlayerRawXPos()) ..
        "," .. Truncate1Dp(GetPlayerRawYPos()) .. "," .. Truncate1Dp(GetPlayerRawZPos())
    if not force_moveto and ((GetCharacterCondition(4) and GetCharacterCondition(77)) or GetCharacterCondition(81)) then
        last_move_type = "fly"
        PathfindAndMoveTo(x, y, z, true)
    else
        last_move_type = "walk"
        PathfindAndMoveTo(x, y, z)
    end
    while PathfindInProgress() do
        yield("/wait " .. interval_rate)
    end
end

function DiscoverNodeViaAction()
    if IsInZone(GetFlagZone()) == true then
        MountFly()
        local rng_offset = 0
        ::APPROXPATH_START::
        CheckNavmeshReady()
        local x, y, z
        local i = 0
        while not x or not y or not z do
            local target_point = {
                x = rawX + math.random(0, rng_offset),
                y = 1024,
                z = rawZ + math.random(0, rng_offset),
            }
            x = QueryMeshPointOnFloorX(target_point.x, target_point.y, target_point.z, false, i)
            y = QueryMeshPointOnFloorY(target_point.x, target_point.y, target_point.z, false, i)
            z = QueryMeshPointOnFloorZ(target_point.x, target_point.y, target_point.z, false, i)
            i = i + 1
        end

        local timeout_start = os.clock()
        repeat
            yield("/wait " .. interval_rate)
            if os.clock() - timeout_start > timeout_threshold then
                Print("Failed to navigate to approximate flag position.")
                Print("Trying another place near it...")
                rng_offset = rng_offset + 1
                goto APPROXPATH_START
            end
        until not PathIsRunning()

        local node = string.format("NAMENOTGIVEN,%1.f,%1.f,%1.f", x, y, z)

        NodeMoveFly(node)

        repeat
            yield("/wait " .. interval_rate)
        until GetDistanceToNode(node) < ping_radius
        StopMoveFly()
        Dismount()
        return true
    end
end

-----------------------------------START OF CODE-------------------------------------------------------

-- This function traverses through the JSON and saves the data we want into a more specific table called "CurrentLog"

json.traverse(stringmonsters, my_callback)

-- Now we loop through the table and extract each mob, territory, location and kills needed in order to execute our hunt log doer

for i = 1, #CurrentLog do
    for j = 1, #CurrentLog[i].Monsters do
        KillsNeeded = CurrentLog[i].Monsters[j].Count
        mobName = CurrentLog[i].Monsters[j].Name
        mobZone = CurrentLog[i].Monsters[j].Locations[1].Terri
        mobX = CurrentLog[i].Monsters[j].Locations[1].xCoord
        mobY = CurrentLog[i].Monsters[j].Locations[1].yCoord
        ZoneName = Territories[tostring(mobZone)]

        yield("/echo " .. mobName .. " in " .. ZoneName .. " is next! We need " .. KillsNeeded)

        --Here we use a plugin called ChatCoordinates to make a flag and teleport to the zone
        yield("/wait 1")
        yield("/coord " .. mobX .. " " .. mobY .. " :" .. ZoneName)
        yield("/wait 2")
        --If you are in the same zone, no need to teleport

        if IsInZone(GetFlagZone()) == false then
            yield("/ctp " .. mobX .. " " .. mobY .. " :" .. ZoneName)
            yield("/wait 10.54")
        end


        --Mount up if needed
        if GetCharacterCondition(4) == false then
            yield('/gaction "mount roulette"')
            yield("/wait 3.54")
        end

        -- Now convert those simple map coordinates to RAW coordinates that vnav uses
        rawX = GetFlagXCoord()
        rawY = 1024
        rawZ = GetFlagYCoord()
        yield("/echo Position acquired " .. rawX .. ", " .. rawY .. ", " .. rawZ)
        yield("/gaction jump")
        yield("/wait 1")

        DiscoverNodeViaAction()

        -- Wait until you stop moving and when you reach your destination, unmount

        while IsMoving() == true or PathIsRunning == true or PathfindInProgress() == true do
            yield("/wait 2")
        end

        if IsMoving() == false then
            yield("/wait 2.001")
            if GetCharacterCondition(4) == true then
                yield("/vnavmesh stop")
                yield("/gaction dismount")
                PathStop()
                yield("/vnavmesh stop")
                yield("/wait 2.001")
                yield("/gaction dismount")
            end
        end

        yield("/rotation manual")
        yield("/bmrai on")
        yield("/bmrai followtarget")
        yield("/bmrai followoutofcombat")

        while GetCharacterCondition(4) == false do
            yield("/wait 2")
        end




        ------------HOW CAN I GET KILL COUNTER TO WORK???-------------------------
        --[[ local kills = 0

        while kills < KillsNeeded do
yield("/wait 1")
            while GetCharacterCondition(26) == false do
                yield("/target " .. mobName)
                yield("/wait 2")
            end
            while GetCharacterCondition(26) == true and GetTargetName() == mobName do
                yield("/wait .5")
                if GetTargetHP() < 50 then
                    kills = kills + 1
                    if kills == 1 then
                        yield("/echo Nice job! One down")
                    end

                    if kills == 2 then
                        yield("/echo Nice job! Two down")
                    end

                    if kills == 3 then
                        yield("/echo Nice job! Three down")
                    end

                    if kills == NumberNeeded then
                        yield("/echo Nice job! On to the next one")
                        yield("/rotation off")
                        yield("/bmrai off")
                    end
                    yield("/wait 2")
                end
            end
            while GetCharacterCondition(26) == true and GetTargetName() ~= mobName do
                yield("/wait 1")
            end
        end ]]
        -------------------------------------------------------------------
    end
end
