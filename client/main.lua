local MinigameState = {
	finished = true,
	success = false
}

function sendAction(app, action, payload) 
    SendNUIMessage({
        event = "sendAppEvent",
        app = app,
        action = action,
        payload = payload
    })
end

RegisterNUICallback("setStatus", function(data, cb)
    local status = data.status
	SetNuiFocus(false, false)
	MinigameState.finished = true
	MinigameState.success = status
    cb('ok')
end)

function startMinigame(gameName, options)
    if not MinigameState.finished then
        return false
    end

    options = options or {}    
	MinigameState.finished = false
	MinigameState.success = false
	SetNuiFocus(true, true)
    sendAction(gameName, "setOptions", options)
    SendNUIMessage({
        event = 'setCurrentGame',
        game = gameName,
    })

	while not MinigameState.finished do
		Citizen.Wait(0)
	end

	return MinigameState.success
end

function stopMinigame()
	SetNuiFocus(false, false)
	if not MinigameState.finished then
		SendNUIMessage({
			event = 'setCurrentGame',
            game = nil,
		})
		MinigameState.success = false
		MinigameState.finished = true

        return true
	end

    return false
end

exports("StartMinigame", function(gameName, options)
	return startMinigame(gameName, options)
end)

exports("StopMinigame", function()
	return stopMinigame()
end)

RegisterNUICallback("arrowClicker:finishGame", function(data, cb)
    TriggerEvent("arrowClicker:onGameFinish", data.gameNumber)
    cb('ok')
end)

local MinigameState = {
	finished = true,
	success = false
}

function sendAction(app, action, payload) 
    SendNUIMessage({
        event = "sendAppEvent",
        app = app,
        action = action,
        payload = payload
    })
end

RegisterNUICallback("setStatus", function(data, cb)
    local status = data.status
	SetNuiFocus(false, false)
	MinigameState.finished = true
	MinigameState.success = status
    cb('ok')
end)

function startMinigame(gameName, options)
    if not MinigameState.finished then
        return false
    end

    options = options or {}    
	MinigameState.finished = false
	MinigameState.success = false
	SetNuiFocus(true, true)
    sendAction(gameName, "setOptions", options)
    SendNUIMessage({
        event = 'setCurrentGame',
        game = gameName,
    })

	while not MinigameState.finished do
		Citizen.Wait(0)
	end

	return MinigameState.success
end

function stopMinigame()
	SetNuiFocus(false, false)
	if not MinigameState.finished then
		SendNUIMessage({
			event = 'setCurrentGame',
            game = nil,
		})
		MinigameState.success = false
		MinigameState.finished = true

        return true
	end

    return false
end

exports("StartMinigame", function(gameName, options)
	return startMinigame(gameName, options)
end)

exports("StopMinigame", function()
	return stopMinigame()
end)

RegisterNUICallback("arrowClicker:finishGame", function(data, cb)
    TriggerEvent("arrowClicker:onGameFinish", data.gameNumber)
    cb('ok')
end)

RegisterCommand('arrowclicker', function()
    local result = exports["j0-minigame"]:StartMinigame("arrowClicker", options)
    if result then
        print("Success")
    else
        print("Fail")
    end
end)

RegisterCommand('minesweeper', function()
    local result = exports["j0-minigame"]:StartMinigame("mineSweeper", options)
    if result then
        print("Success")
    else
        print("Fail")
    end
end)

RegisterCommand('shoplockpick', function()
    local result = exports["j0-minigame"]:StartMinigame("shopLockpick", options)
    if result then
        print("Success")
    else
        print("Fail")
    end
end)

RegisterCommand('flappybird', function()
    local result = exports["j0-minigame"]:StartMinigame("flappyBird", options)
    if result then
        print("Success")
    else
        print("Fail")
    end
end)

RegisterCommand('jigsawpuzzle', function()
    local result = exports["j0-minigame"]:StartMinigame("jigsawPuzzle", options)
    if result then
        print("Success")
    else
        print("Fail")
    end
end)

RegisterCommand('aimlab', function()
    local result = exports["j0-minigame"]:StartMinigame("aimLab", options)
    if result then
        print("Success")
    else
        print("Fail")
    end
end)

RegisterCommand('knobturning', function()
    local result = exports["j0-minigame"]:StartMinigame("knobTurning", options)
    if result then
        print("Success")
    else
        print("Fail")
    end
end)

RegisterCommand('lettersfall', function()
    local result = exports["j0-minigame"]:StartMinigame("lettersFall", options)
    if result then
        print("Success")
    else
        print("Fail")
    end
end)

RegisterCommand('cableconnect', function()
    local result = exports["j0-minigame"]:StartMinigame("cableConnect", options)
    if result then
        print("Success")
    else
        print("Fail")
    end
end)

RegisterCommand('traceShape', function()
    local result = exports["j0-minigame"]:StartMinigame("traceShape", options)
    if result then
        print("Success")
    else
        print("Fail")
    end
end)
