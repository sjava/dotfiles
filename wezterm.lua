local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)
return {
	-- font = wezterm.font("Maple Mono SC NF"),
	font = wezterm.font({
		family = "Monaspace Krypton",
		harfbuzz_features = { "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08", "calt", "dlig" },
	}),
	font_size = 13,
	enable_tab_bar = false,
	window_decorations = "NONE",
	use_ime = true,
	color_scheme = "Catppuccin Mocha",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
}
