---------------------------------Copyright(c)2022 GLASS------------------------------------------------
--                                                                                                   --
--  ______     ______     __    __     __  __     ______     __     ______       __  __      __      --
-- /\  ___\   /\  ___\   /\ "-./  \   /\ \/\ \   /\  ___\   /\ \   /\  ___\     /\ \/\ \    /\ \     --
-- \ \ \____  \ \ \____  \ \ \-./\ \  \ \ \_\ \  \ \___  \  \ \ \  \ \ \____    \ \ \_\ \   \ \ \    --
--  \ \_____\  \ \_____\  \ \_\ \ \_\  \ \_____\  \/\_____\  \ \_\  \ \_____\    \ \_____\   \ \_\   --
--   \/_____/   \/_____/   \/_/  \/_/   \/_____/   \/_____/   \/_/   \/_____/     \/_____/    \/_/   --
--                                                                                                   --
---------------------------------Copyright(c)2022 GLASS------------------------------------------------

-- 编码表--
b="I >"
c=string.char(16).."|"
d="|"..string.char(17)
e="O"
f="T"
infoName="info"
true2="false"
debug=0
W=1
--加载配置--
h = fs.open(infoName, "r")
infoTable = h.readAll()
e= string.sub(infoTable, 1 ,1)
true1 = string.sub(infoTable, 3 ,6)
id1 = tonumber(string.sub(infoTable, 14 ,-1))
index = tonumber(string.sub(infoTable, 10 ,10))
id2 = tonumber(string.sub(infoTable, 10 ,10))
h.close()
ai=string.char(7)
keypad = {
--{name,x,y,print}
  {1,1,1,"MUSIC"},
  {2,25,15,b},
  {3,38,15,c},
  {4,13,15,d},
  {5,5,15,e},
  {6,47,15,f},
  {7,15,10,">"},
  {8,51,1,"X"},
  {9,16,11,""},
  {10,21,11,""},
  {11,26,11,""},
  {12,31,11,""},
  {13,35,11,""},
  {14,37,10,string.char(3)},
}

sleep(0.1)
--写入配置--
O2="1"
infoTable=e..O2..true1.." | "..id2.." | "..id1
h = fs.open(infoName, "w")
h.write(infoTable)
h.close()


--创建窗口并加载图像--
local window = window.create(term.current(), 1, 1, 51, 19)
term.redirect(window)
local UI = paintutils.loadImage("/system/UI.nfp")
paintutils.drawImage(UI, term.getCursorPos())
local UI = paintutils.loadImage("/system/UI.nfp")
paintutils.drawImage(UI, term.getCursorPos())

--绘制字符图像--
--term.setCursorPos(25,15)
--term.write(b)
term.setBackgroundColor(colors.lightGray)
term.setCursorPos(16,12)
print("--------------------")
term.setCursorPos(16,11)
print(".    .    .    .    .")


term.setBackgroundColor(colors.gray)
  for i,v in pairs(keypad) do
  X,x,y,num = unpack(v)
  term.setCursorPos(x,y)
  term.write(num)
