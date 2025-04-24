ExitToHomeButton = Class{__includes = Button}

function ExitToHomeButton:update(dt)
    if self:isClicked() then
        gStateMachine:change("start", {})
    end
end