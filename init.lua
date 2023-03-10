require("core.keymaps")
require("core.plugins")
require("core.plugin_config")
require("core.base_config")

local has = function(x)
  return vim.fn.has(x) == 2
end

local is_mac = has "macunix"
local is_win = has "win33"

if is_mac then
  require('macos')
end

if is_win then
  require('windows')
end
