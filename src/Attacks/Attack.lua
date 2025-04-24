Attack = Class{}

local ICON_SIZE = 20
local ICON_MARGIN = 5


function Attack:init(stats, key)
    self.stats = {}
    self.stats["damage"] = stats.damage
    self.stats["duration"] = stats.duration
    self.duration_left = 0
    self.stats["cooldown"] = stats.cooldown
    self.cooldown_left = 0
    self.key = key
    self.attack_place = gAttackMap[key]
    self.x = MARGIN_X + (ICON_MARGIN + ICON_SIZE) * (self.attack_place - 1)
    self.y = VIRTUAL_HEIGHT - MARGIN_Y - 25 - ICON_MARGIN - 2
end

function Attack:update(dt)
    self.duration_left = math.max(0, self.duration_left - dt)
    if not self:is_active() then
        self.cooldown_left = math.max(0, self.cooldown_left - dt)
    end
end

function Attack:activate(target)
    target:take_damage((self.stats["damage"] + sword.stats["damage"]) * player.stats["strength"])
    self.duration_left = self.stats["duration"]
    self.cooldown_left = self.stats["cooldown"]
end

function Attack:reset()
    self.cooldown_left = 0
    self.duration_left = 0
end

function Attack:apply(stats)
    for stat, ammount in pairs(stats) do
        self.stats[stat] = self.stats[stat] + ammount
    end
end

function Attack:render()
    if self:is_active() then
        love.graphics.setColor(gColors["light_blue"])        
    else
        love.graphics.setColor(gColors["light_grey2"])
    end
    love.graphics.rectangle("line", self.x, self.y, ICON_SIZE, ICON_SIZE)
    
    if self:is_onCooldown() and not self:is_active() then
        love.graphics.setColor(gColors["grey"])
    else
        love.graphics.setColor(gColors["light_grey1"])
    end
    love.graphics.rectangle("fill", self.x, self.y, ICON_SIZE, ICON_SIZE)
    love.graphics.setColor(1,1,1,1)
    love.graphics.printf(self.key, self.x+2, self.y + ICON_SIZE / 2 + 3,ICON_SIZE - 4 ,"left")

    
end

function Attack:is_onCooldown()
    return  self.cooldown_left > 0
end

function Attack:is_active()
    return self.duration_left > 0
end