PlayButton = Class{__includes = Button}

function PlayButton:update(dt)
    if self:isClicked() then
        sword = Sword({
            ["damage"] = 2,
            ["cooldown_reduction"] = 0,
        })
        attacks = {
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
        
        }
        player = Player({
            max_health = 10,
            health = 10,
            strength = 1,
            },
            1 -- round
        )
        gStateMachine:change("play", {
            ["enemies"] = create_enemies(1),
        })
    end
end