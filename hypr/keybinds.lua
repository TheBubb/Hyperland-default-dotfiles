---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local terminal = "kitty" -- Sets kitty as main terminal
local fileManager = "thunar" -- Sets thunar as main file manager
local menu = "walker" -- Sets walker as main menu

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
-- open terminal mainmod + Q
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
-- close window mainmod + C
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- log out mainmod + M
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
-- open file manager mainmod + E
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
-- float window mainmod + V
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
-- open walker Super + Space
hl.bind("SUPER + Space", hl.dsp.exec_cmd(menu))
-- change split side to side and top and bottom mainmod + J
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only
-- power menu CTL + ALT + DEL
hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd("pkill -x wlogout || wlogout"))
-- screen shot SHIFT + SUPER + S
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd('FILE=~/Pictures/$(date +%s.png) && grim -g "$(slurp)" "$FILE" && loupe "$FILE"'))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + SHIFT + [0-9]
-- Move active window to a workspace with mainMod + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind("ALT +" .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind("ALT + tab",         hl.dsp.workspace.toggle_special("magic"))
hl.bind("ALT + SUPER + tab", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + tab
hl.bind(mainMod .. " + tab", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

