local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/GregBoyTyyuiss/SolarisLib/main/Coding.lua"))()
local plr = game.Players.LocalPlayer
local GC = getconnections or get_signal_cons

local autofarm = false
local v1 = game.ReplicatedStorage:WaitForChild("MoneyData")[plr.Name];
local godmode = false
local whitelist = isfile("mcsowhitelisthub.txt")

if whitelist then
    print("Whitelisted User")
else
    plr:Kick("\nNot Whitelisted")
end


if game.PlaceId == 6570234816 then
    print("Correct Game!")
else
    game:GetService('TeleportService'):Teleport(6570234816, plr)
end

local win = SolarisLib:New({
    Name = "Mano County Roleplay Community | v1.1.0",
    FolderToSave = "Mano County Roleplay Community"
})

 --Stores
local storestab = win:Tab("Stores/Rob")
local banksec = storestab:Section("Bank Section")

--bank stuff

local bankteleport = banksec:Dropdown("Bank Teleportation", {"Bank Outside Teleport","Bank Vault Teleport","Bank Collector Teleport"},"None","Dropdown", function(t)
    if t == "Bank Outside Teleport" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2612.76123046875, 3.8818142414093018, -998.48828125)
        else if t == "Bank Vault Teleport" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2613.52392578125, 3.8818156719207764, -1096.264404296875)
            else if t == "Bank Collector Teleport" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2525.803955078125, 8.92069149017334, 976.87646484375)
            end
        end
    end
 end)

banksec:Button("Rob Bank", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2613.52392578125, 3.8818156719207764, -1096.264404296875)
    while wait(1) do
        if plr.BankStats.CashCollected.Value == 16000 then
            break
        else
            print("Collected: "..plr.BankStats.CashCollected.Value)
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2525.803955078125, 8.92069149017334, 976.87646484375)
end)

local autofarm = banksec:Toggle("Bank AutoFarm", false,"Toggle", function(t)
    if t == true then
        autofarm = true
    else 
        autofarm = false
    end

    while t do
        if autofarm == true then
            if v1.Cash.Value == 100000 then
                if v1.BankAccount.Value == 1000000 then
                    print("We have cancelled the deposit because your bank is at 1,000,000 and wallet is at 100,000! | Turned auto farm off too!")
                    autofarm = false
                    break
                else
                    local args = {
                        [1] = "Deposit",
                        [2] = 100000
                    }
                        
                    game:GetService("ReplicatedStorage").ATMAction:FireServer(unpack(args))
                    print("Deposited 100k into your bank account!")
                end
            end

            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2613.52392578125, 3.8818156719207764, -1096.264404296875)
            wait(0.5)
            plr.Character.Humanoid.Jump = true
            while wait(1) do
                if plr.BankStats.CashCollected.Value == 16000 then
                    break
                else if plr.BankStats.Robbing.Value == false then
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2613.52392578125, 3.8818156719207764, -1096.264404296875)
                    else
                        print("Collected: "..plr.BankStats.CashCollected.Value)
                    end
                end
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2525.803955078125, 8.92069149017334, 976.87646484375)

            if v1.Cash.Value == 100000 then
                if v1.BankAccount.Value == 1000000 then
                    print("We have cancelled the deposit because your bank is at 1,000,000 and wallet is at 100,000! | Turned auto farm off too!")
                    autofarm = false
                    break
                else
                    local args = {
                        [1] = "Deposit",
                        [2] = 100000
                    }
                        
                    game:GetService("ReplicatedStorage").ATMAction:FireServer(unpack(args))
                    print("Deposited 100k into your bank account!")
                end
            end
            
            wait(1)
        else
            break
        end
    end
 end)

--teleportation stuff
local teleportationtab = win:Tab("Teleportation")
local teleportssec = teleportationtab:Section("Teleportation Section")

teleportssec:Button("Car Spawner Teleport", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-71.034423828125, 3.9207465648651123, 1999.6982421875)
end)

teleportssec:Button("Gas Station Teleport", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2589.451904296875, 4.575710773468018, -1840.517822265625)
end)

teleportssec:Button("ATM Teleport", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1648.184326171875, 3.899350881576538, 434.3667297363281)
end)

