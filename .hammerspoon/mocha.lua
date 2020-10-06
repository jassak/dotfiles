
-- http://github.com/dbmrq/dotfiles/

-- Prevent your computer from going to sleep


-----------------------------
--  Customization Options  --
-----------------------------

-- Use the modifiers + hotkey to prevent your computer from sleeping. Click
-- the menu bar icon to allow it to sleep again.
local modifiers = {"ctrl", "alt", "cmd"}
local hotkey = "C"


-------------------------------------------------------------------
--  Don't mess with this part unless you know what you're doing  --
-------------------------------------------------------------------

local caf = require "hs.caffeinate"

local menu

local function toggle()
    newVal = not hs.caffeinate.get("displayIdle")
    hs.alert.show(newVal and "Caffeinate" or "Decaffeinate")
    caf.set("displayIdle", newVal, false)
    caf.set("systemIdle", newVal, false)
    -- caf.set("system", newVal, true)
end

if not menu then
    menu = hs.menubar.new()
end
menu:returnToMenuBar()
menu:setTitle("☕️")
-- menu:setTooltip()
menu:setClickCallback(function() toggle() end)

hs.hotkey.bind(modifiers, hotkey, function() toggle() end)

