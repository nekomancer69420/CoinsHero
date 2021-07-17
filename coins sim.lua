getgenv().jaybiggay = false -- global variable we have set to true
getgenv().jayhacker = false
getgenv().jaypoggers = false
getgenv().jayskill = false
local remotePath = game:GetService("ReplicatedStorage") -- variable that remembers so later we can make neat script

function autoGetCoins()
    spawn(function()
        while wait() do
            if jaybiggay then
                local args = {
                    [1] = 1
                }
                
                remotePath.CoinToPlayer:FireServer(unpack(args))
            end
        end
    end) --  now it has stopped as we have set it to false and this scroipt only runs if jaybiggay is true
end   
function autoSell() -- what a function is is similar to a variable it remembers what we put in it
    spawn(function() -- spawn function lets us run both at the same time if we dont have spawn function the script will only run the first one
        while wait() do --  another loop
            if jayhacker then --  check again
                remotePath.Remotes.Sell:FireServer() -- remotepath is this variable from above
            end
        end
    end)
end -- now lets rerun it with all our changes

function autoBuyEgg()
    spawn(function()
        while wait() do
            if jaypoggers then
                local args = {
                    [1] = 1
                }
                
                remotePath.Remotes.BuyPets:InvokeServer(unpack(args))
            end
        end
    end)
end --  now lets run all of this

function autoUseSkill()
    spawn(function()
        while wait() do
            if jayskill then
                local args = {
                    [1] = "Speed",
                    [2] = "Thunder"
                }
                remotePath.Remotes.Skill:FireServer(unpack(args))
            end
        end
    end)
end -- autoskill

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("coins simulator i guess") -- this is the name of the game we will put here

local b = w:CreateFolder("Autofarm") -- what u want in it idk yoi'll see later

b:Toggle("Auto Coins",function(bool) -- forgot to put in global variable LOL
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
            
