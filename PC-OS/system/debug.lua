term.setBackgroundColor(colors.white)
term.setTextColor(colors.pink)
term.clear()
term.setCursorPos(1,1)
while (true) do
    isNotRun=true
    io.write("DEBUG> ")
    cmd=io.read()
    if cmd == "music2022" then
      shell.run("/system/music2022.lua")
    else
        shell.run(cmd)
        isNotRun=true
        io.write("DEBUG> ")
        cmd=io.read()
        shell.run(cmd)
    end
end