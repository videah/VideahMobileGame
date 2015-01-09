options = {}
options.resolutions = {}

function options.load()

	options.applySettings()

	ui.createButton("back", 200, 200, 290, 100, nil, function() state:changeState("menu") end, "options")

end

function options.applySettings()

	options.resolutions[#options.resolutions+1] = "1200x768"
	options.resolutions[#options.resolutions+1] = "1200x900"
	options.resolutions[#options.resolutions+1] = "1280x1024"
	options.resolutions[#options.resolutions+1] = "1440x900"
	options.resolutions[#options.resolutions+1] = "1680x1050"
	options.resolutions[#options.resolutions+1] = "1600x900"
	options.resolutions[#options.resolutions+1] = "1600x1200"
	options.resolutions[#options.resolutions+1] = "1366x768"
	options.resolutions[#options.resolutions+1] = "1920x1200"
	options.resolutions[#options.resolutions+1] = "2560x1600"
	options.resolutions[#options.resolutions+1] = "1280x720"
	options.resolutions[#options.resolutions+1] = "1920x1080"
	options.resolutions[#options.resolutions+1] = "2560x1440"
	options.resolutions[#options.resolutions+1] = "2560x1600"


	if love.filesystem.exists("cfg/settings.ini") == false then
        local defaultSettings = 
        {
            settings = 
            {
                vsync = true,
                resolutionwidth = 1280,
                resolutionheight = 720,
                fullscreen = false,
                borderless = true,
                debug = false,
            },
        };

        LIP.save("cfg/settings.ini", defaultSettings)
    end

    options.settings = LIP.load('cfg/settings.ini');

    love.window.setMode(options.settings.settings.resolutionwidth, options.settings.settings.resolutionheight, {vsync = options.settings.settings.vsync, fullscreen = options.settings.settings.fullscreen, borderless = options.settings.settings.borderless})

    options.resize()

end


function options.resize()

	global.screenWidth = love.graphics.getWidth()
	global.screenHeight = love.graphics.getHeight()

	global.centerWidth = (global.screenWidth / 2) * camera.scale
	global.centerHeight = (global.screenHeight / 2) * camera.scale

end

function options.draw()

end