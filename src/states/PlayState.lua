PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
    self.enemies = params.enemies
    player:setTarget(self.enemies[1])
    player:reset()
end

function PlayState:update(dt)
    if self.enemies[1].health <= 0 then
        table.remove(self.enemies, 1)
        if #self.enemies == 0 then
            gStateMachine:change("pick_levelup", {})
        else
            -- if enemies left ->new target
            player:setTarget(self.enemies[1])
            
            for _, enemy in pairs(self.enemies) do
                enemy.slot = enemy.slot - 1
                enemy:calculate_position()
            end
        end
    end
    if #self.enemies > 0 then
        self.enemies[1]:update(dt)
    end
    player:update(dt)
    
end

function PlayState:render()
    love.graphics.draw(gImages["playBackground"], 0,0)
    for i=1, #self.enemies do
        self.enemies[#self.enemies-i+1]:render() 
    end
    player:render()

end

function PlayState:exit()
    player.round = player.round + 1
end