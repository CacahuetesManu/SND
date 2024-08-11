-- Load the JSON package to read the JSON format
json = require("C:\\Users\\PUT IN YOUR USER PATH\\AppData\\Roaming\\XIVLauncher\\pluginConfigs\\SomethingNeedDoing\\json.lua")


-- use JSON to input hunt log with coordinates and zone like shown
-- You can use https://ffxiv.consolegameswiki.com/wiki/Hunting_Log to copy and paste into an excel sheet. You have to do a lot of cleaning of the data
-- You can then use this to conver to JSON - Properties https://thdoan.github.io/mr-data-converter/

local jArray = [[
[{"mobName":"Amalj'aa Javelinier","NumberNeeded":3,"mobZone":"Eastern Thanalan-Sandgate","mobX":19,"mobY":27},
{"mobName":"Sylvan Scream","NumberNeeded":3,"mobZone":"East Shroud-The Bramble Patch","mobX":19,"mobY":21},
{"mobName":"Kobold Pickman","NumberNeeded":3,"mobZone":"Upper La Noscea-Oakwood","mobX":13,"mobY":22},
{"mobName":"Amalj'aa Bruiser","NumberNeeded":3,"mobZone":"Eastern Thanalan-Wellwick Wood","mobX":24,"mobY":20},
{"mobName":"Ixali Deftalon","NumberNeeded":3,"mobZone":"North Shroud-Alder Springs","mobX":22,"mobY":28},
{"mobName":"Amalj'aa Ranger","NumberNeeded":3,"mobZone":"Eastern Thanalan-Wellwick Wood","mobX":24,"mobY":20},
{"mobName":"Ixali Fearcaller","NumberNeeded":1,"mobZone":"Coerthas Central Highlands-Dragonhead","mobX":31,"mobY":28},
{"mobName":"","NumberNeeded":null,"mobZone":"","mobX":null,"mobY":null},
{"mobName":"Amalj'aa Sniper","NumberNeeded":3,"mobZone":"Southern Thanalan-Sagolii Desert","mobX":26,"mobY":34},
{"mobName":"Kobold Missionary","NumberNeeded":3,"mobZone":"Eastern La Noscea-Bloodshore","mobX":28,"mobY":26},
{"mobName":"Kobold Sidesman","NumberNeeded":3,"mobZone":"Upper La Noscea-Zelma's Run","mobX":26,"mobY":19},
{"mobName":"Kobold Roundsman","NumberNeeded":3,"mobZone":"Outer La Noscea-Iron Lake","mobX":22,"mobY":14},
{"mobName":"Sylvan Snarl","NumberNeeded":3,"mobZone":"East Shroud-Larkscall","mobX":23,"mobY":20},
{"mobName":"Shelfclaw Sahagin","NumberNeeded":3,"mobZone":"Western La Noscea-Halfstone","mobX":18,"mobY":21},
{"mobName":"Amalj'aa Lancer","NumberNeeded":3,"mobZone":"Southern Thanalan-Zanr'ak","mobX":22,"mobY":21},
{"mobName":"U'Ghamaro Roundsman","NumberNeeded":3,"mobZone":"Outer La Noscea-U'Ghamaro Mines","mobX":23,"mobY":9},
{"mobName":"","NumberNeeded":null,"mobZone":"","mobX":null,"mobY":null},
{"mobName":"Ixali Windtalon","NumberNeeded":3,"mobZone":"North Shroud-Proud Creek","mobX":20,"mobY":20},
{"mobName":"Sylpheed Snarl","NumberNeeded":3,"mobZone":"East Shroud-Sylphlands","mobX":27,"mobY":18},
{"mobName":"U'Ghamaro Quarryman","NumberNeeded":3,"mobZone":"Outer La Noscea-U'Ghamaro Mines","mobX":23,"mobY":8},
{"mobName":"Sapsa Shelftooth","NumberNeeded":3,"mobZone":"Western La Noscea-Sapsa Spawning Grounds","mobX":17,"mobY":15},
{"mobName":"Zahar'ak Pugilist","NumberNeeded":3,"mobZone":"Southern Thanalan","mobX":28,"mobY":20},
{"mobName":"Natalan Swiftbeak","NumberNeeded":4,"mobZone":"Coerthas Central Highlands","mobX":31,"mobY":17},
{"mobName":"Natalan Boldwing","NumberNeeded":5,"mobZone":"Coerthas Central Highlands","mobX":31,"mobY":17}]

]]

-- use json package to turn json into a LUA array that can be read by SND

local obj = json.decode(jArray)

-- VNAV is really tough here especially because the coordinates aren't accurate. I used a 10 tolerance to help with pathing and reduce getting stuck

PathSetTolerance(10)

-- This function I got from the web, but it does a really nice job of cycling through the LUA array. It is a for loop that will just go line by line and change the variables.
for Key = 1, #obj, 1 do
    mobName = obj[Key].mobName
    mobX = obj[Key].mobX
    mobY = obj[Key].mobY
    mobZone = obj[Key].mobZone
    NumberNeeded = obj[Key].NumberNeeded

    -- I am using the chatcoordinates plugin, which is really nice. You basically just input map coordinates and it will make a flag and/or automatically teleport to closest aetheryte

    yield("/coord <" .. mobX .. "> <" .. mobY .. "> :" .. mobZone)
    yield("/wait 2")

    --If you are in the same zone, no need to teleport
    if IsInZone(GetFlagZone()) == false then
        yield("/ctp <" .. mobX .. "> <" .. mobY .. "> :" .. mobZone)
        yield("/wait 10.54")
    end

    --Mount up if needed
    if GetCharacterCondition(4) == false then
        yield('/gaction "mount roulette"')
        yield("/wait 3.54")
    end

    -- Now convert those simple map coordinates to RAW coordinates that vnav uses
    rawX = GetFlagXCoord()
    rawY = GetPlayerRawYPos()
    rawZ = GetFlagYCoord()
    yield("/echo Position acquired " .. rawX .. ", " .. rawY .. ", " .. rawZ)
    yield("/gaction jump")
    yield("/wait 1")

    -- Use VNAV to path and move to the flag

    PathfindAndMoveTo(rawX, rawY, rawZ, true)

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

    -- This is supposed to track how many kills you make but it doesn't really work, especially if other enemies aggro onto you.

    kills = 0

    while kills < NumberNeeded do
        while GetCharacterCondition(26) == false do
            yield("/target " .. mobName)
            yield("/rotation manual")
            yield("/bmrai on")
            yield("/bmrai followtarget")
            yield("/bmrai followoutofcombat")


            yield("/wait 2")
        end

        while GetCharacterCondition(26) == true and GetTargetName() == mobName do
            yield("/wait 2")
            yield("/target " .. mobName)
            kills = kills + 1
        end

        while GetCharacterCondition(26) == true and GetTargetName() ~= mobName do
            yield("/wait 2")
        end

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
    end
end
