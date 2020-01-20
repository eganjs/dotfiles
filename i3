# i3 config

# vars
set $mod Mod4
set $terminal alacritty
set $browser firejail --profile=firefox firefox-x11
bindsym Control+q nop "override ctrl+q in Firefox"

set $alt_left h
set $alt_down j
set $alt_up k
set $alt_right l

# font
font pango:monospace 8
font pango:DejaVu Sans Mono 8

# container styling
for_window [class="^.*"] border pixel 3
new_window 1pixel
new_float 1pixel
popup_during_fullscreen smart
hide_edge_borders smart

# reload
bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart

# drag
floating_modifier $mod

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu for desktop applications
bindsym $mod+d exec --no-startup-id i3-dmenu-desktop

# applications
bindsym $mod+Return exec $terminal
bindsym $mod+w exec $browser

# startup applications
exec --no-startup-id sh ~/.fehbg # background
exec jetbrains-toolbox --minimize # ide manager

# application config
for_window [title="^JetBrains Toolbox$"] floating enable

# screenshot
bindsym Print exec --no-startup-id "scrot '%S.png' \
	-e 'mv $f $$(xdg-user-dir PICTURES)/screenshot-%S-$wx$h.png \
	; gpicview $$(xdg-user-dir PICTURES)/screenshot-%S-$wx$h.png'"

# backlight
bindsym XF86MonBrightnessUp exec --no-startup-id xbacklight -inc 5
bindsym XF86MonBrightnessDown exec --no-startup-id xbacklight -dec 5

# audio (PulseAudio)
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# scratchpad
#bindsym $mod+Shift+s move scratchpad
#bindsym $mod+s scratchpad show

# sticky toggle
bindsym $mod+Shift+s sticky toggle

# snap resize modes
set $snap_width "snap width: 1-10"
mode $snap_width {
	bindsym Shift+1 resize set width   5 ppt; mode "default"
	bindsym 1       resize set width  10 ppt; mode "default"
	bindsym Shift+2 resize set width  15 ppt; mode "default"
	bindsym 2       resize set width  20 ppt; mode "default"
	bindsym Shift+3 resize set width  25 ppt; mode "default"
	bindsym 3       resize set width  30 ppt; mode "default"
	bindsym Shift+4 resize set width  35 ppt; mode "default"
	bindsym 4       resize set width  40 ppt; mode "default"
	bindsym Shift+5 resize set width  45 ppt; mode "default"
	bindsym 5       resize set width  50 ppt; mode "default"
	bindsym Shift+6 resize set width  55 ppt; mode "default"
	bindsym 6       resize set width  60 ppt; mode "default"
	bindsym Shift+7 resize set width  65 ppt; mode "default"
	bindsym 7       resize set width  70 ppt; mode "default"
	bindsym Shift+8 resize set width  75 ppt; mode "default"
	bindsym 8       resize set width  80 ppt; mode "default"
	bindsym Shift+9 resize set width  85 ppt; mode "default"
	bindsym 9       resize set width  90 ppt; mode "default"
	bindsym Shift+0 resize set width  95 ppt; mode "default"
	bindsym 0       resize set width 100 ppt; mode "default"

	bindsym Return mode "default"
	bindsym Escape mode "default"
}
bindsym $mod+Mod1+w mode $snap_width

