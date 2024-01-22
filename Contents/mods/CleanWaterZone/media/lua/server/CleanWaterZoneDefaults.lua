local CleanWaterZoneDefaults = {}

local cleanWater = require 'CleanWaterZoneType'

function CleanWaterZoneDefaults.addZone(name, x1, y1, x2, y2, zonesList)
    local newZone = copyTable(cleanWater.Zone)
    newZone.name, newZone.coordinates.x1, newZone.coordinates.y1, newZone.coordinates.x2, newZone.coordinates.y2 = name, x1, y1, x2, y2
    table.insert(zonesList, newZone)
end


function CleanWaterZoneDefaults.init(isNewGame)

    local cleanWaterZones = ModData.getOrCreate("CleanWaterZoneType_zones")
    if #cleanWaterZones > 0 then return end

    local activeModIDs = getActivatedMods()

    if activeModIDs:contains("Lost Province") then
        CleanWaterZoneDefaults.addZone("A", 1854, 427, 1923, 512, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("B", 1958, 974, 2084, 1118, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("C", 380, 2484, 446, 2548, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("D", 2045, 3998, 2086, 4099, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("E", 1861, 4437, 1889, 4466, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("F", 4799, 5211, 4820, 5242, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("G", 5071, 5730, 5102, 5750, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("H", 5371, 4838, 5484, 5062, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("I", 5385, 4651, 5475, 4766, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("J", 7456, 5164, 7555, 5223, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("K", 7799, 5312, 7873, 5378, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("L", 8152, 6085, 8204, 6163, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("M", 8127, 6219, 8171, 6287, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("N", 8899, 7099, 8970, 7162, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("O", 9227, 4625, 9319, 4755, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("P", 9562, 4271, 9716, 4370, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("Q", 9846, 4060, 9913, 4109, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("R", 10209, 4602, 10247, 4629, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("S", 10440, 3962, 10492, 3992, cleanWaterZones)
		CleanWaterZoneDefaults.addZone("T", 4858, 3782, 4906, 3806, cleanWaterZones)
        CleanWaterZoneDefaults.addZone("U", 4922, 3796, 5009, 3867, cleanWaterZones)
    end
    
end

return CleanWaterZoneDefaults