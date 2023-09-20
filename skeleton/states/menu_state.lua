local state = require('skeleton.base.states_datatype')

M = {}

local function logo(owner)
    local lg = state.create_renderable("Shipsel")
    table.insert(owner.to_render, lg)
    local lg_hover = state.create_interactable(lg)
    table.insert(owner.to_interact, lg_hover)
end

M.init = function ()
    local menu_state = state.create_state("Main Menu")
    logo(menu_state)
    return menu_state
end

return M