set $snap_height "snap height: 1-10"
mode $snap_height {
	bindsym Shift+1 resize set height   5 ppt; mode "default"
	bindsym 1       resize set height  10 ppt; mode "default"
	bindsym Shift+2 resize set height  15 ppt; mode "default"
	bindsym 2       resize set height  20 ppt; mode "default"
	bindsym Shift+3 resize set height  25 ppt; mode "default"
	bindsym 3       resize set height  30 ppt; mode "default"
	bindsym Shift+4 resize set height  35 ppt; mode "default"
	bindsym 4       resize set height  40 ppt; mode "default"
	bindsym Shift+5 resize set height  45 ppt; mode "default"
	bindsym 5       resize set height  50 ppt; mode "default"
	bindsym Shift+6 resize set height  55 ppt; mode "default"
	bindsym 6       resize set height  60 ppt; mode "default"
	bindsym Shift+7 resize set height  65 ppt; mode "default"
	bindsym 7       resize set height  70 ppt; mode "default"
	bindsym Shift+8 resize set height  75 ppt; mode "default"
	bindsym 8       resize set height  80 ppt; mode "default"
	bindsym Shift+9 resize set height  85 ppt; mode "default"
	bindsym 9       resize set height  90 ppt; mode "default"
	bindsym Shift+0 resize set height  95 ppt; mode "default"
	bindsym 0       resize set height 100 ppt; mode "default"

	bindsym Return mode "default"
	bindsym Escape mode "default"
}
bindsym $mod+Mod1+h mode $snap_height

set $snap_scaled "snap scaled: [Shift] 1-10"
mode $snap_scaled {
	bindsym Shift+1 resize set   5 ppt   5 ppt; mode "default"
	bindsym 1       resize set  10 ppt  10 ppt; mode "default"
	bindsym Shift+2 resize set  15 ppt  15 ppt; mode "default"
	bindsym 2       resize set  20 ppt  20 ppt; mode "default"
	bindsym Shift+3 resize set  25 ppt  25 ppt; mode "default"
	bindsym 3       resize set  30 ppt  30 ppt; mode "default"
	bindsym Shift+4 resize set  35 ppt  35 ppt; mode "default"
	bindsym 4       resize set  40 ppt  40 ppt; mode "default"
	bindsym Shift+5 resize set  45 ppt  45 ppt; mode "default"
	bindsym 5       resize set  50 ppt  50 ppt; mode "default"
	bindsym Shift+6 resize set  55 ppt  55 ppt; mode "default"
	bindsym 6       resize set  60 ppt  60 ppt; mode "default"
	bindsym Shift+7 resize set  65 ppt  65 ppt; mode "default"
	bindsym 7       resize set  70 ppt  70 ppt; mode "default"
	bindsym Shift+8 resize set  75 ppt  75 ppt; mode "default"
	bindsym 8       resize set  80 ppt  80 ppt; mode "default"
	bindsym Shift+9 resize set  85 ppt  85 ppt; mode "default"
	bindsym 9       resize set  90 ppt  90 ppt; mode "default"
	bindsym Shift+0 resize set  95 ppt  95 ppt; mode "default"
	bindsym 0       resize set 100 ppt 100 ppt; mode "default"

	bindsym Return mode "default"
	bindsym Escape mode "default"
}
bindsym $mod+Mod1+x mode $snap_scaled

# container focus
bindsym $mod+$alt_left focus left
bindsym $mod+$alt_down focus down
bindsym $mod+$alt_up focus up
bindsym $mod+$alt_right focus right

bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# container move
bindsym $mod+Shift+$alt_left move left
bindsym $mod+Shift+$alt_down move down
bindsym $mod+Shift+$alt_up move up
bindsym $mod+Shift+$alt_right move right

bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# container resize
bindsym $mod+Mod1+Up    resize shrink height 10 px or 1 ppt
bindsym $mod+Mod1+Down  resize grow   height 10 px or 1 ppt
bindsym $mod+Mod1+Left  resize shrink width  10 px or 1 ppt
bindsym $mod+Mod1+Right resize grow   width  10 px or 1 ppt

