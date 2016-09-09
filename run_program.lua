-- Start your normal program routines here 
print("Execute code")
dofile("config.lc")
wifi.setmode(wifi.STATION)
wifi.sta.config(ssid,password)
wifi.sta.connect()

ssid=nil
password=nil 

-- add a variable "program" to your config.lc
-- hint: you can use a hidden field in configform.html
if (defaultprogram == nil) then defaultprogram = "defaultprogram.lc" end
dofile(defaultprogram)
