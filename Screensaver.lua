local mon = peripheral.find("monitor")

local timeWindow = window.create(term.current(), 1,1,65,30)
timeWindow.setBackgroundColour(colours.white)
timeWindow.setTextColour(colours.black)
term.redirect(timeWindow)

function drawWindow()
    timeWindow.setCursorPos(1,1)
    timeWindow.clear()
    print(
        textutils.tabulate(
            colours.black,
            {
                "Ingame:",
                textutils.formatTIme(os.time(), true),
                checkTime( os.time() )
            },
            colours.black,
            {
                "real:",
                textutils.formatTIme(os.time("local"), true),
                checkTime( os.time("local") )
            }
        )
    )
end

function checkTime( t )
    if t > 6 and t < 18 then
        return "day"
    end
    return "night"
end

while true do
    drawWindow()
    sleep(0.75)
    timeWindow.redraw()
end
