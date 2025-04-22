Enemie = Class{}

local BAR_WIDTH = 96 * (2/3)
local BAR_HEIGHT = 12
local ENEMY_WIDTH = 96
local ENEMY_HEIGHT = 128
local BAR_Y_OFFSET = 15


function Enemie:init(stats)
    self.max_health = stats.max_health
    self.health = stats.health or stats.max_health
    self.damage = stats.damage
end

function Enemie:render()
    local x = VIRTUAL_WIDTH / 2 - BAR_WIDTH/2
    local y = VIRTUAL_HEIGHT / 2 - ENEMY_HEIGHT/2 - BAR_Y_OFFSET

    love.graphics.setColor(gColors["light_grey1"])
    love.graphics.rectangle("line", x, y, BAR_WIDTH, BAR_HEIGHT)

    love.graphics.setColor(gColors["red"])
    love.graphics.rectangle("fill", x, y + 1, BAR_WIDTH * (self.health/self.max_health), BAR_HEIGHT - 1)

    love.graphics.setColor(gColors["dark_grey"])
    love.graphics.rectangle("fill", x + BAR_WIDTH * (self.health / self.max_health), y + 1, BAR_WIDTH * ((self.max_health - self.health)/self.max_health), BAR_HEIGHT - 1)


    love.graphics.setFont(gFonts["small"])
    love.graphics.setColor(gColors["white"])
    love.graphics.printf(self.health .. "/" .. self.max_health, x, y + 2, BAR_WIDTH,"center")

    love.graphics.setColor(1,1,1,1)
    love.graphics.draw(gImages["enemie"], VIRTUAL_WIDTH / 2 - ENEMY_WIDTH/2, VIRTUAL_HEIGHT / 2 - ENEMY_HEIGHT/2)
    
end

function Enemie:take_damage(ammount)
    self.health = self.health - ammount
end