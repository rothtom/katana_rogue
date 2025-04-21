ExitButton = Class{__includes = Button}

function ExitButton:update(dt)
    if self:isClicked() then
        love.event.quit(0)
    end
end