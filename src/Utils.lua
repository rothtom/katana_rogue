

function create_enemies(round)
    local enemies = {}
    for i=1, linear_enemy_count(round) do
        enemies.insert(Enemie(
            linear_enemy_level(round)
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