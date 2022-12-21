while true do
    if fs.exists("/disk/init.lua") then
        term.clear() term.setCursorPos(1,1)
        local _, err = pcall(loadfile("/disk/init.lua"))
        printError(err) 
        term.setCursorPos(1,2)
        term.write("Press any key to shutdown.") pullEvent("key")
        os.shutdown()
    elseif fs.exists("/init.lua") then
        term.clear() term.setCursorPos(1,1)
        local _, err = pcall(loadfile("/init.lua"))
        if type(err) == "string" then
            printError(err) 
        else
            os.shutdown()
        end
        term.setCursorPos(1,2)
        term.write("Press any key to shutdown.") pullEvent("key")
        os.shutdown()
    else
        local tx, ty = term.getCursorPos()
        local tsx, tsy = term.getSize()
        term.setCursorPos(1, ty+1)
        term.write("No bootable file, insert disk then press key") pullEvent("key")
    end
end