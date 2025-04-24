Sword = Class{}

function Sword:init(stats)
    self.stats = {}
    self.stats["damage"] = stats.damage or 10
    self.stats["cooldown_reduction"] = stats.cooldown_reduction or 0
end

function Sword:apply(stats)
    for stat, ammount in pairs(stats) do
        self.stats[stat] = self.stats[stat] + ammount
    end
end

function Sword:update(dt)
    
end

function Sword:render()
    love.graphics.draw(gImages["sword"], 0, 0)
end