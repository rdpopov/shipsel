M = {}

-- these are for top level rendering and events
-- ultimately there will not be much of these 
-- maybe 10-20 items tops per state
-- so we can be a little inefficient
M.create_renderable = function (renderable_name)
    return {
        name        = renderable_name, -- name of renderable object
        priority    = 0,               -- render priority
        render_flag = 1,                -- Which render method should be used
        render = {
            [1] =  function(slf)         -- object render method, if exists
                love.graphics.setColor( 0.4, 0.4,0)
                love.graphics.print(slf.name, slf.data.x1, slf.data.y1)
            end,
            [2]= function(slf)           -- object render method, if exists
                love.graphics.setColor(0, 0.4, 0.4)
                love.graphics.print(slf.name, slf.data.x1, slf.data.y1)
            end
        },
        update_flag = true,                 -- maybe this should be 
        update = function(slf)           -- update method
            slf.data.x1 = (slf.data.x1 + 1 ) % 200
            slf.data.y1 = (slf.data.y1 + 1 ) % 200
        end,

        data = {                       -- object data
            x1 = 0,
            y1 = 0,
            x2 = 200,
            y2 = 200,
        }
    }
end

M.create_interactable = function (renderable_object)
    return {
        to_render = renderable_object, -- will not be used for rendering, just to have a refference to update
        -- can also also have multiple interactable for one renderable or none at all
        mouse_update = function(slf,evt)
        end,
        key_update = function(slf,evt)
            if evt.key == "space" then
                if slf.to_render.render_flag == 1 then
                    slf.to_render.render_flag = 2
                else 
                    slf.to_render.render_flag = 1
                end
            end
        end
    }
end


M.create_state = function (state_name)
    return {
        -- callbacks for specific events
        name = state_name,
        cb = {
            -- render = nil, -- a callback to override the default render method
            -- update = nil, -- a callback to override the default render method
        },
        -- renderable objects
        to_render = {},
        -- interactable objects
        to_interact = {}
    }
end

return M
