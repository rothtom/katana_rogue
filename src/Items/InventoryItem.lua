InventoryItem = Class{}

local ITEMS_PER_ROW = 10
local IMG_SIZE = 16 --guessing

local MARGIN_Y = 1
local MARGIN_X = 3

function InventoryItem:init(params)
    self.shop_item = params.shop_item

   self.ammount = params.ammount or 1
   self.slot = params.slot

   self.row = math.floor(params.slot / ITEMS_PER_ROW)
   self.collumn = self.slot % ITEMS_PER_ROW

   self.x = MARGIN_X + (IMG_SIZE + MARGIN_X) * self.collumn
   self.y = VIRTUAL_HEIGHT - (MARGIN_Y + IMG_SIZE + MARGIN_Y + (IMG_SIZE + MARGIN_Y) * (self.row))
end

function InventoryItem:update(dt)
    for _=1, self.ammount do

    end
end

function InventoryItem:render()
    love.graphics.setColor(gColors["light_grey1"])
    love.graphics.rectangle("line", self.x, self.y, IMG_SIZE, IMG_SIZE)
end