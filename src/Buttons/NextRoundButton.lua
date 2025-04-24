NextRoundButton = Class{__includes = Button}

function NextRoundButton:update(dt)
    if self:isClicked() then
        gStateMachine:change("play", {})
    end
end