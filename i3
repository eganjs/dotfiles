#####################################################
###############     i3 config      ##################
#####################################################

font pango:monospace 8

set $mod Mod4
set $terminal urxvt
set $browser firejail firefox

set $left h
set $down j
set $up k
set $right l

set $display1 Virtual1
set $display2 Virtual2
set $display3 Virtual3

bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod


# styling
gaps outer 2
for_window [class="^.*"] border pixel 2

new_window 1pixel
new_float 1pixel
hide_edge_borders both
popup_during_fullscreen smart
exec border none

#####################################################
###############     Autostart      ##################
#####################################################

# run with reload
#exec_always --no-startup-id xrandr --output $display1 --auto --right-of display2
exec_always --no-startup-id ~/.config/polybar/launch.sh

exec --no-startup-id udiskie

###########################################################
#############         Bindings           ##################
###########################################################

bindsym Control+q exec echo "fuck firefox's ctrl+q binding"

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
bindsym $mod+d exec --no-startup-id i3-dmenu-desktop

# screenshot
bindsym Print exec --no-startup-id "scrot '%S.png' \
            -e 'mv $f $$(xdg-user-dir PICTURES)/ArchLabs-%S-$wx$h.png \
            ; gpicview $$(xdg-user-dir PICTURES)/ArchLabs-%S-$wx$h.png'"

# backlight
bindsym XF86MonBrightnessUp exec --no-startup-id xbacklight -inc 5
bindsym XF86MonBrightnessDown exec --no-startup-id xbacklight -dec 5


###################################################
############        Applications       ############
###################################################

bindsym $mod+Return exec $terminal
bindsym $mod+w exec $browser

########################################################
############    Container/Window control    ############
########################################################

# focus
bindsym $mod+$left focus left
bindsym $mod+$down focus down
bindsym $mod+$up focus up
bindsym $mod+$right focus right

bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move
bindsym $mod+Shift+$left move left
bindsym $mod+Shift+$down move down
bindsym $mod+Shift+$up move up
bindsym $mod+Shift+$right move right

bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# size
bindsym $mod+Mod1+Up    resize shrink height 10 px or 1 ppt
bindsym $mod+Mod1+Down  resize grow   height 10 px or 1 ppt
bindsym $mod+Mod1+Left  resize shrink width  10 px or 1 ppt
bindsym $mod+Mod1+Right resize grow   width  10 px or 1 ppt

# split
bindsym $mod+x split toggle

# fullscreen
bindsym $mod+Shift+f fullscreen toggle

# layout toggle
bindsym $mod+e layout toggle
bindsym $mod+q layout toggle split

# tiling/floating
bindsym $mod+Shift+space floating toggle
bindsym $mod+space focus mode_toggle

# parent/child group selection
bindsym $mod+a focus parent
bindsym $mod+Shift+a focus child

################################################################
###########          Workspace Bindings          ###############
################################################################

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

exec --no-startup-id i3-msg "workspace $ws01"

workspace $ws01 output $display1
workspace $ws02 output $display1
workspace $ws03 output $display1
workspace $ws04 output $display1
workspace $ws05 output $display2
workspace $ws06 output $display2
workspace $ws07 output $display2
workspace $ws08 output $display2

bindsym $mod+$wsb01 workspace $ws01
bindsym $mod+$wsb02 workspace $ws02
bindsym $mod+$wsb03 workspace $ws03
bindsym $mod+$wsb04 workspace $ws04
bindsym $mod+$wsb05 workspace $ws05
bindsym $mod+$wsb06 workspace $ws06
bindsym $mod+$wsb07 workspace $ws07
bindsym $mod+$wsb08 workspace $ws08

bindsym $mod+Shift+$wsb01 move container to workspace $ws01; workspace $ws01
bindsym $mod+Shift+$wsb02 move container to workspace $ws02; workspace $ws02
bindsym $mod+Shift+$wsb03 move container to workspace $ws03; workspace $ws03
bindsym $mod+Shift+$wsb04 move container to workspace $ws04; workspace $ws04
bindsym $mod+Shift+$wsb05 move container to workspace $ws05; workspace $ws05
bindsym $mod+Shift+$wsb06 move container to workspace $ws06; workspace $ws06
bindsym $mod+Shift+$wsb07 move container to workspace $ws07; workspace $ws07
bindsym $mod+Shift+$wsb08 move container to workspace $ws08; workspace $ws08

bindsym $mod+Tab workspace next
bindsym $mod+Shift+Tab workspace prev

#####################################################
###############    Mode: System    ##################
#####################################################

set $system "system: (l) lock, (shift+e) logout, (shift+r) reboot, (shift+s) shutdown"
mode $system {
        bindsym l exec i3lock-fancy, mode "default"
	bindsym Shift+e exec i3-msg exit, mode "default"
	bindsym Shift+r exec systemctl reboot, mode "default"
	bindsym Shift+s exec systemctl -i poweroff, mode "default"

        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym Control+$mod+Delete mode $system

#####################################################
###############    Mode: Resize    ##################
#####################################################

mode "resize" {
        bindsym $left resize shrink width 10 px or 1 ppt
        bindsym $down resize grow height 10 px or 1 ppt
        bindsym $up resize shrink height 10 px or 1 ppt
        bindsym $right resize grow width 10 px or 1 ppt

        bindsym Left resize shrink width 10 px or 1 ppt
        bindsym Down resize grow height 10 px or 1 ppt
        bindsym Up resize shrink height 10 px or 1 ppt
        bindsym Right resize grow width 10 px or 1 ppt

        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"
