--------------------------
-- Default luakit theme --
--------------------------

local file = io.open("/home/caleb/.colors", "r")
colors = {}
if file then
    i = 0
    for line in file:lines() do 
        color = string.match(line, '#......')
        colors[i] = color
        i = i + 1
    end
else
    colors[1] = "#fff"
    colors[0] = "#000"
end
print (colors)

local theme = {}

-- Default settings
theme.font = "terminus 10"
theme.fg   = "#666"
theme.bg   = "#111"

-- Genaral colours
theme.success_fg = "#0f0"
theme.loaded_fg  = "#33AADD"
theme.error_fg = "#FFF"
theme.error_bg = "#F00"

-- Warning colours
theme.warning_fg = "#F00"
theme.warning_bg = "#FFF"

-- Notification colours
theme.notif_fg = "#444"
theme.notif_bg = "#FFF"

-- Menu colours
theme.menu_fg                   = "#666"
theme.menu_bg                   = "#111"
theme.menu_selected_fg          = "#666"
theme.menu_selected_bg          = "#000"
theme.menu_title_bg             = "#111"
theme.menu_primary_title_fg     = "#f00"
theme.menu_secondary_title_fg   = "#666"

-- Proxy manager
theme.proxy_active_menu_fg      = colors[0]
theme.proxy_active_menu_bg      = "#FFF"
theme.proxy_inactive_menu_fg    = "#666"
theme.proxy_inactive_menu_bg    = "#FFF"

-- Statusbar specific
theme.sbar_fg         = "#666"
theme.sbar_bg         = "#111"

-- Downloadbar specific
theme.dbar_fg         = "#fff"
theme.dbar_bg         = colors[0]
theme.dbar_error_fg   = "#F00"

-- Input bar specific
theme.ibar_fg           = "#666"
theme.ibar_bg           = "#111"

-- Tab label
theme.tab_fg            = "#111"
theme.tab_bg            = "#666"
theme.tab_ntheme        = "#ddd"
theme.selected_fg       = "#666"
theme.selected_bg       = "#111"
theme.selected_ntheme   = "#ddd"
theme.loading_fg        = "#33AADD"
theme.loading_bg        = colors[0]

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#0F0"
theme.notrust_fg        = "#F00"

return theme
-- vim: et:sw=4:ts=8:sts=4:tw=80
