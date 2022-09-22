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

 h = fs.open("name", "r")
cmd = h.readAll()
h.close()

term.clear()
print("Servername:"..cmd1)

rednet.open(cmd)
while true do
   io.write("music id> ")
   a=io.read()
   if a == "stop" then
      rednet.broadcast("stop",cmd1)
   else
      rednet.broadcast(a,cmd1)
   end
end