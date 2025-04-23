StartState = Class{__includes = BaseState}



function StartState:enter(params)
    self.PlayButton = PlayButton("Play", VIRTUAL_WIDTH / 2 - BUTTON_WIDTH / 2, VIRTUAL_HEIGHT - 5 * BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT)
    self.SettingsButton = SettingsButton("Settings", VIRTUAL_WIDTH / 2 - BUTTON_WIDTH / 2, VIRTUAL_HEIGHT - 3.5 * BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT)
    self.ExitButton = ExitButton("Exit", VIRTUAL_WIDTH/ 2 - BUTTON_WIDTH / 2, VIRTUAL_HEIGHT- 2 * BUTTON_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT)
end

function StartState:update(dt)
    self.PlayButton:update(dt)
    self.SettingsButton:update(dt)
    self.ExitButton:update(dt)

    if love.keyboard.isDown("escape") then
        love.event.quit(1)
    end
end

function StartState:render()
    love.graphics.clear(gColors["dark_grey"])
    love.graphics.setFont(gFonts["heading"])
    love.graphics.setColor(gColors["red"])
    love.graphics.printf("Katana Rogue", 0, 40, VIRTUAL_WIDTH, "center")

    self.PlayButton:render()
    self.SettingsButton:render()
    self.ExitButton:render()
end

function StartState:exit()
    
end