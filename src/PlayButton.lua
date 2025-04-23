PlayButton = Class{__includes = Button}

function PlayButton:update(dt)
    if self:isClicked() then
        player = Player({
            max_health = 10,
            health = 10,
            },
            nil, -- sword
                {
                    ["q"] = Attack({
                        ["damage"] = 50,
                        ["duration"] = 1,
                        ["cooldown"] = 2,
                    },
                    "q"    
                ),
                    ["w"] = Attack({
                        ["damage"] = 50,
                        ["duration"] = 1,
                        ["cooldown"] = 2,
                    },
                    "w" 
                ),
                    ["e"] = Attack({
                        ["damage"] = 50,
                        ["duration"] = 1,
                        ["cooldown"] = 2,
                    },
                    "e"  
                ),
                    ["r"] = Attack({
                        ["damage"] = 50,
                        ["duration"] = 1,
                        ["cooldown"] = 2,
                    },
                    "r"
                ),
                
                },
                1 -- round
        )
        gStateMachine:change("play", {
            ["enemies"] = create_enemies(1),
        })
    end
end