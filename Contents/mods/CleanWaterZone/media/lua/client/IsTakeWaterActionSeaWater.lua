require "ISUI/ISWorldObjectContextMenu"

---@param waterObject IsoObject
local function isNaturalWaterRemoveOptions(waterObject, context)
    if not waterObject or not context then return end
    
    local isInventoryObject = instanceof(waterObject, "IsoWorldInventoryObject")
    local bHasProperties = (waterObject:getProperties() ~= nil)
    local bStringStartWater = luautils.stringStarts(waterObject:getSprite():getName(), 'blends_natural_02')
    
    if not isInventoryObject and bHasProperties and bStringStartWater then
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