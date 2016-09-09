-- Copyright (c) 2015 Sebastian Hodapp
-- https://github.com/sebastianhodapp/ESPbootloader


-- If GPIO0 changes during the countdown, launch config
gpio.mode(3, gpio.INT)
gpio.trig(3,"both",function()
          tmr.stop(0)
          dofile("run_config.lc")
     end)
     
local countdown = 5

tmr.alarm(0,1000,1,function()
     print(countdown)
     countdown = countdown -1 
     if (countdown == 0) then
          countdown = nil
          gpio.mode(3,gpio.FLOAT)
          tmr.stop(0)
          if pcall(function () 
          	dofile("config.lc")
          end) then
               dofile("run_program.lua")
          else
          	print("Enter configuration mode")
          	dofile("run_config.lc")
          end
     end
end)
