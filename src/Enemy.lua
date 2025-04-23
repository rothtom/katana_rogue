Enemy = Class{}

local BAR_WIDTH = 96 * (2/3)
local BAR_HEIGHT = 12
local ENEMY_WIDTH = 96
local ENEMY_HEIGHT = 128
local BAR_Y_OFFSET = 15


function Enemy:init(level, slot)
    self.level = level
    self:scale_max_hp(level)
    self.health = self.max_health
    self:scale_damage(level)
    self.slot = slot
    self:calculate_position()
end

function Enemy:render()
    love.graphics.setColor(gColors["light_grey1"])
    love.graphics.rectangle("line", self.x, self.y, BAR_WIDTH, BAR_HEIGHT)

    love.graphics.setColor(gColors["red"])
    love.graphics.rectangle("fill", self.x + 1, self.y, math.floor(BAR_WIDTH * (self.health/self.max_health) - 1), BAR_HEIGHT)

    love.graphics.setColor(gColors["dark_grey"])
    love.graphics.rectangle("fill", self.x + BAR_WIDTH * (self.health / self.max_health), self.y + 1, BAR_WIDTH * ((self.max_health - self.health)/self.max_health), BAR_HEIGHT - 1)


    love.graphics.setFont(gFonts["small"])
    love.graphics.setColor(gColors["white"])
    love.graphics.printf(self.health .. "/" .. self.max_health, self.x, self.y + 2, BAR_WIDTH,"center")

    love.graphics.setColor(1,1,1,1)
    love.graphics.draw(gImages["enemie"], self.x - ((ENEMY_WIDTH - BAR_WIDTH) / 2), VIRTUAL_HEIGHT / 2 - ENEMY_HEIGHT/2)
    
end

function Enemy:calculate_position()
    self.x = math.floor(((VIRTUAL_WIDTH / 2) - BAR_WIDTH/2))
    self:calculate_x_offset()
    self.y = math.floor(VIRTUAL_HEIGHT / 2 - ENEMY_HEIGHT/2 - BAR_Y_OFFSET)
end

function Enemy:take_damage(ammount)
    self.health = self.health - ammount
end

function Enemy:scale_max_hp(level)
    self.max_health = 10
    for _=1, level - 1 do
        self.max_health = self.max_health * 1.2
    end
    self.max_health = math.floor(self.max_health)
end

function  Enemy:scale_damage(level)
    self.damage = 5
    for _=1 , level - 1 do
        self.damage = self.damage * 1.1
    end
    self.damage = math.floor(self.damage)
end

function Enemy:calculate_x_offset()
    for i=1, self.slot - 1 do
        self.x = self.x + (self.x/self.slot) * 0.7
    end
end