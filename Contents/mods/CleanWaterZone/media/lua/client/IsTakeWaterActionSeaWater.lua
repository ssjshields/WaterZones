require "ISUI/ISWorldObjectContextMenu"

local function checkCleanWaterZones(x,y)
    local zones = ModData.getOrCreate("CleanWaterZoneType_zones")
    if zones then
        for i, zone in pairs(self.zones) do
            if zone.coordinates and x >= zone.coordinates.x1 and x<=zone.coordinates.x2 and y>=zone.coordinates.y1 and y<=zone.coordinates.y2 then
                return true
            end
        end
    end
    return false
end

---@param waterObject IsoObject
local function isNaturalWaterRemoveOptions(waterObject, context)
    if not waterObject or not context then return end
    
    local isInventoryObject = instanceof(waterObject, "IsoWorldInventoryObject")
    local bHasProperties = (waterObject:getProperties() ~= nil)
    local bStringStartWater = luautils.stringStarts(waterObject:getSprite():getName(), 'blends_natural_02')
    
    if not isInventoryObject and bHasProperties and bStringStartWater and (not checkCleanWaterZones(waterObject:getX(),waterObject:getY())) then
        context:removeOptionByName(getText("ContextMenu_Drink"))
        context:removeOptionByName(getText("ContextMenu_Fill"))
    end
end

local original_ISWorldObjectContextMenu_doFillWaterMenu = ISWorldObjectContextMenu.doFillWaterMenu
function ISWorldObjectContextMenu.doFillWaterMenu(source, playerNum, context)
    original_ISWorldObjectContextMenu_doFillWaterMenu(source, playerNum, context)
    isNaturalWaterRemoveOptions(source, context)
end

local original_ISWorldObjectContextMenu_doDrinkWaterMenu = ISWorldObjectContextMenu.doDrinkWaterMenu
function ISWorldObjectContextMenu.doDrinkWaterMenu(source, playerNum, context)
    original_ISWorldObjectContextMenu_doDrinkWaterMenu(source, playerNum, context)
    isNaturalWaterRemoveOptions(source, context)
end