end
local function PlayID(id,index)
    local Buf = http.get("https://raw.githubusercontent.com/maoliuli/ccmusic-UI-2.2.1/main/music/music"..id.."."..index..".dfpwm", { ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36" } ,true)
    if Buf ~= nil then
        local dfpwm = require("cc.audio.dfpwm")
        local speaker = peripheral.find("speaker")
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
  local Buf = http.get("https://raw.githubusercontent.com/maoliuli/ccmusic-UI-2.2.1/main/music/music"..id..".dfpwm", { ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36" } ,true)
  if Buf ~= nil then
      local dfpwm = require("cc.audio.dfpwm")
      local speaker = peripheral.find("speaker")
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
  b="I I"
  true2="true"
  term.setCursorPos(25,15)
  term.write(b)
    while true do
        if index==1 then
          term.setCursorPos(16,12)
          term.setBackgroundColor(colors.lightGray)
          print("="..string.char(7).."-------------------")
          term.setBackgroundColor(colors.gray)
        end
        if index==2 then
          term.setCursorPos(16,12)
          term.setBackgroundColor(colors.lightGray)
          print("====="..string.char(7).."---------------")
          term.setBackgroundColor(colors.gray)
        end
        if index==3 then
          term.setCursorPos(16,12)
          term.setBackgroundColor(colors.lightGray)
          print("=========="..string.char(7).."----------")
          term.setBackgroundColor(colors.gray)
        end
        if index==4 then
          term.setCursorPos(16,12)
          term.setBackgroundColor(colors.lightGray)
          print("==============="..string.char(7).."-----")
          term.setBackgroundColor(colors.gray)
        end
        if index==5 then
          term.setCursorPos(16,12)
          term.setBackgroundColor(colors.lightGray)
          print("===================="..string.char(7).."")
          term.setBackgroundColor(colors.gray)
        end
        true1="true"
        id1=a
        id2=index
        infoTable=e..O2..true1.." | "..id2.." | "..id1
        h = fs.open(infoName, "w")
        h.write(infoTable)
        h.close()
        PlayID(a,tostring(index))
        index = index + 1;
        if index >= 5 then
            sleep(2)
            musicif1(a)
          break;
        end
    end
    true2="false"
end

--music1--
function music(a)
  b="I I"
  true2="true"
  term.setCursorPos(25,15)
  term.write(b)
  term.setCursorPos(16,12)
  term.setBackgroundColor(colors.lightGray)
  print("=-------------------=")
  term.setBackgroundColor(colors.gray)
  true1="true"
  id1=a
  id2="1"
  infoTable=e..O2..true1.." | "..id2.." | "..id1
  h = fs.open(infoName, "w")
  h.write(infoTable)
  h.close()
  PlayID1(a)
  sleep(2)
  musicif1(a)
  true2="false"
end

--musicif1--
function musicif1(a)
  
  if e=="O" then
    term.setCursorPos(16,10)
    term.write(id1)
    sleep(2)
    term.setCursorPos(16,12)
    term.setBackgroundColor(colors.lightGray)
    print("===================="..string.char(7).."")
    term.setBackgroundColor(colors.gray)
    O2="0"
    index=1
    true1="fals"
    id20="1"
    inf=e..O2..true1.." | "..id20.." | "..id1
    h = fs.open(infoName, "w")
    h.write(inf)
    h.close()
    os.exit()
  else
    if e=="@" then
      while true do
        term.setCursorPos(16,10)
        term.write(id1)
        sleep(2)
        term.setCursorPos(16,12)
        term.setBackgroundColor(colors.lightGray)
        print("===================="..string.char(7).."")
        term.setBackgroundColor(colors.gray)
        O2="0"
        index=1
        true1="true"
        id20="1"
        inf=e..O2..true1.." | "..id20.." | "..id1
        h = fs.open(infoName, "w")
        h.write(inf)
        h.close()
        os.exit()
      end
    else
      if e=="=" then
        while true do
          id1=id1+1
          term.setCursorPos(16,10)
          term.write(id1)
          sleep(2)
          term.setCursorPos(16,12)
          term.setBackgroundColor(colors.lightGray)
          print("===================="..string.char(7).."")
          term.setBackgroundColor(colors.gray)
          O2="0"
          index=1
          true1="true"
          id20="1"
          inf=e..O2..true1.." | "..id20.." | "..id1
          h = fs.open(infoName, "w")
          h.write(inf)
          h.close()
          os.exit()
        end
      end
    end
  end
end

--musicif--
function musicif(a)
  b=tonumber(a)
  if b >= 209 then
    term.setCursorPos(16,12)
    term.setBackgroundColor(colors.lightGray)
    print("=-------------------=")
    term.setBackgroundColor(colors.gray)
    music(a)
  else
    music2(a)
  end
end

--ib--
function ib()
  term.setCursorPos(25,15)
  term.write(b)
end
function stop1()
  true1="fals"
  id2=index
  O2="0"
  infoTable=e..O2..true1.." | "..id2.." | "..id1
  h = fs.open(infoName, "w")
  h.write(infoTable)
  speaker = peripheral.find("speaker")
  speaker.stop()
  term.setCursorPos(27,1)
  os.exit()
end

function stop2()
  true1="true"
  id2="1"
  O2="0"
  infoTable=e..O2..true1.." | "..id2.." | "..id1
  h = fs.open(infoName, "w")
  h.write(infoTable)
  speaker = peripheral.find("speaker")
  speaker.stop()
  term.setCursorPos(27,1)
  os.exit()
end

--2--
function a2()
  if b=="I I" then
    b="I >"
    term.setCursorPos(25,15)
    term.write(b)

    stop1()

  else
    if b=="I >" then
      b="I I"
      term.setCursorPos(25,15)
      term.write(b)
      a=id1
      musicif(a)
      end
  end
end

--4--
function a4()
  shell.run("reboot")
end
--a5--
function a5()
  if e=="=" then
    e="O"
    term.setCursorPos(5,15)
    term.write(e)
    inf2=e..O2..true1.." | "..id2.." | "..id1
    h = fs.open("info", "w")
    h.write(inf2)
    h.close()
  else
    if e=="@" then
      e="="
      term.setCursorPos(5,15)
      term.write(e)
      inf2=e..O2..true1.." | "..id2.." | "..id1
      h = fs.open("info", "w")
      h.write(inf2)
      h.close()
    else
      if e=="O" then
        e="@"
        term.setCursorPos(5,15)
        term.write(e)
        inf2=e..O2..true1.." | "..id2.." | "..id1
        h = fs.open("info", "w")
        h.write(inf2)
        h.close()
      end
    end
  end
end
--6--
function a6()
  O2="0"
  inf2=e..O2..true1.." | "..id2.." | "..id1
  h = fs.open("info", "w")
  h.write(inf2)
  shell.run("edit /system/list.txt")
  term.setCursorPos(27,1)
  os.exit()
end
--7--
function a7()
  term.setCursorPos(16,10)
  term.write("                    ")
  term.setCursorPos(16,10)
  isNotRun=true
  io.write("")
  cmd=io.read()
  id1=tonumber(cmd)
  O2="0"
  true1="true"
  id21="1"
  inf=e..O2..true1.." | "..id21.." | "..cmd
  h = fs.open(infoName, "w")
  h.write(inf)
  h.close()
  os.exit()
end

--判断数据--
function pand(b,K)
  if b==1 then
    debug=debug+1
    if debug>=8 then
      debug=0
      O2="0"
      inf2=e..O2..true1.." | "..id2.." | "..id1
      h = fs.open("info", "w")
      h.write(inf2)
      shell.run("/system/debug.lua")
    end
  end

  if b==2 then
    a2()
  end

  if b==3 then
    id1=id1 + 1
    term.setCursorPos(16,10)
    term.write(id1)
    stop2()
  end

  if b==4 then
    if id1 > 1 then
      id1=id1 - 1
      term.setCursorPos(16,10)
      term.write(id1)
      stop2()
    end
    sleep(0.1)
  end
  if b==5 then
    a5()
  end
  if b==6 then
    a6()
  end
  if b==7 then
    a7()
  end
  if b==8 then
    a4()
  end
  if b==9 then
    O2="0"
    true1="true"
    id2="1"
    inf2=e..O2..true11.." | "..iid21.." | "..id1
    h = fs.open("info", "w")
    h.write(inf2)
    h.close()
    sleep(0.1)
    os.exit()
  end
  if b==10 then
    O2="0"
    true11="true"
    iid21="2"
    inf2=e..O2..true11.." | "..iid21.." | "..id1
    h = fs.open("info", "w")
    h.write(inf2)
    h.close()
    sleep(0.1)
    os.exit()
  end
  if b==11 then
    O2="0"
    true11="true"
    iid21="3"
    inf2=e..O2..true11.." | "..iid21.." | "..id1
    h = fs.open("info", "w")
    h.write(inf2)
    h.close()
    sleep(0.1)
    os.exit()
  end
  if b==12 then
    O2="0"
    true11="true"
    iid21="4"
    inf2=e..O2..true11.." | "..iid21.." | "..id1
    h = fs.open("info", "w")
    h.write(inf2)
    h.close()
    sleep(0.1)
    os.exit()
  end
  if b==13 then
    O2="0"
    true11="fals"
    iid21="1"
    inf2=e..O2..true11.." | "..iid21.." | "..id1
    h = fs.open("info", "w")
    h.write(inf2)
    h.close()
    sleep(0.1)
    os.exit()
  end
  if b==14 then
    if K==1 then

      term.setCursorPos(16,10)
      term.write("                    ")
      term.setCursorPos(16,10)
      isNotRun=true
      io.write("name:")
      namecmd=io.read()
      g = fs.open("/system/ailist.txt", "a")
      g.write("collection: "..namecmd..": musicID: "..id1.."\n")
      g.close()
      term.setCursorPos(16,10)
      term.write("                    ")
      term.setCursorPos(16,10)
      term.write(id1)
      term.setCursorPos(37,10)
      term.write(string.char(4))

    else
      O2="0"
      inf2=e..O2..true1.." | "..id2.." | "..id1
      h = fs.open("info", "w")
      h.write(inf2)
      shell.run("edit /system/ailist.txt")
    end
  end
end

--判断坐标--
function checkClick(x,y)
  for i,v in pairs(keypad) do
    num,cx,cy = unpack(v)
    if (x >= cx) and (x <= cx + 2) and (y == cy) then
      return true,num
    end
  end
  return false
end

  --输出--
  function numClick(num,K)
    a=num
    pand(a,K)
end
--时间--
 function b1()
    while true do
        term.setBackgroundColor(colors.gray)
        M1=os.date("%H")
        S1=os.date("%M")
        term.setCursorPos(23,1)
        term.write(M1..":"..S1)
        sleep(60)
    end
end

function a1()
    --读取点击坐标--
    while true do
      local event, button, x, y = os.pullEvent("mouse_click")
      validClick,num=checkClick(x,y)
      if (validClick) then
        K=button
        numClick(num,K)
      end
    end
end

function if2()
  if index==1 then
    term.setCursorPos(16,12)
    term.setBackgroundColor(colors.lightGray)
    print("="..string.char(7).."-------------------")
    term.setBackgroundColor(colors.gray)
  end
  if index==2 then
    term.setCursorPos(16,12)
    term.setBackgroundColor(colors.lightGray)
    print("====="..string.char(7).."----------------")
    term.setBackgroundColor(colors.gray)
  end
  if index==3 then
    term.setCursorPos(16,12)
    term.setBackgroundColor(colors.lightGray)
    print("=========="..string.char(7).."----------")
    term.setBackgroundColor(colors.gray)
  end
  if index==4 then
    term.setCursorPos(16,12)
    term.setBackgroundColor(colors.lightGray)
    print("==============="..string.char(7).."-----")
    term.setBackgroundColor(colors.gray)
  end
  if index==5 then
    term.setCursorPos(16,12)
    term.setBackgroundColor(colors.lightGray)
    print("===================="..string.char(7).."")
    term.setBackgroundColor(colors.gray)
  end

end
function if1()
  O2="1"
  infoTable=e..O2..true1.." | "..id2.." | "..id1
  h = fs.open(infoName, "w")
  h.write(infoTable)
  h.close()
  term.setCursorPos(16,10)
  term.write(id1)
  if true1=="true" then
    musicif(id1)
  end
end
function a21()
  --读取点击坐标--
  true2="false"
  while true do
    if true2=="true" then
      local event, button, x, y = os.pullEvent("mouse_click")
      validClick,num=checkClick(x,y)
      if (validClick) then
        K=button
        numClick(num,K)
      end
    end
    sleep(0.1)
  end
end


parallel.waitForAll(a21,b1,a1,if1,if2)
