getgenv().jaybiggay = false
getgenv().jayhacker = false
getgenv().jaypoggers = false
getgenv().jayskill = false
local remotePath = game:GetService("ReplicatedStorage")

function autoGetCoins()
    spawn(function()
        game:GetService"RunService".RenderStepped:Connect(function()
            if jaybiggay then
                local args = {
                    [1] = 1
                }
                
                remotePath.CoinToPlayer:FireServer(unpack(args))
            end
        end)
    end)
end 
function autoSell()
    spawn(function()
        game:GetService"RunService".RenderStepped:Connect(function()
            if jayhacker then
                remotePath.Remotes.Sell:FireServer()
            end
        end)
    end)
end

function autoBuyEgg()
    spawn(function()
        game:GetService"RunService".RenderStepped:Connect(function()
            if jaypoggers then
                local args = {
                    [1] = 1
                }
                
                remotePath.Remotes.BuyPets:InvokeServer(unpack(args))
            end
        end)
    end)
end

function autoUseSkill()
    spawn(function()
        game:GetService"RunService".RenderStepped:Connect(function()
            if jayskill then
                local args = {
                    [1] = "Speed"
                }
                remotePath.Remotes.Skill:FireServer(unpack(args))
            end
        end)
    end)
end

function teleportAmongus(yes)
    local gamer = game.Players.LocalPlayer
    if gamer.Character then
        gamer.Character.HumanoidRootPart.CFrame = yes
    end
end

function teleportAmongusPlace(place)
    if game:GetService("Workspace").TP:FindFirstChild(place) then
        teleportAmongus(game:GetService("Workspace").TP[place].CFrame)
    end
end
        


local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("coins simulator i guess")

local b = w:CreateFolder("Autofarm")

local c = w:CreateFolder("Teleport")

local d = w:CreateFolder("made by muffin")

b:Toggle("Auto Coins",function(bool)
    getgenv().jaybiggay = bool
    if bool then
        autoGetCoins()
    end
end)

b:Toggle("Auto Sell",function(bool)
    getgenv().jayhacker = bool
    if bool then
        autoSell()
    end
end)

b:Toggle("Auto Buy Eggs",function(bool)
    getgenv().jaypoggers = bool
    if bool then
        autoBuyEgg()
    end
end)

b:Toggle("AutoSkill",function(bool)
    getgenv().jayskill = bool
    if bool then
        autoUseSkill()
    end
end)

local thereisajayamongus

c:Dropdown("select place",{"2","3","4","5","6","7","8","9","10","11","12","13","14"},true,function(gayjay)
    thereisajayamongus = gayjay
end)

c:Button("teleport to selected",function()
    teleportAmongusPlace(thereisajayamongus)
end)




b:DestroyGui()

-- b:Button("Button",function()
    
-- end)

-- b:Toggle("Toggle",function(bool)
--     shared.toggle = bool
--     print(shared.toggle)
-- end)

-- b:Slider("Slider",{
--     min = 10; -- min value of the slider
--     max = 50; -- max value of the slider
--     precise = true; -- max 2 decimals
-- },function(value)
--     print(value)
-- end)

-- b:Dropdown("Dropdown",{"A","B","C"},true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
--     print(mob)
-- end)

-- b:Bind("Bind",Enum.KeyCode.C,function() --Default bind
--     print("Yes")
-- end)

-- b:ColorPicker("ColorPicker",Color3.fromRGB(255,0,0),function(color) --Default color
--     print(color)
-- end)

-- b:Box("Box","number",function(value) -- "number" or "string"
--     print(value)
-- end)

-- --[[
-- How to refresh a dropdown:
-- 1)Create the dropdown and save it in a variable
-- local yourvariable = b:Dropdown("Hi",yourtable,function(a)
--     print(a)
-- end)
-- 2)Refresh it using the function
-- yourvariable:Refresh(yourtable)
-- How to refresh a label:
-- 1)Create your label and save it in a variable
-- local yourvariable = b:Label("Pretty Useless NGL",{
--     TextSize = 25; -- Self Explaining
--     TextColor = Color3.fromRGB(255,255,255);
--     BgColor = Color3.fromRGB(69,69,69);
-- })
-- 2)Refresh it using the function
-- yourvariable:Refresh("Hello") It will only change the text ofc
-- ]]
            
