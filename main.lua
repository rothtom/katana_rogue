require "src/Dependencies"

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = false,
        pixelperfect = true,
    })

    love.window.setTitle("Katana Rogue")

    gFonts = {
        ["heading"] = love.graphics.newFont("fonts/font.ttf", 34),
        ["normal"] = love.graphics.newFont("fonts/font.ttf", 14),
        ["small"] = love.graphics.newFont("fonts/font.ttf", 8),
        ["buttons"] = love.graphics.newFont("fonts/font.ttf", 24)
    }

    gImages = {
        ["playBackground"] = love.graphics.newImage("sprites/background.png"),
        ["playerSprite"] = love.graphics.newImage("sprites/player.png"),
        ["enemie"] = love.graphics.newImage("sprites/enemie.png")
    }
    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end,
        ['pick_levelup'] = function() return PickLevelUpState() end,
        --[[
        ['serve'] = function() return ServeState() end,
        ['game-over'] = function() return GameOverState() end,
        ['victory'] = function() return VictoryState() end,
        ['high-scores'] = function() return HighScoreState() end,
        ['enter-high-score'] = function() return EnterHighScoreState() end,
        ['paddle-select'] = function() return PaddleSelectState() end
        ]]-- 
    }

    local ButtonWidth = 125
    local ButtonHeight = 25
    gStateMachine:change('start', {
        PlayButton = PlayButton("Play", VIRTUAL_WIDTH / 2 - ButtonWidth / 2, VIRTUAL_HEIGHT - 5 * ButtonHeight, ButtonWidth, ButtonHeight),
        SettingsButton = SettingsButton("Settings", VIRTUAL_WIDTH / 2 - ButtonWidth / 2, VIRTUAL_HEIGHT - 3.5 * ButtonHeight, ButtonWidth, ButtonHeight),
        ExitButton = ExitButton("Exit", VIRTUAL_WIDTH/ 2 - ButtonWidth / 2, VIRTUAL_HEIGHT- 2 * ButtonHeight, ButtonWidth, ButtonHeight)
    })
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.update(dt)
    gStateMachine:update(dt)
end

function love.draw()
    push:apply("start")
    gStateMachine:render()
    push:apply("end")
end