while not fs.exists("name") do
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

while not fs.exists("name2") do
  print("bottom  top  left  right  front  back")
  isNotRun=true
  io.write("direction2> ")
  cmd2=io.read()
  h = fs.open("name2", "w")
  h.write(cmd2)
  h.close()
end
h = fs.open("name2", "r")
cmd2 = h.readAll()
h.close()

while not fs.exists("s") do
  print("shuling")
  isNotRun=true
  io.write("s> ")
  cmd8=io.read()
  h = fs.open("s", "w")
  h.write(cmd8)
  h.close()
end
h = fs.open("s", "r")
s = tonumber(h.readAll())
h.close()

while not fs.exists("sname") do
  print("id:1234567")
  isNotRun=true
  io.write("id> ")
  cmd21=io.read()
  h = fs.open("sname", "w")
  h.write(cmd21)
  h.close()
end
h = fs.open("sname", "r")
sname = h.readAll()
print(sname)
h.close()


function a1()
  computer = peripheral.wrap("computer_"..id1)
  computer.reboot()
end
function a2()
  computer = peripheral.wrap("computer_"..id2)
  computer.reboot()
end
function a3()
  computer = peripheral.wrap("computer_"..id3)
  computer.reboot()
end
function a4()
  computer = peripheral.wrap("computer_"..id4)
  computer.reboot()
end
function a5()
  computer = peripheral.wrap("computer_"..id5)
  computer.reboot()
end
function a6()
  computer = peripheral.wrap("computer_"..id6)
  computer.reboot()
end
function a7()
  computer = peripheral.wrap("computer_"..id7)
  computer.reboot()
end
function a8()
  computer = peripheral.wrap("computer_"..id8)
  computer.reboot()
end
function a9()
  computer = peripheral.wrap("computer_"..id9)
  computer.reboot()
end
function a10()
  computer = peripheral.wrap("computer_"..id10)
  computer.reboot()
end

function stop()
  if s==1 then
    L=1
    id1 = string.sub(sname, L ,L+1)
    a1(id)
  end
  if s==2 then
    L=1
    id1 = string.sub(sname, L ,L+1)
    L=L+2
    id2 = string.sub(sname, L ,L+1)
    parallel.waitForAll(a1,a2)
  end  
  if s==3 then
    L=1
    id1 = string.sub(sname, L ,L+1)
    L=L+2
    id2 = string.sub(sname, L ,L+1)
    L=L+2
    id3 = string.sub(sname, L ,L+1)
    parallel.waitForAll(a1,a2,a3)
  end  
  if s==4 then
    L=1
    id1 = string.sub(sname, L ,L+1)
    L=L+2
    id2 = string.sub(sname, L ,L+1)
    L=L+2
    id3 = string.sub(sname, L ,L+1)
    L=L+2
    id4 = string.sub(sname, L ,L+1)
    parallel.waitForAll(a1,a2,a3,a4)
  end  
  if s==5 then
    L=1
    id1 = string.sub(sname, L ,L+1)
    L=L+2
    id2 = string.sub(sname, L ,L+1)
    L=L+2
    id3 = string.sub(sname, L ,L+1)
    L=L+2
    id4 = string.sub(sname, L ,L+1)
    L=L+2
    id5 = string.sub(sname, L ,L+1)
    parallel.waitForAll(a1,a2,a3,a4,a5)
  end  
  if s==6 then
    L=1
    id1 = string.sub(sname, L ,L+1)
    L=L+2
    id2 = string.sub(sname, L ,L+1)
    L=L+2
    id3 = string.sub(sname, L ,L+1)
    L=L+2
    id4 = string.sub(sname, L ,L+1)
    L=L+2
    id5 = string.sub(sname, L ,L+1)
    L=L+2
    id6 = string.sub(sname, L ,L+1)
    parallel.waitForAll(a1,a2,a3,a4,a5,a6)
  end  
  if s==7 then
    L=1
    id1 = string.sub(sname, L ,L+1)
    L=L+2
    id2 = string.sub(sname, L ,L+1)
    L=L+2
    id3 = string.sub(sname, L ,L+1)
    L=L+2
    id4 = string.sub(sname, L ,L+1)
    L=L+2
    id5 = string.sub(sname, L ,L+1)
    L=L+2
    id6 = string.sub(sname, L ,L+1)
    L=L+2
    id7 = string.sub(sname, L ,L+1)
    parallel.waitForAll(a1,a2,a3,a4,a5,a6,a7)
  end  
  if s==8 then
    L=1
    id1 = string.sub(sname, L ,L+1)
    L=L+2
    id2 = string.sub(sname, L ,L+1)
    L=L+2
    id3 = string.sub(sname, L ,L+1)
    L=L+2
    id4 = string.sub(sname, L ,L+1)
    L=L+2
    id5 = string.sub(sname, L ,L+1)
    L=L+2
    id6 = string.sub(sname, L ,L+1)
    L=L+2
    id7 = string.sub(sname, L ,L+1)
    L=L+2
    id8 = string.sub(sname, L ,L+1)
    parallel.waitForAll(a1,a2,a3,a4,a5,a6,a7,a8)
  end  
  if s==9 then
    L=1
    id1 = string.sub(sname, L ,L+1)
    L=L+2
    id2 = string.sub(sname, L ,L+1)
    L=L+2
    id3 = string.sub(sname, L ,L+1)
    L=L+2
    id4 = string.sub(sname, L ,L+1)
    L=L+2
    id5 = string.sub(sname, L ,L+1)
    L=L+2
    id6 = string.sub(sname, L ,L+1)
    L=L+2
    id7 = string.sub(sname, L ,L+1)
    L=L+2
    id8 = string.sub(sname, L ,L+1)
    L=L+2
    id9 = string.sub(sname, L ,L+1)
    parallel.waitForAll(a1,a2,a3,a4,a5,a6,a7,a8,a9)
  end  
  if s==1 then
    L=1
    id1 = string.sub(sname, L ,L+1)
    L=L+2
    id2 = string.sub(sname, L ,L+1)
    L=L+2
    id3 = string.sub(sname, L ,L+1)
    L=L+2
    id4 = string.sub(sname, L ,L+1)
    L=L+2
    id5 = string.sub(sname, L ,L+1)
    L=L+2
    id6 = string.sub(sname, L ,L+1)
    L=L+2
    id7 = string.sub(sname, L ,L+1)
    L=L+2
    id8 = string.sub(sname, L ,L+1)
    L=L+2
    id9 = string.sub(sname, L ,L+1)
    L=L+2
    id10 = string.sub(sname, L ,L+1)
    parallel.waitForAll(a1,a2,a3,a4,a5,a6,a7,a8,a8,a10)
  end
end

rednet.open(cmd)
rednet.open(cmd2)

while true do
  _,a = rednet.receive(cmd1)
  print(a)
  if a == "stop" then
    stop()
    --rednet.broadcast("Playback server reset","25565")
  else
    stop()
    --rednet.broadcast("Playback server reset","25565")
    print("1222")
    sleep(1)
    rednet.broadcast(a,cmd2.."1")
    sleep(10)
    print("on")
    rednet.broadcast("on",cmd2.."3")
    --rednet.broadcast("Play"..a,"25565")
  end
end
