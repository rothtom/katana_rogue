PickLevelUpState = Class{__includes = BaseState}

function PickLevelUpState:enter(params)
    
    self.upgrades = params.upgrades
end

function PickLevelUpState:pick(stat)
    if stat == "max_health" then
        player.max_health = self.palyer.max_health + 10
    elseif stat == "damage" then
        player.damage = self.palyer.damage + 0.1
    end
end

function PickLevelUpState:update(dt)
    for _, upgrade in pairs(self.upgrades) do
        upgrade:update(dt)
    end
end



function PickLevelUpState:render()
    love.graphics.draw(gImages["playBackground"], 0, 0)
    
    for _, upgrade in pairs(self.upgrades) do
        upgrade:render()
    end
end