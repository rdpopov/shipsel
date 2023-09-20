M = {}
M.states = {}
M.state = nil
M.load_states = function (slf)
    local main_menu = require('skeleton.states.menu_state').init()
    slf.states.Menu = main_menu
    slf.state = "Menu"
end

M.render = function (slf)
    local render_fn
    for _, r in ipairs(slf.states[slf.state].to_render) do
        render_fn = r.render[r.render_flag]
        if render_fn then
            render_fn(r)
        end
    end
end

M.update = function (slf)
    local render_fn
    for _, u in ipairs(slf.states[slf.state].to_render) do
        if u.update_flag and u.update then
            u.update(u)
        end
    end
end

M.mouse_interact = function (slf,evt)
    for _, m in ipairs(slf.states[slf.state].to_interact) do
        if m.mouse_update then
            m.mouse_update(m,evt)
        end
    end
end

M.key_interact = function (slf,evt)
    for _, k in ipairs(slf.states[slf.state].to_interact) do
        if k.key_update then
            k.key_update(k,evt)
        end
    end
end
return M
