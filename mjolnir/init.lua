package.path = os.getenv("HOME").."/.mjolnir/?.lua;"..package.path
local hotkey      = require "mjolnir.hotkey"
local application = require "mjolnir.application"
local itunes      = require "itunes"
local resize      = require "resize"

-- Window Management

local resizemod = {"ctrl", "alt", "cmd"}
local resizebindings = {
  topleft     = 'p',
  topright    = '\\',
  bottomleft  = '[',
  bottomright = ']',
  right       = 'right',
  left        = 'left',
  top         = 'up',
  bottom      = 'down',
  full        = 'return'
}
for name,key in pairs(resizebindings) do
  hotkey.bind(resizemod, key, function()
    resize[name]()
  end)
end
hotkey.bind(resizemod, "'", function() resize.center() end)
table.insert(resizemod, "shift")
hotkey.bind(resizemod, "return", function() resize.changescreen() end)

-- Application

local bindings = {
  [{ "cmd", "alt", "shift"}] = {
    iTerm      = "i",
    Safari     = "return",
    Messages   = "n",
    HipChat    = "m",
    Wunderlist = "'",
    MacVim     = "."
  },
  [{ "cmd", "shift"}] = {
    [ "Mailplane 3" ] = "/",
  },
  [{ "cmd", "alt"}] = {
    [ "Google Chrome" ] = "return"
  }
}
for modifiers,apps in pairs(bindings) do
  for name, key in pairs(apps) do
    hotkey.bind(modifiers, key, function()
      application.launchorfocus(name)
    end)
  end
end

-- Mjolnir

hotkey.bind({"ctrl", "alt", "cmd"}, "r", function() mjolnir.reload() end)
hotkey.bind({"ctrl", "alt", "cmd"}, "o", function() mjolnir.openconsole() end)

-- iTunes

hotkey.bind({ "cmd", "alt", "shift"}, "a", function() itunes.notification() end)
hotkey.bind({ "ctrl" }, "space", function() itunes.playpause() end)
hotkey.bind({ "cmd", "alt" }, "left", function() itunes.back() end)
hotkey.bind({ "cmd", "alt" }, "right", function() itunes.next() end)
hotkey.bind({ "ctrl", "cmd" }, "right", function() itunes.position(10) end)
hotkey.bind({ "ctrl", "cmd" }, "left", function() itunes.position(-10) end)
hotkey.bind({ "ctrl", "cmd" }, "up", function() itunes.volume(5) end)
hotkey.bind({ "ctrl", "cmd" }, "down", function() itunes.volume(-5) end)
