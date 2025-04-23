DeathState = Class{__includes = BaseState}

function DeathState:enter(params)
    self.unlocks = params.unlocks
    self.PlayAgainButton = PlayButton("Play again", VIRTUAL_WIDTH/2 - BUTTON_WIDTH/2, VIRTUAL_HEIGHT - 4.5 * BUTTON_HEIGHT, 
                                    BUTTON_WIDTH, BUTTON_HEIGHT, gFonts["normal"])
    self.ExitToHomeButton = ExitToHomeButton("Exit to home", VIRTUAL_WIDTH/2 - BUTTON_WIDTH/2, VIRTUAL_HEIGHT - 3 * BUTTON_HEIGHT, 
                            BUTTON_WIDTH, BUTTON_HEIGHT, gFonts["normal"])
end

function DeathState:update(dt)
    self.PlayAgainButton:update(dt)
    self.ExitToHomeButton:update(dt)
end

function DeathState:render()
    love.graphics.draw(gImages["playBackground"], 0, 0)
    self.PlayAgainButton:render()
    self.ExitToHomeButton:render()
end