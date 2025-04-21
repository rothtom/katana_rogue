Button = Class{}

function Button:init(text, x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.text = text
end

function Button:render()
    love.graphics.setFont(gFonts["buttons"])
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(52, 52, 52, 255)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)

    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.printf(self.text, self.x, self.y, self.width, "center")
end

function Button:isHovered()
    local mx, my = push:toGame(love.mouse.getPosition())
    return mx > self.x and mx < self.x + self.width and
           my > self.y and my < self.y + self.height
end

function Button:isClicked()
    return self:isHovered() and love.mouse.isDown(1)
end