# container resize mode
set $resize "resize: (left) shrink, (right) grow, (up) shrink, (down) grow"
mode $resize {
	bindsym $alt_left resize shrink width 10 px or 1 ppt
	bindsym $alt_down resize grow height 10 px or 1 ppt
	bindsym $alt_up resize shrink height 10 px or 1 ppt
	bindsym $alt_right resize grow width 10 px or 1 ppt

	bindsym Left resize shrink width 10 px or 1 ppt
	bindsym Down resize grow height 10 px or 1 ppt
	bindsym Up resize shrink height 10 px or 1 ppt
	bindsym Right resize grow width 10 px or 1 ppt

	bindsym Return mode "default"
	bindsym Escape mode "default"
}
bindsym $mod+r mode $resize

# container fullscreen
bindsym $mod+Shift+f fullscreen toggle

# container split direction
bindsym $mod+x split toggle

# container layout
bindsym $mod+e layout toggle
bindsym $mod+q layout toggle split

# container tiling/floating toggles
bindsym $mod+Shift+space floating toggle
bindsym $mod+space focus mode_toggle

# container parent/child group selection
bindsym $mod+a focus parent
bindsym $mod+Shift+a focus child

# workspaces and bindings
set $ws01  "1"
set $wsb01 "1"
set $ws02  "2"
set $wsb02 "2"
set $ws03  "3"
set $wsb03 "3"
set $ws04  "4"
set $wsb04 "4"
set $ws05  "5"
set $wsb05 "5"
set $ws06  "6"
set $wsb06 "6"
set $ws07  "7"
set $wsb07 "7"
set $ws08  "8"
set $wsb08 "8"

# default workspace
exec --no-startup-id i3-msg "workspace $ws01"

# workspace selection
bindsym $mod+$wsb01 workspace $ws01
bindsym $mod+$wsb02 workspace $ws02
bindsym $mod+$wsb03 workspace $ws03
bindsym $mod+$wsb04 workspace $ws04
bindsym $mod+$wsb05 workspace $ws05
bindsym $mod+$wsb06 workspace $ws06
bindsym $mod+$wsb07 workspace $ws07
bindsym $mod+$wsb08 workspace $ws08

# workspace container move
bindsym $mod+Shift+$wsb01 move container to workspace $ws01; workspace $ws01
bindsym $mod+Shift+$wsb02 move container to workspace $ws02; workspace $ws02
bindsym $mod+Shift+$wsb03 move container to workspace $ws03; workspace $ws03
bindsym $mod+Shift+$wsb04 move container to workspace $ws04; workspace $ws04
bindsym $mod+Shift+$wsb05 move container to workspace $ws05; workspace $ws05
bindsym $mod+Shift+$wsb06 move container to workspace $ws06; workspace $ws06
bindsym $mod+Shift+$wsb07 move container to workspace $ws07; workspace $ws07
bindsym $mod+Shift+$wsb08 move container to workspace $ws08; workspace $ws08

# workspace rotation
bindsym $mod+Tab workspace next
bindsym $mod+Shift+Tab workspace prev

# system lifecycle
set $system "system: (l) lock, (shift+e) logout, (shift+r) reboot, (shift+s) shutdown"
mode $system {
	bindsym l exec i3lock, mode "default"
	bindsym Shift+e exec i3-msg exit, mode "default"
	bindsym Shift+r exec systemctl reboot, mode "default"
	bindsym Shift+s exec systemctl -i poweroff, mode "default"

	bindsym Return mode "default"
	bindsym Escape mode "default"
}
bindsym Control+$mod+Delete mode $system

# i3bar
bar {
	status_command i3status
	position top
	colors {
		separator #073642
		background #002b36
		statusline #839496
		focused_workspace #93a1a1 #93a1a1 #002b36 #002b36
		active_workspace #586e75 #586e75 #002b36 #002b36
		inactive_workspace #073642 #073642 #839496 #839496
		urgent_workspace #d33682 #d33682 #002b36 #002b36
	}
}
client.focused #d33682 #d33682 #002b36 #b58900
client.focused_inactive #586e75 #586e75 #002b36 #586e75
client.unfocused #073642 #073642 #839496 #073642
client.urgent #d33682 #d33682 #002b36 #d33682
