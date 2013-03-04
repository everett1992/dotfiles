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
theme.fg   = colors[0]
theme.bg   = colors[1]

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
theme.menu_fg                   = colors[1]
theme.menu_bg                   = "#fff"
theme.menu_selected_fg          = colors[0]
theme.menu_selected_bg          = "#FF0"
theme.menu_title_bg             = "#fff"
theme.menu_primary_title_fg     = "#f00"
theme.menu_secondary_title_fg   = "#666"

-- Proxy manager
theme.proxy_active_menu_fg      = colors[0]
theme.proxy_active_menu_bg      = "#FFF"
theme.proxy_inactive_menu_fg    = "#888"
theme.proxy_inactive_menu_bg    = "#FFF"

-- Statusbar specific
theme.sbar_fg         = "#fff"
theme.sbar_bg         = colors[0]

-- Downloadbar specific
theme.dbar_fg         = "#fff"
theme.dbar_bg         = colors[0]
theme.dbar_error_fg   = "#F00"

-- Input bar specific
theme.ibar_fg           = colors[1]
theme.ibar_bg           = colors[0]

-- Tab label
theme.tab_fg            = "#888"
theme.tab_bg            = colors[0]
theme.tab_ntheme        = "#ddd"
theme.selected_fg       = colors[1]
theme.selected_bg       = colors[0]
theme.selected_ntheme   = "#ddd"
theme.loading_fg        = "#33AADD"
theme.loading_bg        = colors[0]

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#0F0"
theme.notrust_fg        = "#F00"

return theme
-- vim: et:sw=4:ts=8:sts=4:tw=80