teleportssec:Button("Spawn Teleport", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.6298978924751282, 3.9207122325897217, 2155.157470703125)
end)

teleportssec:Button("Dealership Teleport", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-112.03702545166016, 4.162395000457764, 2060.332763671875)
end)

teleportssec:Textbox("Teleport to Player", true, function(t)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[t].Character.HumanoidRootPart.CFrame
end)

--Banking
local moneytab = win:Tab("Banking/Money")
local atmsec = moneytab:Section("ATM Section")
local purchasesec = moneytab:Section("Purchase Section")

atmsec:Textbox("Withdraw Cash", true, function(t)
    local args = {
        [1] = "Withdraw",
        [2] = tonumber(t)
    }
    
    game:GetService("ReplicatedStorage").ATMAction:FireServer(unpack(args))
 end)

atmsec:Textbox("Deposit Cash", true, function(t)
    local args = {
        [1] = "Deposit",
        [2] = tonumber(t)
    }
    
    game:GetService("ReplicatedStorage").ATMAction:FireServer(unpack(args))
end)

local weapons = purchasesec:Dropdown("Weapons", {"AK47 | 2500$", "Glock 19 | 1200$", "Colt Python | 1750$", "Bullet Proof Vest | 3200$"},"None","Dropdown", function(t)
    if t == "AK47 | 2500$" then
        local args = {
            [1] = "AK47(LEGAL)",
            [2] = 2500,
            [3] = "Cash"
        }
        
        game.Workspace.DealersScript.BuyItem:InvokeServer(unpack(args))      
        else if t == "Glock 19 | 1200$" then
            local args = {
                [1] = "Glock19(LEGAL)",
                [2] = 1200,
                [3] = "Cash"
            }
            
            workspace.DealersScript.BuyItem:InvokeServer(unpack(args))    
            else if t == "Colt Python | 1750$" then
                local args = {
                    [1] = "ColtPython(LEGAL)",
                    [2] = 1750,
                    [3] = "Cash"
                }
                
                workspace.DealersScript.BuyItem:InvokeServer(unpack(args))
                else if t == "Bullet Proof Vest | 3200$" then
                    game:GetService("ReplicatedStorage").BuyVest:FireServer()
                end
            end      
        end
    end
end)

local HeavyDuty = purchasesec:Dropdown("Heavy Weapons", {"BFG-50 | 10,000$", "Shotgun | 5000$"},"None","Dropdown", function(t)
    if t == "BFG-50 | 10,000$" then
        local args = {
            [1] = "BFG-50(LEGAL)",
            [2] = 10000,
            [3] = "Cash"
        }
        
        workspace.DealersScript.BuyItem:InvokeServer(unpack(args))         
        else if t == "Shotgun | 5000$" then
            local args = {
                [1] = "Shotgun(LEGAL)",
                [2] = 5000,
                [3] = "Cash"
            }
            
            workspace.DealersScript.BuyItem:InvokeServer(unpack(args))            
        end    
    end
end)

local equipment = purchasesec:Dropdown("Equipment", {"Crowbar | 600$", "Hammer | 500$", "Gas Can | 200$", "Drill | 500$"},"None","Dropdown", function(t)
    if t == "Crowbar | 600$" then
        local args = {
            [1] = "Crowbar",
            [2] = 600,
            [3] = "Cash"
        }
        
        workspace.DealersScript.BuyItem:InvokeServer(unpack(args))
        else if t == "Hammer | 500$" then
            local args = {
                [1] = "Hammer",
                [2] = 500,
                [3] = "Cash"
            }
            
            workspace.DealersScript.BuyItem:InvokeServer(unpack(args))
            else if t == "Gas Can | 200$" then
                local args = {
                    [1] = "Gas Can",
                    [2] = 250,
                    [3] = "Cash"
                }
                
                workspace.DealersScript.BuyItem:InvokeServer(unpack(args))
                else if t == "Drill | 500$" then
                    local args = {
                        [1] = "Drill",
                        [2] = 500,
                        [3] = "Cash"
                    }
                    
                    workspace.DealersScript.BuyItem:InvokeServer(unpack(args))                    
                end                
            end            
        end
    end
end)

 --Player
