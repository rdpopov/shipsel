local state = require('skeleton.base.state')
state.load_states(state)

function love.draw()
    state.render(state)
end

local since_last_update = 0
function love.update(dt)
    if dt < 1/60 then
        love.timer.sleep((1/60 - dt))
    end
    since_last_update = since_last_update + (1/60)
    state.update(state)
    love.graphics.clear()
end

function love.keypressed(key, scancode, isrepeat)
    local evt = {key=key,scancode=scancode,isrepeat=isrepeat}
    state.key_interact(state,evt)
end

function love.mousepressed( x, y, button, istouch, presses )
    local evt = {x=x, y=y, button=button, istouch=istouch, presses=presses}
    state.mouse_interact(state,evt)
end
