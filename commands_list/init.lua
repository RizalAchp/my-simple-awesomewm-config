local awful = require("awful")
local naughty = require("naughty")
local screenshot = os.getenv("HOME") .. "/Pictures/Screenshots/$(date +%F_%T).png"

function Spawn_cmd_msg(cmd, args)
    awful.spawn.easy_async_with_shell(cmd, function (_)
        naughty.notify({
            text = args,
            timeout = 1.0
        })
    end)
end

function Spawn_cmd(cmd)
    awful.spawn.easy_async_with_shell(cmd, _)
end


awful.util.shell = "bash"
local function scrot(cmd, args)
    awful.spawn.easy_async_with_shell(cmd, function (_)
        naughty.notify({
            text = args,
            timeout = 1.0
        })
    end)
end


function Scrot_full()
    scrot("scrot " .. screenshot .. " -e 'xclip -selection c -t image/png < $f', scrot_callback",
        "Take a screenshot of entire screen")
end

function Scrot_selection()
    scrot("sleep 0.5 && scrot -s " .. screenshot .. string.format(" -e 'xclip -selection c -t image/png < %s'", screenshot),
        "Take a screenshot of selection")
end

function Scrot_window()
    scrot("scrot -u " .. screenshot .. " -e 'xclip -selection c -t image/png < $f'",
        "Take a screenshot of focused window")
end

