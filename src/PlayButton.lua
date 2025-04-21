PlayButton = Class{__includes = Button}

function PlayButton:update(dt)
    if self:isClicked() then
        gStateMachine:change("play", {})        
    end
end