ShopItem = Class{}


local ITEM_WIDTH = make_divisible_by(VIRTUAL_WIDTH * (3/4) / 4, 8)
local MARGIN_X = ITEM_WIDTH / 4
local PADDING_X = 5
local ITEM_HEIGHT = make_divisible_by(VIRTUAL_HEIGHT * (2/3), 8)
local PADDING_Y = 5
local IMG_SIZE = 32 --(ITEM_WIDTH - PADDING_X * 2) / 2
local STAT_LINE_HEIGHT = 8
local STAT_LINE_WIDTH = ITEM_WIDTH - (PADDING_X * 2)
local STAT_LINE_MARGIN = 2

function ShopItem:init(params)
    self.name = params.name
    self.targets = params.targets or {}
    self.modifiers = params.stats
    self.ammount = params.ammount or 1
    self.base_price = params.base_price
    self.price = calculate_price(self.base_price, round)
    self.slot = params.slot

    self.x = MARGIN_X + ((ITEM_WIDTH + MARGIN_X) * (self.slot - 1))
    self.y = (VIRTUAL_HEIGHT - ITEM_HEIGHT) / 2

    self.statbox_x = self.x + PADDING_X
    self.statbox_y =  self.y + PADDING_Y + IMG_SIZE + PADDING_Y

    self.img = params.img
    self.lifted = false
    
    self.bought = false
end

function ShopItem:update(dt)
    if not love.mouse.isDown(1) then
        self.lifted = true
    end

    if self:isClicked() and self.lifted then
        --[[
        self:apply()
        gStateMachine:change("play", {
            ["enemies"] = create_enemies()
        })
        ]]--
        self:apply()
        self.bought = true
    end
end

function ShopItem:apply()
    for _=1, self.ammount do
        for _, target in pairs(self.targets) do
            target:apply(self.modifiers)
        end
    end
end

function ShopItem:render()
    --[[
    if self.bought then
        return
    end
    ]]--f
    love.graphics.setColor(gColors["light_grey2"])
    love.graphics.rectangle("line", self.x, self.y, ITEM_WIDTH, ITEM_HEIGHT - 20)

    love.graphics.setColor(gColors["light_grey1"])
    love.graphics.rectangle("fill", self.x, self.y + 1, ITEM_WIDTH, ITEM_HEIGHT - 20 - 1)

    love.graphics.setColor(gColors["dark_grey"])
    love.graphics.setFont(gFonts["small"])
    love.graphics.printf(self.name, self.x + PADDING_X, self.y + PADDING_Y, IMG_SIZE, "left")

    love.graphics.setColor(1,1,1,1)
    if self.img then
        love.graphics.draw(self.img, self.x + PADDING_X + IMG_SIZE, self.y + PADDING_Y)
    end

    love.graphics.rectangle("line", self.x + ITEM_WIDTH - IMG_SIZE - PADDING_Y, self.y + PADDING_Y, IMG_SIZE, IMG_SIZE)
    
    --[[
    love.graphics.setColor(gColors["white"])
    love.graphics.rectangle("line", self.statbox_x, self.statbox_y, STAT_LINE_WIDTH, STAT_LINE_MARGIN + ((STAT_LINE_HEIGHT + STAT_LINE_MARGIN) * #self.modifiers))

    love.graphics.setColor(gColors["dark_grey"])
    love.graphics.rectangle("fill", self.statbox_x, self.statbox_y, STAT_LINE_WIDTH, STAT_LINE_MARGIN + ((STAT_LINE_HEIGHT + STAT_LINE_MARGIN) * #self.modifiers))
    ]]--
    local stat_num = 1
    for stat, ammount in pairs(self.modifiers) do
        love.graphics.setColor(gColors["white"])
        love.graphics.rectangle("line", self.statbox_x, self.statbox_y + ((stat_num - 1) * (STAT_LINE_HEIGHT + STAT_LINE_MARGIN)), 
                                STAT_LINE_WIDTH, STAT_LINE_HEIGHT)

        love.graphics.setColor(gColors["grey"])
        love.graphics.rectangle("fill", self.statbox_x, self.statbox_y + ((stat_num - 1) * (STAT_LINE_HEIGHT + STAT_LINE_MARGIN)) + 1,
                                STAT_LINE_WIDTH, STAT_LINE_HEIGHT - 1)

        love.graphics.setColor(1,1,1,1)
        --love.graphics.printf(gStatToName[stat], self.x)
        
        stat_num = stat_num + 1
    end

    love.graphics.setColor(1,1,1,1)
end

function ShopItem:isHovered()
    local mx, my = push:toGame(love.mouse.getPosition())
    return mx > self.x and mx < self.x + ITEM_WIDTH and
           my > self.y and my < self.y + ITEM_HEIGHT
end

function ShopItem:isClicked()
    return self:isHovered() and love.mouse.isDown(1)
end
