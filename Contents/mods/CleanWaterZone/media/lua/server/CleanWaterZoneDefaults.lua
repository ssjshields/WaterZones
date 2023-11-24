local cleanWaterZoneDefault = {}

local cleanWater = require('CleanWaterZoneType')

function cleanWaterZoneDefault.addZone(x1, y1, x2, y2, zonesList)
    local newZone = copyTable(cleanWater.Zone)
    newZone.coordinates.x1, newZone.coordinates.y1, newZone.coordinates.x2, newZone.coordinates.y2 = x1, y1, x2, y2
    table.insert(zonesList, newZone)
    ModData.transmit("CleanWaterZoneType_zones")
end


function cleanWaterZoneDefault.init(isNewGame)

    local cleanWaterZones = ModData.getOrCreate("CleanWaterZoneType_zones")
    if #cleanWaterZones > 0 then return end

    ---ADD MORE DEFAULTS HERE
    cleanWaterZoneDefault.addZone(30405, 30781, 30419, 30834, cleanWaterZones)
end

return cleanWaterZoneDefault