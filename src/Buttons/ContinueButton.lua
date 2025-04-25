ContinueButton = Class{__includes = Button}

function ContinueButton:update(dt)
    if self:isClicked() then
        gStateMachine:change("pick_levelup", {})
    end
end