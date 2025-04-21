StartState = Class{__includes = BaseState}


function StartState:enter(params)
    -- self.PlayButton = params.PlayButton
    -- self.SettingsButton = params.SettingsButton
    self.ExitButton = params.ExitButton
end

function StartState:update(dt)
    self.ExitButton:update(dt)

    if love.keyboard.isDown("escape") then
        love.event.quit(1)
    end
end

function StartState:render()
    love.graphics.setFont(gFonts["heading"])
    love.graphics.printf("Katana Rogue", 0, 40, VIRTUAL_WIDTH, "center")

    -- self.PlayButton:render()
    -- self.SettingsButton:render()
    self.ExitButton:render()
end

function StartState:exit()
    
end