local playertab = win:Tab("Player")
local wantedsec = playertab:Section("Wanted Stuff - Wait a few seconds for it to work")
local playerconfigsec = playertab:Section("Player Configuration")
local miscsec = playertab:Section("Other Stuff")

wantedsec:Button("Remove Wanted", function()
    plr.WANTED.Value = false
end)

wantedsec:Button("Give Wanted", function()
    plr.WANTED.Value = true
end)

--Player Configuration

local playerconfigtoggle = playerconfigsec:Toggle("God Mode/Invisible", false,"Toggle", function(t)
    if t then
        fireclickdetector(game:GetService("Workspace").ATMs["ATM(Bank Nonerobbable)"].GuiGiver.ClickDetector)
        wait(.5)
        plr.Character.HumanoidRootPart.Anchored = false
        plr.PlayerGui.ATMGui.Enabled = false
        godmode = true
        else if t == false and godmode == true then
            plr.PlayerGui.ATMGui.Enabled = true
            godmode = false
        end
    end
end)

local Walkspeedtoggle = playerconfigsec:Toggle("Toggle WalkSpeed", false,"Toggle", function(t)
    if plr.Character.Humanoid.WalkSpeed == 16 and t == true then
        plr.Character.Humanoid.WalkSpeed = 40
        else if plr.Character.Humanoid.WalkSpeed == 40 and t == false then
            plr.Character.Humanoid.WalkSpeed = 40
        end
    end
end)

playerconfigsec:Button("Respawn", function()
    plr.Character.Humanoid.Health = 0
 end)

--Misc
miscsec:Button("Anti AFK", function()
    if GC then
		for i,v in pairs(GC(Players.LocalPlayer.Idled)) do
			if v["Disable"] then
				v["Disable"](v)
			elseif v["Disconnect"] then
				v["Disconnect"](v)
			end
		end
    end
end)

--Trolling
local trollingtab = win:Tab("Trolling")
local blatantsec = trollingtab:Section("Blatant Trolling")

local radioflood = false

local radiospammer = blatantsec:Toggle("Radio Flooder", false,"Toggle", function(t)
    if t then
        radioflood = true
        while radioflood do
            wait(0.1)
            local args = {
                [1] = "Flood",
                [2] = "Flooding Radio Calls"
            }
            
            game:GetService("ReplicatedStorage"):FindFirstChild("911Call"):FireServer(unpack(args))            
        end
    else
        radioflood = false
    end
end)

blatantsec:Button("Admin Radio", function()
    game:GetService("Teams")["Department of Transportation"].Radio:Clone().Parent = plr.Backpack
end)


--Updates
local updatetab = win:Tab("Change Log")
local newupdatessec = updatetab:Section("New Changes")
local oldchanges = updatetab:Section("Old Changes")

--New Changes
local whitelist = newupdatessec:Label("-Added Whitelist System")
local adminradio = newupdatessec:Label("-Added Admin Radio to Trolling")
local radioflooder = newupdatessec:Label("-Added Radio Flooder & Trolling Tab!")
local carspawner = newupdatessec:Label("-Added Car Spawner Teleport!")
local respawn = newupdatessec:Label("-Added Respawn to Player Configuration")
local walkspeedupdate = newupdatessec:Label("-Added Walkspeed Toggle to Player Configuration")

--Old Changes
local heavyequipment = oldchanges:Label("-Added Heavy Equipment to Bank/Money!")
local antiafk = oldchanges:Label("-Added Anti AFK in the player section!")
local godmode = oldchanges:Label("-Added God Mode in the player section!")
local bankdetection = oldchanges:Label("-If you die or go to jail during rob it tps you back!")
local wantedleveladded = oldchanges:Label("-Added Remove Wanted/Give Wanted")
local autofarm = oldchanges:Label("-Added Bank AutoFarm")
local updatesectionadded = oldchanges:Label("-Update Section Added!")
local bankteleportdropdown = oldchanges:Label("-Changed the Bank Teleport buttons to a single dropdown!")
local gasstationequipment = oldchanges:Label("-Added Gas Station stuff in Banking/Money!")
