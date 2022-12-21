function _G.pullEvent(filt)
    return coroutine.yield(filt)
end
function _G.sleep(time)
  local timer = os.startTimer(time)
  repeat
    local _, event = pullEvent("timer")
  until event == timer
end
function _G.dofile(file)
    local ofl = assert(fs.open(file,"r"),"File not found")
    local f, err = loadstring(ofl.readAll())
    ofl.close()
    if f then
        return f()
    else
        error(err,2)
    end
end
function _G.loadfile(file)
    local ofl = assert(fs.open(file,"r"),"File not found")
    local f, err = loadstring(ofl.readAll())
    if f then
        return f
    else
        error(err,2)
    end
end
function _G.printError(tex)
    local tx, ty = term.getCursorPos()
    term.setCursorPos(1, ty+1)
    local old = term.getTextColor()
    term.setTextColor(0x4000)
    term.write(tex)
    term.setTextColor(old)
end
dofile("/rom/post.lua")