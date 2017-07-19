middleDoubleClick = require("middleDoubleClick")

local KEY_CODE_JIS_EISUU = 102
local KEY_CODE_JIS_KANA  = 104

local function isInputSourceKana()
   -- 利用中の IME に合わせて要修正
   -- cf. hs.logger.new('IM', 'debug'):d(hs.inspect(hs.keycodes.methods()))
   return hs.keycodes.currentMethod() == 'Hiragana (Google)'
end

local toggleInputSource
toggleInputSource = hs.hotkey.bind({"shift"}, "space", function()
      if isInputSourceKana() then
         return hs.eventtap.keyStroke({}, KEY_CODE_JIS_EISUU, 0)
      end

      toggleInputSource:disable()
      hs.eventtap.keyStroke({}, KEY_CODE_JIS_KANA, 0)
      toggleInputSource:enable()
end)
