require("lua.monitor")
require("lua.autostart")
require("lua.looks")
require("lua.env")
require("lua.input")
require("lua.keybind")
require("lua.workspaces")

-- for seeign prinitgn we can enable the logs
-- they can be viewed with
-- hyprctl rollinglog -f | grep Lua
hl.config({
	debug = {
		-- enable_stdout_logs = true,
		disable_logs = true,
	},
})
