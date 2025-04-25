VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

WINDOW_WIDTH = VIRTUAL_WIDTH * 6
WINDOW_HEIGHT = VIRTUAL_HEIGHT * 6

BUTTON_WIDTH = 125
BUTTON_HEIGHT = 25

MARGIN_X = 10
MARGIN_Y = 3

BASE_REROLL_PRICE = 10
BASE_REWARDS = {
    ["gold"] = 10,
}

StatsCap = {
    ["max_health"] = 1000,
    ["strength"] = 100,
    ["damage"] = nil,
    ["cooldown_reduction"] = 0.7,
}

gColors = {
    ["red"] = {1, 0, 68/255, 1},
    ["red2"] = {208/255, 0, 0, 1},
    ["green"] = {2/255, 138/255,16/255, 1},
    ["purple"] = {104/255, 56/255, 108/255, 1},
    ["light_grey1"] = {192/255, 203/255, 220/255, 1},
    ["light_grey2"] = {90/255, 105/255, 136/255, 1},
    ["grey"] = {58/255, 68/255, 102/255, 1},
    ["dark_grey"] = {38/255, 43/255, 68/255, 1},
    ["light_blue"] = {44/255, 232/255, 245/255, 1},
    ["white"] = {1, 1, 1, 1}
}

gAttackMap = {
    ["q"] = 1,
    ["w"] = 2,
    ["e"] = 3,
    ["r"] = 4,
}

gStatToName = {
    ["max_health"] = "Max HP",
    ["health"] = "HP",
    ["damage"] = "Damage",
    ["strength"] = "Strength",
    ["cooldown_reduction"] = "Cooldown Reduction",
    ["cooldown"] = "Cooldown",
    ["duration"] = "Duration",
}

ENEMY_BASE_STATS = {
    ["max_health"] = 10,
    ["damage"] = 5,
}