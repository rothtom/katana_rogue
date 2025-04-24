Enemy = Class{}

local BAR_WIDTH = 96 * (2/3)
local BAR_HEIGHT = 12
local ENEMY_WIDTH = 96
local ENEMY_HEIGHT = 128
local BAR_Y_OFFSET = 15


function Enemy:init(level, slot)
    self.level = level
    self.stats = {}
    self:scale_max_hp(level)
    self.stats["health"] = self.stats["max_health"]
    self:scale_damage(level)
    self.slot = slot
    self:calculate_position()
    self.next_attack = math.random(0.8, 1.5)
    self.position = "idle"
end

function Enemy:update(dt)
    self.next_attack = self.next_attack - dt
    if self.next_attack <= 0 then
        self:Attack()
        self.next_attack = math.random(0.8, 1.5)
    elseif self.next_attack < 0.3 then
        self:TelegraphAttack()
    end
end

function Enemy:render()
    love.graphics.setColor(gColors["light_grey1"])
    love.graphics.rectangle("line", self.x, self.y, BAR_WIDTH, BAR_HEIGHT)

    love.graphics.setColor(gColors["red"])
    love.graphics.rectangle("fill", self.x + 1, self.y, math.floor(BAR_WIDTH * (self.stats["health"]/self.stats["max_health"]) - 1), BAR_HEIGHT)

    love.graphics.setColor(gColors["dark_grey"])
    love.graphics.rectangle("fill", self.x + BAR_WIDTH * (self.stats["health"] / self.stats["max_health"]), self.y + 1, BAR_WIDTH * ((self.stats["max_health"] - self.stats["health"])/self.stats["max_health"]), BAR_HEIGHT - 1)


    love.graphics.setFont(gFonts["small"])
    love.graphics.setColor(gColors["white"])
    love.graphics.printf(self.stats["health"] .. "/" .. self.stats["max_health"], self.x, self.y + 2, BAR_WIDTH,"center")

    love.graphics.setColor(1,1,1,1)
    love.graphics.draw(gImages["enemie"], self.x - ((ENEMY_WIDTH - BAR_WIDTH) / 2), VIRTUAL_HEIGHT / 2 - ENEMY_HEIGHT/2)
    
end

function Enemy:TelegraphAttack()
    self.position = "telegraph"
end

function Enemy:Attack()
    self.position = "attack"
    player:take_damage(self.stats["damage"])
end

function Enemy:calculate_position()
    self.x = math.floor(((VIRTUAL_WIDTH / 2) - BAR_WIDTH/2))
    self:calculate_x_offset()
    self.y = math.floor(VIRTUAL_HEIGHT / 2 - ENEMY_HEIGHT/2 - BAR_Y_OFFSET)
end

function Enemy:take_damage(ammount)
    self.stats["health"] = self.stats["health"] - ammount
end

function Enemy:scale_max_hp(level)
    self.stats["max_health"] = 10
    for _=1, level - 1 do
        self.stats["max_health"] = self.stats["max_health"] * 1.2
    end
    self.stats["max_health"] = math.floor(self.stats["max_health"])
end

function  Enemy:scale_damage(level)
    self.stats["damage"] = 5
    for _=1 , level - 1 do
        self.stats["damage"] = self.stats["damage"] * 1.1
    end
    self.stats["damage"] = math.floor(self.stats["damage"])
end

function Enemy:calculate_x_offset()
    for i=1, self.slot - 1 do
        self.x = self.x + (self.x/self.slot) * 0.7
    end
end