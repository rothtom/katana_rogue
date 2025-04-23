function create_enemies(round)
    local enemies = {}
    for i=1, linear_enemy_count(round) do
        table.insert(enemies, Enemy(
            linear_enemy_level(round),
            i
        ))
    end
    return enemies
end


function linear_enemy_level(round)
    -- return math.floor(0.5 * round + 1)
    return round
end

function exponential_enemy_level(round)
    return math.floor(math.exp(math.floor(0.5 * round)))
end

function linear_enemy_count(round)
    return math.floor(0.5 * round + 1)
end

function exponential_enemy_count(round)
    return math.floor(math.exp(math.floor(0.25 * round)))
end

function getFontHeight(font)
    local unscaled = font:getHeight()
    return get_scaled_height(unscaled)
end

function get_scaled_height(pixels)
    return pixels * push:getHeight() / VIRTUAL_HEIGHT
end

function get_scaled_width(pixels)
    return pixels * push:getWidth() / VIRTUAL_WIDTH
end

