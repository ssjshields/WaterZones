require "ISUI/ISWorldObjectContextMenu"

require "zoneEditor"
local function checkCleanWaterZones(x,y)

    local cleanWaterZones = zoneEditor.requestZone("CleanWaterZoneType_zones")
    if not cleanWaterZones then return false end

    for i, zone in pairs(cleanWaterZones) do
        if zone.coordinates and x >= zone.coordinates.x1 and x<=zone.coordinates.x2 and y>=zone.coordinates.y1 and y<=zone.coordinates.y2 then
            return true
        end
    end

    return false
end


local function addTooltipToOption(option)
    local tooltip = ISWorldObjectContextMenu.addToolTip()
    local text = " <RGB:1,0.5,0.5> " .. getText("Tooltip_item_TaintedWater")
    tooltip.description = text
    option.toolTip = tooltip
end


---@param waterObject IsoObject
---@param context ISContextMenu
local function isNaturalWaterRemoveOptions(waterObject, context)
    if not waterObject or not context then return end
    
    local isInventoryObject = instanceof(waterObject, "IsoWorldInventoryObject")
    local bHasProperties = (waterObject:getProperties() ~= nil)
    local bStringStartWater = luautils.stringStarts(waterObject:getSprite():getName(), 'blends_natural_02')
    
    if not isInventoryObject and bHasProperties and bStringStartWater and (not checkCleanWaterZones(waterObject:getX(),waterObject:getY())) then

        --context:removeOptionByName(getText("ContextMenu_Drink"))
        local drinkOption = context:getOptionFromName(getText("ContextMenu_Drink"))
        if drinkOption then
            drinkOption.notAvailable = true
            addTooltipToOption(drinkOption)
        end

        --context:removeOptionByName(getText("ContextMenu_Fill"))
        ---@type ISContextMenu
        local fillOption = context:getOptionFromName(getText("ContextMenu_Fill"))
        if fillOption then
            fillOption.notAvailable = true
            fillOption.subOption = nil
            addTooltipToOption(fillOption)
        end

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