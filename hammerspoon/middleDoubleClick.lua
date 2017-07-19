local eventtap = require("hs.eventtap")

local events   = eventtap.event.types

local module   = {}
module.timeFrame = 1

local timeFirstControl = 0
local pressedDown = false
local middleButtonDown, middleButtonUp = 25, 26

module.eventWatcher = eventtap.new({middleButtonDown}, function(ev)
      if (hs.timer.secondsSinceEpoch() - timeFirstControl) > module.timeFrame then
         timeFirstControl, pressedDown = 0, false
      end

      if ev:getType() == middleButtonDown then
         if pressedDown then
            pressedDown = false
            return false
         else
            timeFirstControl = hs.timer.secondsSinceEpoch()
            pressedDown = true
         end
      end

      return true
end):start()

return module
