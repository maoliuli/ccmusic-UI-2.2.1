local function PlayID(id,index)
    local Buf = http.get("http://q1.getmc.cn:15848/minecraft%20ccmusic%20server/music/music"..id.."."..index..".dfpwm", { ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36" } ,true)
    if Buf ~= nil then
        local dfpwm = require("cc.audio.dfpwm")
        print("off")
        if index==1 then
            o=rednet.receive(cmd.."3")
        end
        print("on")
        local speaker = peripheral.wrap(cmd3)
        local decoder = dfpwm.make_decoder()
        local len = Buf.seek("end")
        local cnt = math.floor(len / 16384)
        for i=0,cnt do
            Buf.seek("set",16384*i)
            if i == cnt then
                local buffer = decoder(Buf.read(len - 16384 * i))
                while not speaker.playAudio(buffer) do
                    os.pullEvent("speaker_audio_empty")
                end
            else
                local buffer = decoder(Buf.read(16384))
                while not speaker.playAudio(buffer) do
                    os.pullEvent("speaker_audio_empty")
                end
            end
        end

        Buf.close()
    end
    Buf = nil
end
--music--
local function PlayID1(id)
  local Buf = http.get("http://q1.getmc.cn:15848/minecraft%20ccmusic%20server/music/music"..id..".dfpwm", { ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36" } ,true)
  if Buf ~= nil then
      local dfpwm = require("cc.audio.dfpwm")
      print(cmd3)
      print("off")
      o=rednet.receive(cmd.."3")
      print("on")
      speaker = peripheral.wrap(cmd3)
      local decoder = dfpwm.make_decoder()
      local len = Buf.seek("end")
      local cnt = math.floor(len / 16384)
      for i=0,cnt do
          Buf.seek("set",16384*i)
          if i == cnt then
              local buffer = decoder(Buf.read(len - 16384 * i))
              while not speaker.playAudio(buffer) do
                  os.pullEvent("speaker_audio_empty")
              end
          else
              local buffer = decoder(Buf.read(16384))
              while not speaker.playAudio(buffer) do
                  os.pullEvent("speaker_audio_empty")
              end
          end
      end
      Buf.close()
  end
  Buf = nil
end

--music--
function music2(a)
    index = 1
    while true do
        PlayID(a,tostring(index))
        index = index + 1;
        if index >= 5 then
            index = 1
            break;
        end
    end
end


function musicif(a)
    b=tonumber(a)
    if b >= 209 then
      PlayID1(a)
    else
      music2(a)
    end
end





while not fs.exists("name") do
    shell.run("clear")
    print("bottom  top  left  right  front  back")
    isNotRun=true
    io.write("direction> ")
    cmd=io.read()
    h = fs.open("name", "w")
    h.write(cmd)
    h.close()
end
  h = fs.open("name", "r")
 cmd = h.readAll()
 h.close()

while not fs.exists("name1") do
    shell.run("clear")
    print("Server channel")
    isNotRun=true
    io.write("name> ")
    cmd1=io.read()
    h1 = fs.open("name1", "w")
    h1.write(cmd1)
    h1.close()
end
h1 = fs.open("name1", "r")
cmd1 = h1.readAll()
h1.close()

while not fs.exists("speakername") do
    shell.run("clear")
    print("speaker id")
    isNotRun=true
    io.write("ID> ")
    cmd3="speaker_"..io.read()
    h3 = fs.open("speakername", "w")
    h3.write(cmd3)
    h3.close()
end
  h3 = fs.open("speakername", "r")
 cmd3 = h3.readAll()
 h3.close()


term.clear()
print("Servername:"..cmd1)


rednet.open(cmd)
while true do
   _,a = rednet.receive(cmd.."1")
   print(a)
   musicif(a)
end
