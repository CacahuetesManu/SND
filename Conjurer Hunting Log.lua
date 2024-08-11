-- Load the JSON package to read the JSON . ALSO you NEED the chatcoordinates plugin
json = require("C:\\Users\\PUT IN YOUR USER PATH\\AppData\\Roaming\\XIVLauncher\\pluginConfigs\\SomethingNeedDoing\\json.lua")


-- use JSON to input hunt log with coordinates and zone like shown
-- You can use https://ffxiv.consolegameswiki.com/wiki/Hunting_Log to copy and paste into an excel sheet. You have to do a lot of cleaning of the data
-- You can then use this to conver to JSON - Properties https://thdoan.github.io/mr-data-converter/

local jArray = [[
[{"mobName":"Little Ladybug","NumberNeeded":3,"mobZone":"Central Shroud","mobX":23,"mobY":17},
{"mobName":"Ground Squirrel","NumberNeeded":3,"mobZone":"Central Shroud","mobX":21,"mobY":16},
{"mobName":"Forest Funguar","NumberNeeded":3,"mobZone":"Central Shroud","mobX":25,"mobY":18},
{"mobName":"Miteling","NumberNeeded":3,"mobZone":"North Shroud","mobX":24,"mobY":27},
{"mobName":"Chigoe","NumberNeeded":3,"mobZone":"Central Shroud","mobX":24,"mobY":21},
{"mobName":"Water Sprite","NumberNeeded":3,"mobZone":"Central Shroud","mobX":24,"mobY":21},
{"mobName":"Midge Swarm","NumberNeeded":3,"mobZone":"North Shroud","mobX":26,"mobY":21},
{"mobName":"Microchu","NumberNeeded":3,"mobZone":"North Shroud","mobX":26,"mobY":22},
{"mobName":"Syrphid Swarm","NumberNeeded":3,"mobZone":"Central Shroud","mobX":27,"mobY":24},
{"mobName":"Northern Vulture","NumberNeeded":3,"mobZone":"East Shroud","mobX":14,"mobY":27},
{"mobName":"","NumberNeeded":null,"mobZone":"","mobX":null,"mobY":null},
{"mobName":"Tree Slug","NumberNeeded":3,"mobZone":"Central Shroud","mobX":25,"mobY":29},
{"mobName":"Arbor Buzzard","NumberNeeded":3,"mobZone":"Central Shroud","mobX":26,"mobY":29},
{"mobName":"Goblin Hunter","NumberNeeded":2,"mobZone":"East Shroud","mobX":13,"mobY":27},
{"mobName":"Firefly","NumberNeeded":3,"mobZone":"Eastern Thanalan","mobX":24,"mobY":29},
{"mobName":"Mandragora","NumberNeeded":3,"mobZone":"East Shroud","mobX":14,"mobY":26},
{"mobName":"Boring Weevil","NumberNeeded":3,"mobZone":"East Shroud","mobX":20,"mobY":28},
{"mobName":"Faerie Funguar","NumberNeeded":3,"mobZone":"East Shroud","mobX":19,"mobY":28},
{"mobName":"Giant Gnat","NumberNeeded":3,"mobZone":"East Shroud","mobX":19,"mobY":25},
{"mobName":"Wolf Poacher","NumberNeeded":3,"mobZone":"East Shroud","mobX":19,"mobY":30},
{"mobName":"Qiqirn Beater","NumberNeeded":3,"mobZone":"South Shroud","mobX":15,"mobY":17},
{"mobName":"Black Bat","NumberNeeded":3,"mobZone":"East Shroud","mobX":16,"mobY":21},
{"mobName":"","NumberNeeded":null,"mobZone":"","mobX":null,"mobY":null},
{"mobName":"Stoneshell","NumberNeeded":3,"mobZone":"Upper La Noscea","mobX":13,"mobY":24},
{"mobName":"Laughing Toad","NumberNeeded":2,"mobZone":"Western Thanalan","mobX":14,"mobY":7},
{"mobName":"Diseased Treant","NumberNeeded":3,"mobZone":"East Shroud","mobX":16,"mobY":23},
{"mobName":"Lead Coblyn","NumberNeeded":2,"mobZone":"Western Thanalan","mobX":13,"mobY":10},
{"mobName":"Bark Eft","NumberNeeded":3,"mobZone":"South Shroud","mobX":17,"mobY":24},
{"mobName":"Glowfly","NumberNeeded":3,"mobZone":"East Shroud","mobX":15,"mobY":20},
{"mobName":"Antelope Stag","NumberNeeded":3,"mobZone":"South Shroud","mobX":22,"mobY":19},
{"mobName":"Sabotender","NumberNeeded":3,"mobZone":"Southern Thanalan","mobX":15,"mobY":14},
{"mobName":"Qiqirn Roerunner","NumberNeeded":3,"mobZone":"Eastern Thanalan","mobX":24,"mobY":23},
{"mobName":"Goblin Thug","NumberNeeded":3,"mobZone":"South Shroud","mobX":28,"mobY":20},
{"mobName":"Toadstool","NumberNeeded":3,"mobZone":"Central Shroud","mobX":14,"mobY":17},
{"mobName":"Apkallu","NumberNeeded":3,"mobZone":"Eastern La Noscea","mobX":28,"mobY":35},
{"mobName":"","NumberNeeded":null,"mobZone":"","mobX":null,"mobY":null},
{"mobName":"Lindwurm","NumberNeeded":4,"mobZone":"Central Shroud","mobX":12,"mobY":19},
{"mobName":"Gigantoad","NumberNeeded":2,"mobZone":"Eastern La Noscea","mobX":18,"mobY":26},
{"mobName":"Bigmouth Orobon","NumberNeeded":4,"mobZone":"South Shroud","mobX":18,"mobY":30},
{"mobName":"Mamool Ja Infiltrator","NumberNeeded":2,"mobZone":"Upper La Noscea","mobX":28,"mobY":23},
{"mobName":"Sandworm","NumberNeeded":1,"mobZone":"Southern Thanalan","mobX":22,"mobY":34},
{"mobName":"Revenant","NumberNeeded":4,"mobZone":"Central Shroud","mobX":12,"mobY":20},
{"mobName":"Bloodshore Bell","NumberNeeded":4,"mobZone":"Eastern La Noscea","mobX":31,"mobY":26},
{"mobName":"Ornery Karakul","NumberNeeded":4,"mobZone":"Coerthas Central Highlands","mobX":25,"mobY":19},
{"mobName":"Deepvoid Deathmouse","NumberNeeded":4,"mobZone":"South Shroud","mobX":25,"mobY":21},
{"mobName":"Dryad","NumberNeeded":4,"mobZone":"North Shroud","mobX":22,"mobY":23},
{"mobName":"Downy Aevis","NumberNeeded":4,"mobZone":"Coerthas Central Highlands","mobX":26,"mobY":10},
{"mobName":"Will-o'-the-wisp","NumberNeeded":4,"mobZone":"South Shroud","mobX":22,"mobY":25},
{"mobName":"Dragonfly","NumberNeeded":4,"mobZone":"Coerthas Central Highlands","mobX":9,"mobY":14},
{"mobName":"","NumberNeeded":null,"mobZone":"","mobX":null,"mobY":null},
{"mobName":"Golden Fleece","NumberNeeded":4,"mobZone":"Eastern Thanalan","mobX":26,"mobY":25},
{"mobName":"Grenade","NumberNeeded":4,"mobZone":"Outer La Noscea","mobX":22,"mobY":13},
{"mobName":"Hippocerf","NumberNeeded":2,"mobZone":"Coerthas Central Highlands","mobX":10,"mobY":18},
{"mobName":"Lammergeyer","NumberNeeded":2,"mobZone":"Western La Noscea","mobX":12,"mobY":36},
{"mobName":"Dead Man's Moan","NumberNeeded":1,"mobZone":"Western La Noscea","mobX":17,"mobY":36},
{"mobName":"3rd Cohort Hoplomachus","NumberNeeded":2,"mobZone":"East Shroud","mobX":29,"mobY":20},
{"mobName":"Lesser Kalong","NumberNeeded":4,"mobZone":"South Shroud","mobX":28,"mobY":22},
{"mobName":"Snow Wolf","NumberNeeded":4,"mobZone":"Coerthas Central Highlands","mobX":16,"mobY":32},
{"mobName":"5th Cohort Eques","NumberNeeded":4,"mobZone":"Mor Dhona","mobX":12,"mobY":17},
{"mobName":"Sea Wasp","NumberNeeded":4,"mobZone":"Western La Noscea","mobX":14,"mobY":17},
{"mobName":"Sylph Bonnet","NumberNeeded":4,"mobZone":"East Shroud","mobX":26,"mobY":13},
{"mobName":"Ahriman","NumberNeeded":4,"mobZone":"Northern Thanalan","mobX":24,"mobY":20},
{"mobName":"2nd Cohort Vanguard","NumberNeeded":4,"mobZone":"Eastern La Noscea","mobX":29,"mobY":21}]
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
