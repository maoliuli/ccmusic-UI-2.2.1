
shell.run("wget https://raw.githubusercontent.com/maoliuli/ccmusic-UI-2.2.1/main/installer/lib/name.nfp")
term.write("Select Install Device")
term.clear()
term.setCursorPos(1,1)
local UI = paintutils.loadImage("name.nfp")
paintutils.drawImage(UI, term.getCursorPos())
term.setCursorPos(3,2)
term.setBackgroundColor(colors.yellow)
term.setTextColor(colors.lightBlue)
term.write("mp4")
term.setCursorPos(12,2)
term.write("pc")
term.setCursorPos(3,11)
term.write("screen")
term.setCursorPos(2,1)
term.setBackgroundColor(colors.white)
term.setTextColor(colors.pink)
term.write("Select Install Device")
term.setCursorPos(2,18)
term.setTextColor(colors.pink)
isNotRun=true
io.write("name> ")
cmd=io.read()
rootUrl = "null"
if cmd=="mp4" then
    rootUrl = "https://raw.githubusercontent.com/maoliuli/ccmusic-UI-2.2.1/main/HA-OS"
end

if cmd=="pc" then
    rootUrl = "https://raw.githubusercontent.com/maoliuli/ccmusic-UI-2.2.1/main/PC-OS"
end

if cmd=="screen" then
    rootUrl = "https://raw.githubusercontent.com/maoliuli/ccmusic-UI-2.2.1/main/MO-OS"
end

if cmd=="ktv" then
    print("Forwarding-server   Speakers-server   music-term")
    isNotRun=true
    io.write("name> ")
    cmd2=io.read()
    if cmd2 == "Forwarding-server" or cmd2 == "Speakers-server" or cmd2=="music-term" then
        shell.run("wget https://raw.githubusercontent.com/maoliuli/ccmusic-UI-2.2.1/KTV-OS/"..cmd2.."/startup.lua")
        shell.run("reboot")
    else
        error("There is no match "..cmd.." system!")
    end
end

if rootUrl == "null" then
    error("There is no match "..cmd.." system!")
else
    shell.run("rm /name.nfp")

    local function httpGet(url)
        local res = http.get(url, { ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36" } )
        if res ~= nil then
            local ret = res.readAll()
            res.close()
            return ret
        end
        return ""
    end
    local function DLFile(url,out)
        print("DownLoad "..url)
        local handle = io.open(out,"wb")
        handle:write(httpGet(url))
        handle:close()
    end
    local serialization = load(httpGet("https://raw.githubusercontent.com/maoliuli/ccmusic-UI-2.2.1/main/installer/lib/serialization.lua"))()
    local InstallData = {}
    local function init()
        InstallData = serialization.unserialize(httpGet("https://raw.githubusercontent.com/maoliuli/ccmusic-UI-2.2.1/main/installer/InstallData"))
        if InstallData.version == nil then
            return "failed"
        end
        print("Welcome to minecraft ccmusic "..InstallData.version.."\nPower By: mao_liuli")
        sleep(0.3)
        print("Initializing...")
        for _,v in pairs(InstallData.dir) do
            fs.delete(v)
            fs.makeDir(v)
        end
        print("DownLoad Files...")
        for _,v in pairs(InstallData.file) do
            DLFile(rootUrl..v,v)
        end
        return "success"
    end
    if init() == "success" then
        shell.run("rm /system/list.txt")
        shell.run("wget https://raw.githubusercontent.com/maoliuli/ccmusic-UI-2.2.1/main/list.txt /system/list.txt")
        shell.run("reboot")
    else
        print("Initialize Failed.")
    end
end

