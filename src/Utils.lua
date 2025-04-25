function create_enemies()
    local enemies = {}
    for i=1, linear_enemy_count() do
        table.insert(enemies, Enemy(
            linear_enemy_level(),
            i
        ))
    end
    return enemies
end


function linear_enemy_level()
    -- return math.floor(0.5 * round + 1)
    return round
end

function exponential_enemy_level()
    return math.floor(math.exp(math.floor(0.5 * round)))
end

function linear_enemy_count()
    return math.floor(0.5 * round + 1)
end

function exponential_enemy_count()
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

function calculate_price(base_price, round)
    for _=1, round do
        base_price = base_price * 1.1
    end
    return base_price
end

function scale_gold()
    local gold = BASE_REWARDS["gold"]
    for _=1, round-1-1 do
        gold = gold * 1.15
    end
    return math.ceil(gold)
end

function make_divisible_by(value, fractor)
    return value - (value % fractor)
end


function calculate_reroll_price()
    return BASE_REROLL_PRICE + (round * BASE_REROLL_PRICE * 0.1)
end