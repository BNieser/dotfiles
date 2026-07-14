require("lua.constants")

local secrets = require("lua.secrets")

hl.workspace_rule({
	workspace = "1",
	monitor = "desc:" .. main_monitor,
	default = true,
})

hl.workspace_rule({
	workspace = "2",
	monitor = "desc:" .. main_monitor,
})

hl.workspace_rule({
	workspace = "3",
	monitor = "desc:" .. secondary_monitor,
	default = true,
})

hl.workspace_rule({
	workspace = "4",
	monitor = "desc:" .. secondary_monitor,
})

hl.window_rule({ workspace = "3", name = "discord", match = { class = "discord" } })

GITHOST_URL = "https://git.bnhosting.de"
TODO_URL = ""

local special_workspaces = {
	githost = {
		cmd = browser .. " --new-window " .. secrets.GITHOST_URL,
	},
	todo = {
		cmd = browser .. " --new-window " .. secrets.TODO_URL,
	},
	btop = {
		cmd = terminal .. " -e btop",
	},
	obsidian = {
		cmd = "obsidian",
	},
	terminal = {
		cmd = terminal,
	},
}

local function toggle_special(name)
	local ws = special_workspaces[name]

	local current_workspaces = hl.get_workspaces()
	local workspace_exists = false

	local special_name = "special:" .. name

	for _, workspace in ipairs(current_workspaces) do
		if workspace.name == special_name then
			workspace_exists = true
		end
	end

	local toggle_workspace = hl.dsp.workspace.toggle_special(name)
	hl.dispatch(toggle_workspace)

	if not workspace_exists then
		hl.exec_cmd(ws.cmd)
		ws.started = true -- we could remove the started stuff
	end
end

hl.bind("ALT + G", function()
	toggle_special("githost")
end)

hl.bind("ALT + T", function()
	toggle_special("todo")
end)

hl.bind("ALT + B", function()
	toggle_special("btop")
end)

hl.bind("ALT +Q", function()
	toggle_special("obsidian")
end)
hl.bind("ALT + W", function()
	toggle_special("terminal")
end)
