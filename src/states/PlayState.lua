PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
    self.player = params.player
    self.round = params.round
    self.enemies = params.enemies
end

function PlayState:update(dt)
    if self.enemies[1].health <= 0 then
        table.remove(self.enemies, 1)
    end
    if #self.enemies == 0 then
        gStateMachine:change("pick_levelup", {

        })
    end
    self.player:setEnemie(self.enemies[1])
    self.player:update(dt)
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