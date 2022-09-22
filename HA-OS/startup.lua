--如果们没有文件把false 1 1 写入文件/初始化--
infoName="info"
while not fs.exists(infoName) do
  true1="fals"
  id1=1
  id2=1
  O2="1"
  e="O"
  infoTable=e..O2..true1.." | "..id2.." | "..id1
  h = fs.open(infoName, "w")
  h.write(infoTable)
  h.close()
end
while true do
    infoName="info"
    h = fs.open(infoName, "r")
    infoTable = h.readAll()
    O2 = string.sub(infoTable, 2 ,2)
    h.close()
    if O2=="1" then
      shell.run("clear")
        print("Due to the wise operation of ASMMMM, it is necessary to add boot enter confirmation")
        print("")
        print("Press Enter to enter the system")
        io.read()
        shell.run("/system/logo.lua")
        sleep(1)
    end
    local window = window.create(term.current(), 1, 1, 50, 50)
    term.redirect(window)
    shell.run("/system/music.lua")
    term.setCursorPos(29,1)
    speaker = peripheral.find("speaker")
    speaker.stop()
    shell.run("reboot")
end
