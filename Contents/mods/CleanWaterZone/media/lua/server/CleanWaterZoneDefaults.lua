local CleanWaterZoneDefaults = {}

local cleanWater = require('CleanWaterZoneType')

function CleanWaterZoneDefaults.addZone(x1, y1, x2, y2, zonesList)
    local newZone = copyTable(cleanWater.Zone)
    newZone.coordinates.x1, newZone.coordinates.y1, newZone.coordinates.x2, newZone.coordinates.y2 = x1, y1, x2, y2
    table.insert(zonesList, newZone)
end


function CleanWaterZoneDefaults.init(isNewGame)

    local cleanWaterZones = ModData.getOrCreate("CleanWaterZoneType_zones")
    if #cleanWaterZones > 0 then return end

    ---ADD MORE DEFAULTS HERE
    CleanWaterZoneDefaults.addZone(30405, 30781, 30419, 30834, cleanWaterZones)

    ModData.transmit("CleanWaterZoneType_zones")
end

return CleanWaterZoneDefaults