--Used to smooth and move everything in the game
deltaTime = nil

--Difficulty globals and player save name
gameDifficulty = 1
gameDifficultyNames = {
	"Easy",
	"Medium",
	"Hard",
	"Very Hard",
	"IMPOSSIBLE",
}
playerName = "default"
ammo = 3
lives = 3
entities = {}
entityNumber = 0
mapID = 0

--Dev Vars
gamePaused = false
debugMode = false
musicEnabled = false
soundEnabled = true

--Experimental
limitFPS = false 
slowMo = false
fps = 60

--Fonts
mmainfont = love.graphics.newFont("media/fonts/arial.ttf", 58)
underfont = love.graphics.newFont("media/fonts/arial.ttf", 29)
mainfont = love.graphics.newFont("media/fonts/arial.ttf", 14)

--Sounds
bgm = love.audio.newSource("media/audio/music/shittybackgroundsong.wav", "stream")
hitsound = love.audio.newSource("/media/audio/sfx/enemyhurt.wav", "static")
playerhurtsound = love.audio.newSource("media/audio/sfx/playerhurt.wav", "static")
shootsound = love.audio.newSource("media/audio/sfx/playershoot.wav", "static")
ammopickup = love.audio.newSource("media/audio/sfx/ammocratepickup.wav", "static")


--Other Stuff
keybinds = {
	mright = "d",
	mleft = "a",
	msprint = "lshift",
	dash = "x",
	shoot = "space",
	pause = "escape",
	devmode = "f1",
	changediffleft = "left",
	changediffright = "right",
	exitpause = "1",
}

default_keybinds = {
	mright = "d",
	mleft = "a",
	msprint = "lshift",
	dash = "x",
	shoot = "space",
	pause = "escape",
	devmode = "f1",
	changediffleft = "left",
	changediffright = "right",
	exitpause = "1",
} --In keybind change menu add a button to reset keybinds that sets "keybinds" to this

scores = {
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
}