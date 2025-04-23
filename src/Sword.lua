Sword = Class{}

function Sword:init(stats)
    self.damage = stats.damage or 10
    self.cooldown_reduction = stats.cooldown_reduction or 0
end

function Sword:update(dt)
    
end

function Sword:render()
    love.graphics.draw(gImages["sword"], 0, 0)
end