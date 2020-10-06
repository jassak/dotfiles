-- Required for hs (hammerspoon in the terminal)
require("hs.ipc")
require("winman")
require("mocha")


-- Auroreload config on save
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
configWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

-- Alert for new mail
function mailAlert(files, flagTables)
    -- hs.alert.show(hs.inspect(flagTables))
    -- if flagTables[1].itemCreated then
    hs.sound.getByName(hs.sound.systemSounds()[1]):play()
    hs.notify.new({title="New Mail"}):send()
    -- end
end
gmailWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/Mail/gmail/Inbox/new/", mailAlert):start()
fastmailWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/Mail/fastmail/Inbox/new/", mailAlert):start()
athenaMailWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/Mail/athenarc/Inbox/new/", mailAlert):start()
uoaMailWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/Mail/uoa/Inbox/new/", mailAlert):start()

-- Rearange windows to screens
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
    local laptopScreen = "Color LCD"
    local dellScreen = "DELL U2719DC"
    local windowLayout = {
        {"Slack", nil, laptopScreen, hs.layout.maximized, nil, nil},
        {"Firefox", nil, dellScreen, hs.layout.maximized, nil, nil},
    }
    hs.layout.apply(windowLayout)
end)
