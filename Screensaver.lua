local mon = peripheral.find("monitor")

local timeWindow = window.create(term.current(), 1, 1, 65, 30)
timeWindow.setBackgroundColour(colours.white)
timeWindow.setTextColour(colours.black)
term.redirect(timeWindow)

function DrawWindow()
    timeWindow.setCursorPos(1, 1)
    timeWindow.clear()
    print(
        CheckTime(os.time(), "Ingame:"),
        CheckTime(os.time("local"), "Real:")
    )
end

function CheckTime(time, type)
    if time > 6 and time < 18 then
        return {
            textutils.tabulate(
                colours.black,
                {
                    type
                },
                colours.black,{
                    time
                }
            ),
            textutils.tabulate(
                colours.yellow,
                {
                    "  |",                   
                },
                colours.yellow,
                {
                    "\\ | /",
                },
                colours.yellow,
                {
                    "\\\\*//",                   
                },
                colours.yellow,
                {
                    "-*O*-",                   
                },
                colours.yellow,
                {
                    "//*\\\\",
                },
                colours.yellow,
                {
                    "/ | \\",                  
                },
                colours.yellow,
                {
                    "  |",                   
                }
            )
        }
    end
    return {
        textutils.tabulate(
            colours.black,
            {
                type,
            },
            colours.black,
            {
                time
            }
        )
    }
end

while true do
    DrawWindow()
    sleep(0.75)
    timeWindow.redraw()
end
