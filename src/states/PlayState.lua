PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
    self.player = params.player
    self.enemies = params.enemies
end

function PlayState:update(dt)
    self.player.update(dt)
end

function PlayState:render()
    love.graphics.draw(gImages["playBackground"], 0,0)
    for _, enemie in pairs(self.enemies) do
        enemie:render()
    end
    self.player:render()

end

function PlayState:exit()

end