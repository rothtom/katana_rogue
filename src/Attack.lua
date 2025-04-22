Attack = Class{}

function Attack:init(stats)
    self.damage = stats.damage
    self.duration = stats.duration
    self.duration_left = 0
    self.cooldown = stats.cooldown
    self.cooldown_left = 0
end

function Attack:update(dt)
    self.duration_left = math.max(0, self.duration_left - dt)
    if not self:is_active() then
        self.cooldown_left = math.max(0, self.cooldown_left - dt)
    end
end

function Attack:activate(target, player)
    target.health = target.health - (self.damage * player.damage)
    self.duration_left = self.duration
    self.cooldown_left = self.cooldown
end

function Attack:render(x, y)

end

function Attack:is_onCooldown()
    return  self.cooldown_left > 0
end

function Attack:is_active()
    return self.duration_left > 0
end