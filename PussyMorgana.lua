if myHero.charName ~= "Morgana" then return end
class "Morgana"

-- [ AutoUpdate ]
do
    
    local Version = 0.01
    
    local Files = {
        Lua = {
            Path = SCRIPT_PATH,
            Name = "PussyMorgana.lua",
            Url = "https://raw.githubusercontent.com/Pussykate/GoS/master/PussyMorgana.lua"
        },
        Version = {
            Path = SCRIPT_PATH,
            Name = "PussyMorgana.version",
            Url = "https://raw.githubusercontent.com/Pussykate/GoS/master/PussyNeeko.version"
        }
    }
    
    local function AutoUpdate()
        
        local function DownloadFile(url, path, fileName)
            DownloadFileAsync(url, path .. fileName, function() end)
            while not FileExist(path .. fileName) do end
        end
        
        local function ReadFile(path, fileName)
            local file = io.open(path .. fileName, "r")
            local result = file:read()
            file:close()
            return result
        end
        
        DownloadFile(Files.Version.Url, Files.Version.Path, Files.Version.Name)
        local textPos = myHero.pos:To2D()
        local NewVersion = tonumber(ReadFile(Files.Version.Path, Files.Version.Name))
        if NewVersion > Version then
            DownloadFile(Files.Lua.Url, Files.Lua.Path, Files.Lua.Name)
            print("New PussyNeeko Version Press 2x F6")
        else
            print(Files.Version.Name .. ": No Updates Found")
        end
    
    end
    
    AutoUpdate()

end


local CCExceptions = {
	["CamilleEMissile"] = true,
	["HecarimUltMissile"] = true,
	["HowlingGaleSpell"] = true,
	["JhinETrap"] = true,
	["JhinRShotMis"] = true,
	["JinxEHit"] = true,
	["SyndraESphereMissile"] = true,
	["ThreshQMissile"] = true,
}

local CCSpells = {
	["AatroxW"] = {charName = "Aatrox", displayName = "Infernal Chains", slot = _W, origin = "spell", type = "linear", speed = 1800, range = 825, delay = 0.25, radius = 80, collision = true},
	["AhriSeduce"] = {charName = "Ahri", displayName = "Seduce", slot = _E, origin = "spell", type = "linear", speed = 1500, range = 975, delay = 0.25, radius = 60, collision = true},
	["AhriSeduceMissile"] = {charName = "Ahri", displayName = "Seduce [Missile]", slot = _E, origin = "missile", type = "linear", speed = 1500, range = 975, delay = 0.25, radius = 60, collision = true},
	["AkaliR"] = {charName = "Akali", displayName = "Perfect Execution [First]", slot = _R, origin = "spell", type = "linear", speed = 1800, range = 525, delay = 0, radius = 65, collision = false},
	["Pulverize"] = {charName = "Alistar", displayName = "Pulverize", slot = _Q, origin = "spell", type = "circular", speed = MathHuge, range = 0, delay = 0.25, radius = 365, collision = false},
	["BandageToss"] = {charName = "Amumu", displayName = "Bandage Toss", slot = _Q, origin = "spell", type = "linear", speed = 2000, range = 1100, delay = 0.25, radius = 80, collision = true},
	["SadMummyBandageToss"] = {charName = "Amumu", displayName = "Bandage Toss [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 2000, range = 1100, delay = 0.25, radius = 80, collision = true},
	["CurseoftheSadMummy"] = {charName = "Amumu", displayName = "Curse of the Sad Mummy", slot = _R, origin = "spell", type = "circular", speed = MathHuge, range = 0, delay = 0.25, radius = 550, collision = false},
	["FlashFrostSpell"] = {charName = "Anivia", displayName = "Flash Frost",missileName = "FlashFrostSpell", slot = _Q, origin = "both", type = "linear", speed = 850, range = 1100, delay = 0.25, radius = 110, collision = false},
	["EnchantedCrystalArrow"] = {charName = "Ashe", displayName = "Enchanted Crystal Arrow", slot = _R, origin = "both", type = "linear", speed = 1600, range = 25000, delay = 0.25, radius = 130, collision = false},
	["AurelionSolQ"] = {charName = "AurelionSol", displayName = "Starsurge", slot = _Q, origin = "spell", type = "linear", speed = 850, range = 25000, delay = 0, radius = 110, collision = false},
	["AurelionSolQMissile"] = {charName = "AurelionSol", displayName = "Starsurge [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 850, range = 25000, delay = 0, radius = 110, collision = false},
	["AzirR"] = {charName = "Azir", displayName = "Emperor's Divide", slot = _R, origin = "spell", type = "linear", speed = 1400, range = 500, delay = 0.3, radius = 250, collision = false},
	["BardQ"] = {charName = "Bard", displayName = "Cosmic Binding", slot = _Q, origin = "spell", type = "linear", speed = 1500, range = 950, delay = 0.25, radius = 60, collision = true},
	["BardQMissile"] = {charName = "Bard", displayName = "Cosmic Binding [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1500, range = 950, delay = 0.25, radius = 60, collision = true},
	["BardR"] = {charName = "Bard", displayName = "Tempered Fate", slot = _R, origin = "spell", type = "circular", speed = 2100, range = 3400, delay = 0.5, radius = 350, collision = false},
	["BardRMissile"] = {charName = "Bard", displayName = "Tempered Fate [Missile]", slot = _R, origin = "missile", type = "circular", speed = 2100, range = 3400, delay = 0.5, radius = 350, collision = false},
	["RocketGrab"] = {charName = "Blitzcrank", displayName = "Rocket Grab", slot = _Q, origin = "spell", type = "linear", speed = 1800, range = 1050, delay = 0.25, radius = 70, collision = true},
	["RocketGrabMissile"] = {charName = "Blitzcrank", displayName = "Rocket Grab [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1800, range = 1050, delay = 0.25, radius = 70, collision = true},
	["BraumQ"] = {charName = "Braum", displayName = "Winter's Bite", slot = _Q, origin = "spell", type = "linear", speed = 1700, range = 1000, delay = 0.25, radius = 70, collision = true},
	["BraumQMissile"] = {charName = "Braum", displayName = "Winter's Bite [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1700, range = 1000, delay = 0.25, radius = 70, collision = true},
	["BraumR"] = {charName = "Braum", displayName = "Glacial Fissure", slot = _R, origin = "spell", type = "linear", speed = 1400, range = 1250, delay = 0.5, radius = 115, collision = false},
	["BraumRMissile"] = {charName = "Braum", displayName = "Glacial Fissure [Missile]", slot = _R, origin = "missile", type = "linear", speed = 1400, range = 1250, delay = 0.5, radius = 115, collision = false},
	["CaitlynYordleTrap"] = {charName = "Caitlyn", displayName = "Yordle Trap", slot = _W, origin = "spell", type = "circular", speed = MathHuge, range = 800, delay = 0.25, radius = 75, collision = false},
	["CaitlynEntrapment"] = {charName = "Caitlyn", displayName = "Entrapment", slot = _E, origin = "spell", type = "linear", speed = 1600, range = 750, delay = 0.15, radius = 70, collision = true},
	["CassiopeiaW"] = {charName = "Cassiopeia", displayName = "Miasma", slot = _W, origin = "spell", type = "circular", speed = 2500, range = 800, delay = 0.75, radius = 160, collision = false},
	["Rupture"] = {charName = "Chogath", displayName = "Rupture", slot = _Q, origin = "spell", type = "circular", speed = MathHuge, range = 950, delay = 1.2, radius = 250, collision = false},
	["InfectedCleaverMissile"] = {charName = "DrMundo", displayName = "Infected Cleaver", slot = _Q, origin = "both", type = "linear", speed = 2000, range = 975, delay = 0.25, radius = 60, collision = true},
	["DravenDoubleShot"] = {charName = "Draven", displayName = "Double Shot", slot = _E, origin = "spell", type = "linear", speed = 1600, range = 1050, delay = 0.25, radius = 130, collision = false},
	["DravenDoubleShotMissile"] = {charName = "Draven", displayName = "Double Shot [Missile]", slot = _E, origin = "missile", type = "linear", speed = 1600, range = 1050, delay = 0.25, radius = 130, collision = false},
	["EkkoQ"] = {charName = "Ekko", displayName = "Timewinder", slot = _Q, origin = "spell", type = "linear", speed = 1650, range = 1175, delay = 0.25, radius = 60, collision = false},
	["EkkoQMis"] = {charName = "Ekko", displayName = "Timewinder [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1650, range = 1175, delay = 0.25, radius = 60, collision = false},
	["EkkoW"] = {charName = "Ekko", displayName = "Parallel Convergence", slot = _W, origin = "spell", type = "circular", speed = MathHuge, range = 1600, delay = 3.35, radius = 400, collision = false},
	["EkkoWMis"] = {charName = "Ekko", displayName = "Parallel Convergence [Missile]", slot = _W, origin = "missile", type = "circular", speed = MathHuge, range = 1600, delay = 3.35, radius = 400, collision = false},
	["EliseHumanE"] = {charName = "Elise", displayName = "Cocoon", slot = _E, origin = "both", type = "linear", speed = 1600, range = 1075, delay = 0.25, radius = 55, collision = true},
	["FizzR"] = {charName = "Fizz", displayName = "Chum the Waters", slot = _R, origin = "spell", type = "linear", speed = 1300, range = 1300, delay = 0.25, radius = 150, collision = false},
	["FizzRMissile"] = {charName = "Fizz", displayName = "Chum the Waters [Missile]", slot = _R, origin = "missile", type = "linear", speed = 1300, range = 1300, delay = 0.25, radius = 150, collision = false},
	["GalioE"] = {charName = "Galio", displayName = "Justice Punch", slot = _E, origin = "spell", type = "linear", speed = 2300, range = 650, delay = 0.4, radius = 160, collision = false},
	["GnarQMissile"] = {charName = "Gnar", displayName = "Boomerang Throw", slot = _Q, origin = "both", type = "linear", speed = 2500, range = 1125, delay = 0.25, radius = 55, collision = false},
	["GnarBigQMissile"] = {charName = "Gnar", displayName = "Boulder Toss", slot = _Q, origin = "both", type = "linear", speed = 2100, range = 1125, delay = 0.5, radius = 90, collision = true},
	["GnarBigW"] = {charName = "Gnar", displayName = "Wallop", slot = _W, origin = "spell", type = "linear", speed = MathHuge, range = 575, delay = 0.6, radius = 100, collision = false},
	["GnarR"] = {charName = "Gnar", displayName = "GNAR!", slot = _R, origin = "spell", type = "circular", speed = MathHuge, range = 0, delay = 0.25, radius = 475, collision = false},
	["GragasQ"] = {charName = "Gragas", displayName = "Barrel Roll", slot = _Q, origin = "spell", type = "circular", speed = 1000, range = 850, delay = 0.25, radius = 275, collision = false},
	["GragasQMissile"] = {charName = "Gragas", displayName = "Barrel Roll [Missile]", slot = _Q, origin = "missile", type = "circular", speed = 1000, range = 850, delay = 0.25, radius = 275, collision = false},
	["GragasR"] = {charName = "Gragas", displayName = "Explosive Cask", slot = _R, origin = "spell", type = "circular", speed = 1800, range = 1000, delay = 0.25, radius = 400, collision = false},
	["GragasRBoom"] = {charName = "Gragas", displayName = "Explosive Cask [Missile]", slot = _R, origin = "missile", type = "circular", speed = 1800, range = 1000, delay = 0.25, radius = 400, collision = false},
	["GravesSmokeGrenade"] = {charName = "Graves", displayName = "Smoke Grenade", slot = _W, origin = "spell", type = "circular", speed = 1500, range = 950, delay = 0.15, radius = 250, collision = false},
	["GravesSmokeGrenadeBoom"] = {charName = "Graves", displayName = "Smoke Grenade [Missile]", slot = _W, origin = "missile", type = "circular", speed = 1500, range = 950, delay = 0.15, radius = 250, collision = false},
	["HecarimUltMissile"] = {charName = "Hecarim", displayName = "Onslaught of Shadows", slot = _R, origin = "missile", type = "linear", speed = 1100, range = 1650, delay = 0.2, radius = 280, collision = false},
	["HeimerdingerE"] = {charName = "Heimerdinger", displayName = "CH-2 Electron Storm Grenade", slot = _E, origin = "spell", type = "circular", speed = 1200, range = 970, delay = 0.25, radius = 250, collision = false},
	["HeimerdingerESpell"] = {charName = "Heimerdinger", displayName = "CH-2 Electron Storm Grenade [Missile]", slot = _E, origin = "missile", type = "circular", speed = 1200, range = 970, delay = 0.25, radius = 250, collision = false},
	["HeimerdingerEUlt"] = {charName = "Heimerdinger", displayName = "CH-2 Electron Storm Grenade", slot = _E, origin = "spell", type = "circular", speed = 1200, range = 970, delay = 0.25, radius = 250, collision = false},
	["HeimerdingerESpell_ult"] = {charName = "Heimerdinger", displayName = "CH-2 Electron Storm Grenade [Missile]", slot = _E, origin = "missile", type = "circular", speed = 1200, range = 970, delay = 0.25, radius = 250, collision = false},
	["IreliaW2"] = {charName = "Illaoi", displayName = "Defiant Dance", slot = _W, origin = "spell", type = "linear", speed = MathHuge, range = 775, delay = 0.25, radius = 120, collision = false},
	["IreliaR"] = {charName = "Illaoi", displayName = "Vanguard's Edge", slot = _R, origin = "both", type = "linear", speed = 2000, range = 950, delay = 0.4, radius = 160, collision = false},
	["IvernQ"] = {charName = "Illaoi", displayName = "Rootcaller", slot = _Q, origin = "both", type = "linear", speed = 1300, range = 1075, delay = 0.25, radius = 80, collision = true},
	["HowlingGaleSpell"] = {charName = "Janna", displayName = "Howling Gale [1]", slot = _Q, origin = "missile", type = "linear", speed = 667, range = 995, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell2"] = {charName = "Janna", displayName = "Howling Gale [2]", slot = _Q, origin = "missile", type = "linear", speed = 700, range = 1045, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell3"] = {charName = "Janna", displayName = "Howling Gale [3]", slot = _Q, origin = "missile", type = "linear", speed = 733, range = 1095, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell4"] = {charName = "Janna", displayName = "Howling Gale [4]", slot = _Q, origin = "missile", type = "linear", speed = 767, range = 1145, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell5"] = {charName = "Janna", displayName = "Howling Gale [5]", slot = _Q, origin = "missile", type = "linear", speed = 800, range = 1195, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell6"] = {charName = "Janna", displayName = "Howling Gale [6]", slot = _Q, origin = "missile", type = "linear", speed = 833, range = 1245, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell7"] = {charName = "Janna", displayName = "Howling Gale [7]", slot = _Q, origin = "missile", type = "linear", speed = 867, range = 1295, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell8"] = {charName = "Janna", displayName = "Howling Gale [8]", slot = _Q, origin = "missile", type = "linear", speed = 900, range = 1345, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell9"] = {charName = "Janna", displayName = "Howling Gale [9]", slot = _Q, origin = "missile", type = "linear", speed = 933, range = 1395, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell10"] = {charName = "Janna", displayName = "Howling Gale [10]", slot = _Q, origin = "missile", type = "linear", speed = 967, range = 1445, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell11"] = {charName = "Janna", displayName = "Howling Gale [11]", slot = _Q, origin = "missile", type = "linear", speed = 1000, range = 1495, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell12"] = {charName = "Janna", displayName = "Howling Gale [12]", slot = _Q, origin = "missile", type = "linear", speed = 1033, range = 1545, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell13"] = {charName = "Janna", displayName = "Howling Gale [13]", slot = _Q, origin = "missile", type = "linear", speed = 1067, range = 1595, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell14"] = {charName = "Janna", displayName = "Howling Gale [14]", slot = _Q, origin = "missile", type = "linear", speed = 1100, range = 1645, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell15"] = {charName = "Janna", displayName = "Howling Gale [15]", slot = _Q, origin = "missile", type = "linear", speed = 1133, range = 1695, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell16"] = {charName = "Janna", displayName = "Howling Gale [16]", slot = _Q, origin = "missile", type = "linear", speed = 1167, range = 1745, delay = 0, radius = 120, collision = false},
	["JarvanIVDragonStrike"] = {charName = "JarvanIV", displayName = "Dragon Strike", slot = _Q, origin = "spell", type = "linear", speed = MathHuge, range = 770, delay = 0.4, radius = 70, collision = false},
	["JhinW"] = {charName = "Jhin", displayName = "Deadly Flourish", slot = _W, origin = "spell", type = "linear", speed = 5000, range = 2550, delay = 0.75, radius = 40, collision = false},
	["JhinE"] = {charName = "Jhin", displayName = "Captive Audience", slot = _E, origin = "spell", type = "circular", speed = 1600, range = 750, delay = 0.25, radius = 130, collision = false},
	["JhinETrap"] = {charName = "Jhin", displayName = "Captive Audience [Missile]", slot = _E, origin = "missile", type = "circular", speed = 1600, range = 750, delay = 0.25, radius = 130, collision = false},
	["JhinRShotMis"] = {charName = "Jhin", displayName = "Curtain Call [Missile]", slot = _R, origin = "missile", type = "linear", speed = 5000, range = 3500, delay = 0.25, radius = 80, collision = false},
	["JinxWMissile"] = {charName = "Jinx", displayName = "Zap!", slot = _W, origin = "both", type = "linear", speed = 3300, range = 1450, delay = 0.6, radius = 60, collision = true},
	["JinxEHit"] = {charName = "Jinx", displayName = "Flame Chompers! [Missile]", slot = _E, origin = "missile", type = "circular", speed = 1750, range = 900, delay = 0, radius = 120, collision = false},
	["KarmaQ"] = {charName = "Karma", displayName = "Inner Flame", slot = _Q, origin = "spell", type = "linear", speed = 1700, range = 950, delay = 0.25, radius = 60, collision = true},
	["KarmaQMissile"] = {charName = "Karma", displayName = "Inner Flame [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1700, range = 950, delay = 0.25, radius = 60, collision = true},
	["KarmaQMantra"] = {charName = "Karma", displayName = "Inner Flame [Mantra]", slot = _Q, origin = "linear", type = "linear", speed = 1700, range = 950, delay = 0.25, radius = 80, collision = true},
	["KarmaQMissileMantra"] = {charName = "Karma", displayName = "Inner Flame [Mantra, Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1700, range = 950, delay = 0.25, radius = 80, collision = true},
	["KaynW"] = {charName = "Kayn", displayName = "Blade's Reach", slot = _W, origin = "spell", type = "linear", speed = MathHuge, range = 700, delay = 0.55, radius = 90, collision = false},
	["KhazixWLong"] = {charName = "Khazix", displayName = "Void Spike [Threeway]", slot = _W, origin = "spell", type = "threeway", speed = 1700, range = 1000, delay = 0.25, radius = 70,angle = 23, collision = true},
	["KledQ"] = {charName = "Kled", displayName = "Beartrap on a Rope", slot = _Q, origin = "spell", type = "linear", speed = 1600, range = 800, delay = 0.25, radius = 45, collision = true},
	["KledQMissile"] = {charName = "Kled", displayName = "Beartrap on a Rope [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1600, range = 800, delay = 0.25, radius = 45, collision = true},
	["KogMawVoidOozeMissile"] = {charName = "KogMaw", displayName = "Void Ooze", slot = _E, origin = "both", type = "linear", speed = 1400, range = 1360, delay = 0.25, radius = 120, collision = false},
	["LeblancE"] = {charName = "Leblanc", displayName = "Ethereal Chains [Standard]", slot = _E, origin = "spell", type = "linear", speed = 1750, range = 925, delay = 0.25, radius = 55, collision = true},
	["LeblancEMissile"] = {charName = "Leblanc", displayName = "Ethereal Chains [Standard, Missile]", slot = _E, origin = "missile", type = "linear", speed = 1750, range = 925, delay = 0.25, radius = 55, collision = true},
	["LeblancRE"] = {charName = "Leblanc", displayName = "Ethereal Chains [Ultimate]", slot = _E, origin = "spell", type = "linear", speed = 1750, range = 925, delay = 0.25, radius = 55, collision = true},
	["LeblancREMissile"] = {charName = "Leblanc", displayName = "Ethereal Chains [Ultimate, Missile]", slot = _E, origin = "missile", type = "linear", speed = 1750, range = 925, delay = 0.25, radius = 55, collision = true},
	["LeonaZenithBlade"] = {charName = "Leona", displayName = "Zenith Blade", slot = _E, origin = "spell", type = "linear", speed = 2000, range = 875, delay = 0.25, radius = 70, collision = false},
	["LeonaSolarFlare"] = {charName = "Leona", displayName = "Solar Flare", slot = _R, origin = "spell", type = "circular", speed = MathHuge, range = 1200, delay = 0.85, radius = 300, collision = false},
	["LissandraQMissile"] = {charName = "Lissandra", displayName = "Ice Shard", slot = _Q, origin = "both", type = "linear", speed = 2200, range = 750, delay = 0.25, radius = 75, collision = false},
	["LuluQ"] = {charName = "Lulu", displayName = "Glitterlance", slot = _Q, origin = "spell", type = "linear", speed = 1450, range = 925, delay = 0.25, radius = 60, collision = false},
	["LuluQMissile"] = {charName = "Lulu", displayName = "Glitterlance [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1450, range = 925, delay = 0.25, radius = 60, collision = false},
	["LuxLightBinding"] = {charName = "Lux", displayName = "Light Binding", slot = _Q, origin = "spell", type = "linear", speed = 1200, range = 1175, delay = 0.25, radius = 50, collision = true},
	["LuxLightBindingDummy"] = {charName = "Lux", displayName = "Light Binding [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1200, range = 1175, delay = 0.25, radius = 50, collision = true},
	["LuxLightStrikeKugel"] = {charName = "Lux", displayName = "Light Strike Kugel", slot = _E, origin = "both", type = "circular", speed = 1200, range = 1100, delay = 0.25, radius = 300, collision = true},
	["Landslide"] = {charName = "Malphite", displayName = "Ground Slam", slot = _E, origin = "spell", type = "circular", speed = MathHuge, range = 0, delay = 0.242, radius = 400, collision = false},
	["MalzaharQ"] = {charName = "Malzahar", displayName = "Call of the Void", slot = _Q, origin = "spell", type = "rectangular", speed = 1600, range = 900, delay = 0.5, radius = 400, radius2 = 100, collision = false},
	["DarkBindingMissile"] = {charName = "Morgana", displayName = "Dark Binding", slot = _Q, origin = "both", type = "linear", speed = 1200, range = 1175, delay = 0.25, radius = 70, collision = true},	
	["MalzaharQMissile"] = {charName = "Malzahar", displayName = "Call of the Void [Missile]", slot = _Q, origin = "missile", type = "rectangular", speed = 1600, range = 900, delay = 0.5, radius = 400, radius2 = 100, collision = false},
	["MaokaiQ"] = {charName = "Maokai", displayName = "Bramble Smash", slot = _Q, origin = "spell", type = "linear", speed = 1600, range = 600, delay = 0.375, radius = 110, collision = false},
	["MaokaiQMissile"] = {charName = "Maokai", displayName = "Bramble Smash [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1600, range = 600, delay = 0.375, radius = 110, collision = false},
	["NamiQ"] = {charName = "Nami", displayName = "Aqua Prison", slot = _Q, origin = "spell", type = "circular", speed = MathHuge, range = 875, delay = 1, radius = 180, collision = false},
	["NamiRMissile"] = {charName = "Nami", displayName = "Tidal Wave", slot = _R, origin = "both", type = "linear", speed = 850, range = 2750, delay = 0.5, radius = 250, collision = false},
	["NautilusAnchorDragMissile"] = {charName = "Nautilus", displayName = "Dredge Line", slot = _Q, origin = "both", type = "linear", speed = 2000, range = 925, delay = 0.25, radius = 90, collision = true},
	["NeekoQ"] = {charName = "Neeko", displayName = "Blooming Burst", slot = _Q, origin = "both", type = "circular", speed = 1500, range = 800, delay = 0.25, radius = 200, collision = false},
	["NeekoE"] = {charName = "Neeko", displayName = "Tangle-Barbs", slot = _E, origin = "both", type = "linear", speed = 1400, range = 1000, delay = 0.25, radius = 65, collision = false},
	["NunuR"] = {charName = "Nunu", displayName = "Absolute Zero", slot = _R, origin = "spell", type = "circular", speed = MathHuge, range = 0, delay = 3, radius = 650, collision = false},
	["OlafAxeThrowCast"] = {charName = "Olaf", displayName = "Undertow", slot = _Q, origin = "spell", type = "linear", speed = 1600, range = 1000, delay = 0.25, radius = 90, collision = false},
	["OlafAxeThrow"] = {charName = "Olaf", displayName = "Undertow [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1600, range = 1000, delay = 0.25, radius = 90, collision = false},
	["OrnnQ"] = {charName = "Ornn", displayName = "Volcanic Rupture", slot = _Q, origin = "spell", type = "linear", speed = 1800, range = 800, delay = 0.3, radius = 65, collision = false},
	-- OrnnQMissile
	["OrnnE"] = {charName = "Ornn", displayName = "Searing Charge", slot = _E, origin = "spell", type = "linear", speed = 1800, range = 800, delay = 0.35, radius = 150, collision = false},
	["OrnnRCharge"] = {charName = "Ornn", displayName = "Call of the Forge God", slot = _R, origin = "spell", type = "linear", speed = 1650, range = 2500, delay = 0.5, radius = 200, collision = false},
	-- OrnnRMissile
	["PoppyQSpell"] = {charName = "Poppy", displayName = "Hammer Shock", slot = _Q, origin = "spell", type = "linear", speed = MathHuge, range = 430, delay = 0.332, radius = 100, collision = false},
	["PoppyRSpell"] = {charName = "Poppy", displayName = "Keeper's Verdict", slot = _R, origin = "spell", type = "linear", speed = 2000, range = 1200, delay = 0.33, radius = 100, collision = false},
	["PoppyRSpellMissile"] = {charName = "Poppy", displayName = "Keeper's Verdict [Missile]", slot = _R, origin = "missile", type = "linear", speed = 2000, range = 1200, delay = 0.33, radius = 100, collision = false},
	["PykeQMelee"] = {charName = "Pyke", displayName = "Bone Skewer [Melee]", slot = _Q, origin = "spell", type = "linear", speed = MathHuge, range = 400, delay = 0.25, radius = 70, collision = false},
	["PykeQRange"] = {charName = "Pyke", displayName = "Bone Skewer [Range]", slot = _Q, origin = "both", type = "linear", speed = 2000, range = 1100, delay = 0.2, radius = 70, collision = true},
	["PykeE"] = {charName = "Pyke", displayName = "Phantom Undertow", slot = _E, origin = "spell", type = "linear", speed = 3000, range = 25000, delay = 0, radius = 110, collision = false},
	["PykeEMissile"] = {charName = "Pyke", displayName = "Phantom Undertow [Missile]", slot = _E, origin = "missile", type = "linear", speed = 3000, range = 25000, delay = 0, radius = 110, collision = false},
	["RakanW"] = {charName = "Rakan", displayName = "Grand Entrance", slot = _W, origin = "spell", type = "circular", speed = MathHuge, range = 650, delay = 0.7, radius = 265, collision = false},
	["RengarE"] = {charName = "Rengar", displayName = "Bola Strike", slot = _E, origin = "spell", type = "linear", speed = 1500, range = 1000, delay = 0.25, radius = 70, collision = true},
	["RengarEMis"] = {charName = "Rengar", displayName = "Bola Strike [Missile]", slot = _E, origin = "missile", type = "linear", speed = 1500, range = 1000, delay = 0.25, radius = 70, collision = true},
	["RumbleGrenade"] = {charName = "Rumble", displayName = "Electro Harpoon", slot = _E, origin = "spell", type = "linear", speed = 2000, range = 850, delay = 0.25, radius = 60, collision = true},
	["RumbleGrenadeMissile"] = {charName = "Rumble", displayName = "Electro Harpoon [Missile]", slot = _E, origin = "missile", type = "linear", speed = 2000, range = 850, delay = 0.25, radius = 60, collision = true},
	["SejuaniR"] = {charName = "Sejuani", displayName = "Glacial Prison", slot = _R, origin = "spell", type = "linear", speed = 1600, range = 1300, delay = 0.25, radius = 120, collision = false},
	["SejuaniRMissile"] = {charName = "Sejuani", displayName = "Glacial Prison [Missile]", slot = _R, origin = "missile", type = "linear", speed = 1600, range = 1300, delay = 0.25, radius = 120, collision = false},
	["ShyvanaTransformLeap"] = {charName = "Shyvana", displayName = "Transform Leap", slot = _R, origin = "spell", type = "linear", speed = 700, range = 850, delay = 0.25, radius = 150, collision = false},
	["SionQ"] = {charName = "Sion", displayName = "Decimating Smash", slot = _Q, origin = "", type = "linear", speed = MathHuge, range = 750, delay = 2, radius = 150, collision = false},
	["SionE"] = {charName = "Sion", displayName = "Roar of the Slayer", slot = _E, origin = "spell", type = "linear", speed = 1800, range = 800, delay = 0.25, radius = 80, collision = false},
	["SionEMissile"] = {charName = "Sion", displayName = "Roar of the Slayer [Missile]", slot = _E, origin = "missile", type = "linear", speed = 1800, range = 800, delay = 0.25, radius = 80, collision = false},
	["SkarnerFractureMissile"] = {charName = "Skarner", displayName = "Fracture", slot = _E, origin = "both", type = "linear", speed = 1500, range = 1000, delay = 0.25, radius = 70, collision = false},
	["SonaR"] = {charName = "Sona", displayName = "Crescendo", slot = _R, origin = "spell", type = "linear", speed = 2400, range = 1000, delay = 0.25, radius = 140, collision = false},
	["SonaRMissile"] = {charName = "Sona", displayName = "Crescendo [Missile]", slot = _R, origin = "missile", type = "linear", speed = 2400, range = 1000, delay = 0.25, radius = 140, collision = false},
	["SorakaQ"] = {charName = "Soraka", displayName = "Starcall", slot = _Q, origin = "spell", type = "circular", speed = 1150, range = 810, delay = 0.25, radius = 235, collision = false},
	["SorakaQMissile"] = {charName = "Soraka", displayName = "Starcall [Missile]", slot = _Q, origin = "missile", type = "circular", speed = 1150, range = 810, delay = 0.25, radius = 235, collision = false},
	["SwainW"] = {charName = "Swain", displayName = "Vision of Empire", slot = _W, origin = "spell", type = "circular", speed = MathHuge, range = 3500, delay = 1.5, radius = 300, collision = false},
	["SwainE"] = {charName = "Swain", displayName = "Nevermove", slot = _E, origin = "both", type = "linear", speed = 1800, range = 850, delay = 0.25, radius = 85, collision = false},
	["SyndraESphereMissile"] = {charName = "Syndra", displayName = "Scatter the Weak [Seed]", slot = _E, origin = "missile", type = "linear", speed = 2000, range = 950, delay = 0.25, radius = 100, collision = false},
	["TahmKenchQ"] = {charName = "TahmKench", displayName = "Tongue Lash", slot = _Q, origin = "spell", type = "linear", speed = 2800, range = 800, delay = 0.25, radius = 70, collision = true},
	["TahmKenchQMissile"] = {charName = "TahmKench", displayName = "Tongue Lash [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 2800, range = 800, delay = 0.25, radius = 70, collision = true},
	["TaliyahWVC"] = {charName = "Taliyah", displayName = "Seismic Shove", slot = _W, origin = "spell", type = "circular", speed = MathHuge, range = 900, delay = 0.85, radius = 150, collision = false},
	["TaliyahR"] = {charName = "Taliyah", displayName = "Weaver's Wall", slot = _R, origin = "spell", type = "linear", speed = 1700, range = 3000, delay = 1, radius = 120, collision = false},
	["TaliyahRMis"] = {charName = "Taliyah", displayName = "Weaver's Wall [Missile]", slot = _R, origin = "missile", type = "linear", speed = 1700, range = 3000, delay = 1, radius = 120, collision = false},
	["ThreshQMissile"] = {charName = "Thresh", displayName = "Death Sentence [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1900, range = 1075, delay = 0.5, radius = 70, collision = true},
	["ThreshE"] = {charName = "Thresh", displayName = "Flay", slot = _E, origin = "spell", type = "linear", speed = MathHuge, range = 500, delay = 0.389, radius = 110, collision = true},
	["ThreshEMissile1"] = {charName = "Thresh", displayName = "Flay [Missile]", slot = _E, origin = "missile", type = "linear", speed = MathHuge, range = 500, delay = 0.389, radius = 110, collision = true},
	["TristanaW"] = {charName = "Tristana", displayName = "Rocket Jump", slot = _W, origin = "spell", type = "circular", speed = 1100, range = 900, delay = 0.25, radius = 300, collision = false},
	["UrgotQ"] = {charName = "Urgot", displayName = "Corrosive Charge", slot = _Q, origin = "spell", type = "circular", speed = MathHuge, range = 800, delay = 0.6, radius = 180, collision = false},
	["UrgotQMissile"] = {charName = "Urgot", displayName = "Corrosive Charge [Missile]", slot = _Q, origin = "missile", type = "circular", speed = MathHuge, range = 800, delay = 0.6, radius = 180, collision = false},
	["UrgotE"] = {charName = "Urgot", displayName = "Disdain", slot = _E, origin = "spell", type = "linear", speed = 1500, range = 475, delay = 0.45, radius = 100, collision = false},
	["UrgotR"] = {charName = "Urgot", displayName = "Fear Beyond Death", slot = _R, origin = "both", type = "linear", speed = 3200, range = 1600, delay = 0.4, radius = 80, collision = false},
	["VarusE"] = {charName = "Varus", displayName = "Hail of Arrows", slot = _E, origin = "spell", type = "linear", speed = 1500, range = 925, delay = 0.242, radius = 260, collision = false},
	["VarusEMissile"] = {charName = "Varus", displayName = "Hail of Arrows [Missile]", slot = _E, origin = "missile", type = "linear", speed = 1500, range = 925, delay = 0.242, radius = 260, collision = false},
	["VarusR"] = {charName = "Varus", displayName = "Chain of Corruption", slot = _R, origin = "spell", type = "linear", speed = 1950, range = 1200, delay = 0.25, radius = 120, collision = false},
	["VarusRMissile"] = {charName = "Varus", displayName = "Chain of Corruption [Missile]", slot = _R, origin = "missile", type = "linear", speed = 1950, range = 1200, delay = 0.25, radius = 120, collision = false},
	["VelkozQ"] = {charName = "Velkoz", displayName = "Plasma Fission", slot = _Q, origin = "spell", type = "linear", speed = 1300, range = 1050, delay = 0.25, radius = 50, collision = true},
	["VelkozQMissile"] = {charName = "Velkoz", displayName = "Plasma Fission [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1300, range = 1050, delay = 0.25, radius = 50, collision = true},
	["VelkozQMissileSplit"] = {charName = "Velkoz", displayName = "Plasma Fission [Split]", slot = _Q, origin = "missile", type = "linear", speed = 2100, range = 1100, delay = 0.25, radius = 45, collision = true},
	["VelkozE"] = {charName = "Velkoz", displayName = "Tectonic Disruption", slot = _E, origin = "spell", type = "circular", speed = MathHuge, range = 800, delay = 0.8, radius = 185, collision = false},
	["VelkozEMissile"] = {charName = "Velkoz", displayName = "Tectonic Disruption [Missile]", slot = _E, origin = "missile", type = "circular", speed = MathHuge, range = 800, delay = 0.8, radius = 185, collision = false},
	["ViktorGravitonField"] = {charName = "Viktor", displayName = "Graviton Field", slot = _W, origin = "spell", type = "circular", speed = MathHuge, range = 800, delay = 1.75, radius = 270, collision = false},
	["WarwickR"] = {charName = "Warwick", displayName = "Infinite Duress", slot = _R, origin = "spell", type = "linear", speed = 1800, range = 3000, delay = 0.1, radius = 55, collision = false},
	["XerathArcaneBarrage2"] = {charName = "Xerath", displayName = "Arcane Barrage", slot = _W, origin = "spell", type = "circular", speed = MathHuge, range = 1000, delay = 0.75, radius = 235, collision = false},
	["XerathMageSpear"] = {charName = "Xerath", displayName = "Mage Spear", slot = _E, origin = "spell", type = "linear", speed = 1400, range = 1050, delay = 0.2, radius = 60, collision = true},
	["XerathMageSpearMissile"] = {charName = "Xerath", displayName = "Mage Spear [Missile]", slot = _E, origin = "missile", type = "linear", speed = 1400, range = 1050, delay = 0.2, radius = 60, collision = true},
	["XinZhaoW"] = {charName = "XinZhao", displayName = "Wind Becomes Lightning", slot = _W, origin = "spell", type = "linear", speed = 5000, range = 900, delay = 0.5, radius = 40, collision = false},
	["YasuoQ3Mis"] = {charName = "Yasuo", displayName = "Gathering Storm [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1200, range = 1100, delay = 0.318, radius = 90, collision = false},
	["ZacQ"] = {charName = "Zac", displayName = "Stretching Strikes", slot = _Q, origin = "spell", type = "linear", speed = 2800, range = 800, delay = 0.33, radius = 120, collision = false},
	["ZacQMissile"] = {charName = "Zac", displayName = "Stretching Strikes [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 2800, range = 800, delay = 0.33, radius = 120, collision = false},
	["ZiggsW"] = {charName = "Ziggs", displayName = "Satchel Charge", slot = _W, origin = "both", type = "circular", speed = 1750, range = 1000, delay = 0.25, radius = 240, collision = false},
	["ZiggsE"] = {charName = "Ziggs", displayName = "Hexplosive Minefield", slot = _E, origin = "both", type = "circular", speed = 1800, range = 900, delay = 0.25, radius = 250, collision = false},
	["ZileanQ"] = {charName = "Zilean", displayName = "Time Bomb", slot = _Q, origin = "spell", type = "circular", speed = MathHuge, range = 900, delay = 0.8, radius = 150, collision = false},
	["ZileanQMissile"] = {charName = "Zilean", displayName = "Time Bomb [Missile]", slot = _Q, origin = "missile", type = "circular", speed = MathHuge, range = 900, delay = 0.8, radius = 150, collision = false},
	["ZoeE"] = {charName = "Zoe", displayName = "Sleepy Trouble Bubble", slot = _E, origin = "spell", type = "linear", speed = 1700, range = 800, delay = 0.3, radius = 50, collision = true},
	["ZoeEMissile"] = {charName = "Zoe", displayName = "Sleepy Trouble Bubble [Missile]", slot = _E, origin = "missile", type = "linear", speed = 1700, range = 800, delay = 0.3, radius = 50, collision = true},
	["ZyraE"] = {charName = "Zyra", displayName = "Grasping Roots", slot = _E, origin = "both", type = "linear", speed = 1150, range = 1100, delay = 0.25, radius = 70, collision = false},
	["ZyraR"] = {charName = "Zyra", displayName = "Stranglethorns", slot = _R, origin = "spell", type = "circular", speed = MathHuge, range = 700, delay = 2, radius = 500, collision = false},
	["BrandConflagration"] = {charName = "Brand", slot = _R, type = "targeted", displayName = "Conflagration", range = 625,cc = true},
	["JarvanIVCataclysm"] = {charName = "JarvanIV", slot = _R, type = "targeted", displayName = "Cataclysm", range = 650},
	["JayceThunderingBlow"] = {charName = "Jayce", slot = _E, type = "targeted", displayName = "Thundering Blow", range = 240},
	["BlindMonkRKick"] = {charName = "LeeSin", slot = _R, type = "targeted", displayName = "Dragon's Rage", range = 375},
	["LissandraR"] = {charName = "Lissandra", slot = _R, type = "targeted", displayName = "Frozen Tomb", range = 550},
	["SeismicShard"] = {charName = "Malphite", slot = _Q, type = "targeted", displayName = "Seismic Shard", range = 625,cc = true},
	["AlZaharNetherGrasp"] = {charName = "Malzahar", slot = _R, type = "targeted", displayName = "Nether Grasp", range = 700},
	["MaokaiW"] = {charName = "Maokai", slot = _W, type = "targeted", displayName = "Twisted Advance", range = 525},
	["NautilusR"] = {charName = "Nautilus", slot = _R, type = "targeted", displayName = "Depth Charge", range = 825},
	["PoppyE"] = {charName = "Poppy", slot = _E, type = "targeted", displayName = "Heroic Charge", range = 475},
	["RyzeW"] = {charName = "Ryze", slot = _W, type = "targeted", displayName = "Rune Prison", range = 615},
	["Fling"] = {charName = "Singed", slot = _E, type = "targeted", displayName = "Fling", range = 125},
	["SkarnerImpale"] = {charName = "Skarner", slot = _R, type = "targeted", displayName = "Impale", range = 350},
	["TahmKenchW"] = {charName = "TahmKench", slot = _W, type = "targeted", displayName = "Devour", range = 250},
	["TristanaR"] = {charName = "Tristana", slot = _R, type = "targeted", displayName = "Buster Shot", range = 669},
}


local menu = 1
local TEAM_ALLY = myHero.team
local TEAM_ENEMY = 300 - myHero.team
local TEAM_JUNGLE = 300
local Allies = {}; local Enemies = {}; local Turrets = {}; local Units = {}
local GameLatency = Game.Latency
local GameTimer = Game.Timer


local MathAbs = math.abs
local MathAcos = math.acos
local MathAtan = math.atan
local MathAtan2 = math.atan2
local MathCeil = math.ceil
local MathCos = math.cos
local MathDeg = math.deg
local MathFloor = math.floor
local MathHuge = math.huge
local MathMax = math.max
local MathMin = math.min
local MathPi = math.pi
local MathRad = math.rad
local MathRandom = math.random
local MathSin = math.sin
local MathSqrt = math.sqrt
local TableInsert = table.insert
local TableRemove = table.remove
local TableSort = table.sort

local function Ready(spell)
    return myHero:GetSpellData(spell).currentCd == 0 and myHero:GetSpellData(spell).level > 0 and myHero:GetSpellData(spell).mana <= myHero.mana
end 

function CanMove()
	if _G.SDK then
    return _G.SDK.Orbwalker:CanMove() 
	elseif _G.gsoSDK then
    return _G.gsoSDK.Orbwalker:CanMove()	
	end
end

function CanAttack()
	if _G.SDK then
		_G.SDK.Orbwalker:CanAttack()
	elseif _G.gsoSDK then
		_G.gsoSDK.Orbwalker:CanAttack()	
	end
end

function SetAttack(bool)
	if _G.EOWLoaded then
		EOW:SetAttacks(bool)
	elseif _G.SDK then                                                        
		_G.SDK.Orbwalker:SetAttack(bool)
	elseif _G.gsoSDK then
		_G.gsoSDK.Orbwalker:SetAttack(bool)	
	else
		GOS.BlockAttack = not bool
	end

end

function SetMovement(bool)
	if _G.EOWLoaded then
		EOW:SetMovements(bool)
		EOW:SetAttacks(bool)
	elseif _G.SDK then                                      
		_G.SDK.Orbwalker:SetMovement(bool)                  
		_G.SDK.Orbwalker:SetAttack(bool)
	elseif _G.gsoSDK then
		_G.gsoSDK.Orbwalker:SetMovement(bool)
		_G.gsoSDK.Orbwalker:SetAttack(bool)	
	else
		GOS.BlockMovement = not bool
		GOS.BlockAttack = not bool
	end

end

function DisableOrb()
	if _G.SDK.TargetSelector:GetTarget(900) then
		_G.SDK.Orbwalker:SetMovement(false)
		_G.SDK.Orbwalker:SetAttack(false)
		end
end

function EnableOrb()
	if _G.SDK.TargetSelector:GetTarget(900) then
		_G.SDK.Orbwalker:SetMovement(true)
		_G.SDK.Orbwalker:SetAttack(true)	
		end
end

local function GetImmobileCount(range, pos)
    local pos = pos.pos
	local count = 0
	for i = 1, Game.HeroCount() do 
	local hero = Game.Hero(i)
	local Range = range * range
		if hero.team ~= TEAM_ALLY and hero.dead == false and GetDistanceSqr(pos, hero.pos) < Range and IsImmobileTarget(hero) then
		count = count + 1
		end
	end
	return count
end

local function IsImmobileTarget(unit)
		for i = 0, unit.buffCount do
			local buff = unit:GetBuff(i)
			if buff and (buff.type == 5 or buff.type == 11 or buff.type == 29 or buff.type == 24 or buff.name == 10) and buff.count > 0 then
				return true
			end
		end
		return false	
end

local spellcast = {state = 1, mouse = mousePos}
function CastSpell(HK, pos, delay)
	if spellcast.state == 2 then return end
	if ExtLibEvade and ExtLibEvade.Evading then return end
	
	spellcast.state = 2
	DisableOrb()
	spellcast.mouse = mousePos
	DelayAction(function() 
		Control.SetCursorPos(pos) 
		Control.KeyDown(HK)
		Control.KeyUp(HK)
	end, 0.05) 
	
		DelayAction(function()
			Control.SetCursorPos(spellcast.mouse)
		end,0.25)
		
		DelayAction(function()
			EnableOrb()
			spellcast.state = 1
		end,0.35)
	
end

function CurrentTarget(range)
	if _G.SDK then
		return _G.SDK.TargetSelector:GetTarget(range, _G.SDK.DAMAGE_TYPE_MAGICAL);
	elseif _G.EOW then
		return _G.EOW:GetTarget(range)
	elseif _G.gsoSDK then
		return _G.gsoSDK.TargetSelector:GetTarget(GetEnemyHeroes(5000), false)
	else
		return _G.GOS:GetTarget(range,"AD")
	end
end

function Morgana:GetDistanceSqr(pos1, pos2)
	local pos2 = pos2 or myHero.pos
	local dx = pos1.x - pos2.x
	local dz = (pos1.z or pos1.y) - (pos2.z or pos2.y)
	return dx * dx + dz * dz
end

function Morgana:GetDistance(pos1, pos2)
	return MathSqrt(self:GetDistanceSqr(pos1, pos2))
end
 

local function IsValidCreep(unit, range)
  return unit and unit.team ~= TEAM_ALLY and unit.dead == false and GetDistanceSqr(myHero.pos, unit.pos) <= (range + myHero.boundingRadius + unit.boundingRadius)^2 and unit.isTargetable and unit.isTargetableToTeam and unit.isImmortal == false and unit.visible
end

local function GetMinionCount(range, pos)
    local pos = pos.pos
	local count = 0
	for i = 1,Game.MinionCount() do
	local hero = Game.Minion(i)
	local Range = range * range
		if hero.team ~= TEAM_ALLY and hero.dead == false and GetDistanceSqr(pos, hero.pos) < Range then
		count = count + 1
		end
	end
	return count
end

local function GetEnemyCount(range, pos)
    local pos = pos.pos
	local count = 0
	for i = 1, Game.HeroCount() do 
	local hero = Game.Hero(i)
	local Range = range * range
		if hero.team ~= TEAM_ALLY and hero.dead == false and GetDistanceSqr(pos, hero.pos) < Range then
		count = count + 1
		end
	end
	return count
end

local function GetAllyCount(range, pos)
    local pos = pos.pos
	local count = 0
	for i = 1, Game.HeroCount() do 
	local hero = Game.Hero(i)
	local Range = range * range
		if hero.team == TEAM_ALLY and hero ~= myHero and hero.dead == false and GetDistanceSqr(pos, hero.pos) < Range then
		count = count + 1
		end
	end
	return count
end
  



function IsUnderTurret(unit)
    for i = 1, Game.TurretCount() do
        local turret = Game.Turret(i)
        local range = (turret.boundingRadius + 750 + unit.boundingRadius / 2)
        if turret.isEnemy and not turret.dead then
            if turret.pos:DistanceTo(unit.pos) < range then
                return true
            end
        end
    end
    return false
end

function GetAllyHeroes() 
	AllyHeroes = {}
	for i = 1, Game.HeroCount() do
		local Hero = Game.Hero(i)
		if Hero.isAlly and not Hero.isMe then
			table.insert(AllyHeroes, Hero)
		end
	end
	return AllyHeroes
end

local function OnProcessSpell()
	for i = 1, #Units do
		local unit = Units[i].unit; local last = Units[i].spell; local spell = unit.activeSpell
		if spell and last ~= (spell.name .. spell.startTime) and unit.isChanneling and unit.isEnemy and not unit.isMe then
			Units[i].spell = spell.name .. spell.startTime; return unit, spell
		end
	end
	return nil, nil
end

function LoadUnits()
	for i = 1, Game.HeroCount() do
		local unit = Game.Hero(i); Units[i] = {unit = unit, spell = nil}
		if unit.team ~= myHero.team then TableInsert(Enemies, unit)
		elseif unit.team == myHero.team and unit ~= myHero then TableInsert(Allies, unit) end
	end
end



function Morgana:VectorPointProjectionOnLineSegment(v1, v2, v)
	local cx, cy, ax, ay, bx, by = v.x, v.z, v1.x, v1.z, v2.x, v2.z
	local rL = ((cx - ax) * (bx - ax) + (cy - ay) * (by - ay)) / ((bx - ax) ^ 2 + (by - ay) ^ 2)
	local pointLine = { x = ax + rL * (bx - ax), y = ay + rL * (by - ay) }
	local rS = rL < 0 and 0 or (rL > 1 and 1 or rL)
	local isOnSegment = rS == rL
	local pointSegment = isOnSegment and pointLine or { x = ax + rS * (bx - ax), y = ay + rS * (by - ay) }
	return pointSegment, pointLine, isOnSegment
end


function Morgana:CalculateCollisionTime(startPos, endPos, unitPos, startTime, speed, delay, origin)
	local delay = origin == "spell" and delay or 0
	local pos = startPos:Extended(endPos, speed * (GameTimer() - delay - startTime))
	return self:GetDistance(unitPos, pos) / speed
end

function Morgana:CalculateEndPos(startPos, placementPos, unitPos, range, radius, collision, type)
	local range = range or 3000; local endPos = startPos:Extended(placementPos, range)
	if type == "circular" or type == "rectangular" then
		if range > 0 then if self:GetDistance(unitPos, placementPos) < range then endPos = placementPos end
		else endPos = unitPos end
	elseif collision then
		for i = 1, Game.MinionCount() do
			local minion = Game.Minion(i)
			if minion and minion.team == myHero.team and not minion.dead and self:GetDistance(minion.pos, startPos) < range then
				local col = self:VectorPointProjectionOnLineSegment(startPos, placementPos, minion.pos)
				if col and self:GetDistance(col, minion.pos) < (radius + minion.boundingRadius / 2) then
					range = self:GetDistance(startPos, col); endPos = startPos:Extended(placementPos, range); break
				end
			end
		end
	end
	return endPos, range
end

function GetDistanceSqr(p1, p2)
	if not p1 then return math.huge end
	p2 = p2 or myHero
	local dx = p1.x - p2.x
	local dz = (p1.z or p1.y) - (p2.z or p2.y)
	return dx*dx + dz*dz
end

function GetDistance(p1, p2)
	p2 = p2 or myHero
	return math.sqrt(GetDistanceSqr(p1, p2))
end

local ItemHotKey = {
    [ITEM_1] = HK_ITEM_1,
    [ITEM_2] = HK_ITEM_2,
    [ITEM_3] = HK_ITEM_3,
    [ITEM_4] = HK_ITEM_4,
    [ITEM_5] = HK_ITEM_5,
    [ITEM_6] = HK_ITEM_6,
}

local function GetItemSlot(unit, id)
	for i = ITEM_1, ITEM_7 do
	    if unit:GetItemData(i).itemID == id then
		return i
	    end
	end
	return 0 
end

function Morgana:__init()
  self.DetectedMissiles = {}; self.DetectedSpells = {}; self.Target = nil; self.Timer = 0
  if menu ~= 1 then return end
  menu = 2
  self:LoadSpells()   	
  self:LoadMenu()                                            
  Callback.Add("Tick", function() self:Tick() end)
  Callback.Add("Draw", function() self:Draw() end) 
	local orbwalkername = ""
	if _G.SDK then
		orbwalkername = "IC'S orbwalker"		
	elseif _G.EOW then
		orbwalkername = "EOW"	
	elseif _G.GOS then
		orbwalkername = "Noddy orbwalker"
	elseif _G.gsoSDK then
		orbwalkername = "Gso orbwalker"
	else
		orbwalkername = "Orbwalker not found"
	end
end

function ReturnCursor(pos)
	Control.SetCursorPos(pos)
	DelayAction(EnableMovement,0.1)
end

function LeftClick(pos)
	Control.mouse_event(MOUSEEVENTF_LEFTDOWN)
	Control.mouse_event(MOUSEEVENTF_LEFTUP)
	DelayAction(ReturnCursor,0.05,{pos})
end

function Morgana:EnemiesAround(pos, range)
	local pos = pos.pos
	local N = 0
	for i = 1,Game.HeroCount()  do
		local hero = Game.Hero(i)
		local Range = range * range
		if hero.team ~= TEAM_ALLY and hero.dead == false and GetDistanceSqr(pos, hero.pos) < Range then
			N = N + 1
		end
	end
	return N	
end


function Morgana:LoadSpells()
 
	Q = {range = 1175, radius = 70, delay = 0.25, speed = 1200, collision = true}    
	W = {range = 900, radius = 280, delay = 0.25, speed = math.huge, collision = false}   
	E = {range = 800,}    
	R = {range = 625,}  

end

function Morgana:GetEnemyHeroes()
	local result = {}
  	for i = 1, Game.HeroCount() do
    		local unit = Game.Hero(i)
    		if unit.isEnemy then
    			result[#result + 1] = unit
  		end
  	end
  	return result
end


function Morgana:LoadMenu()                     
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Morgana", name = "PussyMorgana"})

	--AutoE
	self.Menu:MenuElement({id = "AutoE", name = "Auto Shield CC", type = MENU})
	self.Menu.AutoE:MenuElement({id = "self", name = "Use when Self CC ",value = true})
	self.Menu.AutoE:MenuElement({id = "ally", name = "Use when Ally CC ",value = true})	
	self.Menu.AutoE:MenuElement({id = "Targets", name = "Ally Settings", type = MENU})
	for i = 1, Game.HeroCount() do
		local hero = Game.Hero(i)
		if hero and hero.isAlly and myHero ~= hero then
			self.Menu.AutoE.Targets:MenuElement({id = hero.charName, name = hero.charName, value = true})		
		end
	end		
	self.Menu:MenuElement({type = MENU, id = "ESet", name = "Shield incomming CC"})	
	self.Menu.ESet:MenuElement({id = "UseE", name = "UseE Self", value = true})
	self.Menu.ESet:MenuElement({id = "UseEally", name = "UseE Ally", value = true})	
	self.Menu.ESet:MenuElement({id = "ST", name = "Track Spells", drop = {"Channeling", "Missiles", "Both"}, value = 1})	
	self.Menu.ESet:MenuElement({id = "BlockList", name = "Block List", type = MENU})	
	
	--AutoW
	self.Menu:MenuElement({type = MENU, id = "AutoW", name = "AutoW"})	
	self.Menu.AutoW:MenuElement({id = "UseW", name = "Auto[W] Immobile Target", value = true})
	
	--ComboMenu  
	self.Menu:MenuElement({type = MENU, id = "Combo", name = "Combo"})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q] Dark Binding", value = true})	
	self.Menu.Combo:MenuElement({id = "PredQ", name = "HitChance[Q] [1]=low [5]=high", value = 2, min = 1, max = 5})	
	self.Menu.Combo:MenuElement({id = "UseW", name = "[W]only if not Raedy[Q]", value = true})		
	
	--UltSettings
	self.Menu.Combo:MenuElement({type = MENU, id = "Ult", name = "Ultimate Settings"})
	self.Menu.Combo.Ult:MenuElement({id = "UseR", name = "[R] Dark Binding", value = true})
	self.Menu.Combo.Ult:MenuElement({id = "UseRE", name = "Use [R] min Targets", value = 2, min = 1, max = 6})

	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", name = "Harass"})	
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[Q] Dark Binding", value = true})
	self.Menu.Harass:MenuElement({id = "PredQ", name = "HitChance[Q] [1]=low [5]=high", value = 1, min = 1, max = 5})	
	self.Menu.Harass:MenuElement({id = "UseW", name = "[W]only if not Raedy[Q]", value = true})	
	self.Menu.Harass:MenuElement({id = "Mana", name = "Min Mana to Harass", value = 40, min = 0, max = 100, identifier = "%"})
  
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", name = "Clear"})	
	self.Menu.Clear:MenuElement({id = "UseQL", name = "LastHit[Q] Dark Binding", value = true})		
	self.Menu.Clear:MenuElement({id = "UseW", name = "[W] Tormented Soil", value = true})  
	self.Menu.Clear:MenuElement({id = "UseWM", name = "Use [W] min Minions", value = 3, min = 1, max = 6})	
	self.Menu.Clear:MenuElement({id = "Mana", name = "Min Mana to Clear", value = 40, min = 0, max = 100, identifier = "%"})
  
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", name = "JClear"})
	self.Menu.JClear:MenuElement({id = "UseQ", name = "[Q] Dark Binding", value = true})         	
	self.Menu.JClear:MenuElement({id = "UseW", name = "[W] Tormented Soil", value = true})
	self.Menu.JClear:MenuElement({id = "UseWM", name = "Use [W] min Minions", value = 3, min = 1, max = 6})
	self.Menu.JClear:MenuElement({id = "Mana", name = "Min Mana to JungleClear", value = 40, min = 0, max = 100, identifier = "%"})  
 
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "ks", name = "ks"})
	self.Menu.ks:MenuElement({id = "UseQ", name = "[Q] Dark Binding", value = true})
	self.Menu.ks:MenuElement({id = "PredQ", name = "HitChance[Q] [1]=low [5]=high", value = 1, min = 1, max = 5})	
	self.Menu.ks:MenuElement({id = "UseW", name = "[W] Tormented Soil", value = true})	


	
	--Activator
	self.Menu:MenuElement({type = MENU, id = "a", name = "Activator"})		
	self.Menu.a:MenuElement({id = "ON", name = "Zhonyas/StopWatch", value = true})	
	self.Menu.a:MenuElement({id = "HP", name = "HP", value = 15, min = 0, max = 100, step = 1, identifier = "%"})

 
	--Drawing 
	self.Menu:MenuElement({type = MENU, id = "Drawing", name = "Drawings"})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "Draw [Q] Range", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawR", name = "Draw [R] Range", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawE", name = "Draw [E] Range", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawW", name = "Draw [W] Range", value = true})
	self.Menu.Drawing:MenuElement({id = "Kill", name = "Draw Killable Targets", value = true})
	
	self.Slot = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
	DelayAction(function()
		for i, spell in pairs(CCSpells) do
			if not CCSpells[i] then return end
			for j, k in pairs(Morgana:GetEnemyHeroes()) do
				if spell.charName == k.charName and not self.Menu.ESet.BlockList[i] then
					if not self.Menu.ESet.BlockList[i] then self.Menu.ESet.BlockList:MenuElement({id = "Dodge"..i, name = ""..spell.charName.." "..self.Slot[spell.slot].." | "..spell.displayName, value = true}) end
				end
			end
		end
	end, 0.01)
	
end

function Morgana:Tick()
if myHero.dead then return end	
	self:Activator()
	self:KillSteal()
	self:AutoW()
	self:AutoE()
	self:Auto1()
	self:Auto2()
	
	if _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_COMBO] then
		self:Combo()
	elseif _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_HARASS] then                
		self:Harass()

	elseif _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_LANECLEAR] and _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_JUNGLECLEAR] then
		self:Clear()
		self:JungleClear()
	
	elseif _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_LASTHIT] then
		--self:LastHit()
	elseif _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_FLEE] then

	elseif _G.gsoSDK then
	return _G.gsoSDK.Orbwalker:GetMode()
	else
	return GOS.GetMode()
	end
end 

function Morgana:Auto2()
	if self.Menu.ESet.UseE:Value() and Ready(_E) then
		if self.Menu.ESet.ST:Value() ~= 1 then self:OnMissileCreate() end
		if self.Menu.ESet.ST:Value() ~= 2 then self:OnProcessSpell() end
		for i, spell in pairs(self.DetectedSpells) do self:UseE(i, spell) end
	end
end

function Morgana:Auto1()
	if self.Menu.ESet.UseEally:Value() and Ready(_E) then
		if self.Menu.ESet.ST:Value() ~= 1 then self:OnMissileCreate1() end
		if self.Menu.ESet.ST:Value() ~= 2 then self:OnProcessSpell1() end
		for i, spell in pairs(self.DetectedSpells) do self:UseEally(i, spell) end
	end
end 

function Morgana:GetHeroByHandle(handle)
	for i = 1, Game.HeroCount() do
		local unit = Game.Hero(i)
		if unit.handle == handle then return unit end
	end
end

function Morgana:UseE(i, s)
	local startPos = s.startPos; local endPos = s.endPos; local travelTime = 0
	if s.speed == MathHuge then travelTime = s.delay else travelTime = s.range / s.speed + s.delay end
	if s.type == "rectangular" then
		local StartPosition = endPos-Vector(endPos-startPos):Normalized():Perpendicular()*(s.radius2 or 400)
		local EndPosition = endPos+Vector(endPos-startPos):Normalized():Perpendicular()*(s.radius2 or 400)
		startPos = StartPosition; endPos = EndPosition
	end
	if s.startTime + travelTime > GameTimer() then
		local Col = Morgana:VectorPointProjectionOnLineSegment(startPos, endPos, myHero.pos)
		if s.type == "circular" and Morgana:GetDistanceSqr(myHero.pos, endPos) < (s.radius + myHero.boundingRadius) ^ 2 or Morgana:GetDistanceSqr(myHero.pos, Col) < (s.radius + myHero.boundingRadius * 1.25) ^ 2 then
			local t = 0.29; t = s.speed ~= MathHuge and Morgana:CalculateCollisionTime(startPos, endPos, myHero.pos, s.startTime, s.speed, s.delay, s.origin)
			if t < 0.3 then Control.CastSpell(HK_E, myHero.pos) end
		end
	else TableRemove(self.DetectedSpells, i) end
end

function Morgana:OnMissileCreate()
	if GameTimer() > self.Timer + 0.15 then
		for i, mis in pairs(self.DetectedMissiles) do if GameTimer() > mis.timer + 2 then TableRemove(self.DetectedMissiles, i) end end
		self.Timer = GameTimer()
	end
	for i = 1, Game.MissileCount() do
		local missile = Game.Missile(i)
		if CCSpells[missile.missileData.name] then
			local unit = self:GetHeroByHandle(missile.missileData.owner)
			if (not unit.visible and CCSpells[missile.missileData.name].origin ~= "spell") or CCExceptions[missile.missileData.name] then
				if Morgana:GetDistance(unit.pos, myHero.pos) > 3000 or not self.Menu.ESet.BlockList["Dodge"..missile.missileData.name]:Value() then return end
				local Detected = CCSpells[missile.missileData.name]
				if Detected.origin ~= "spell" then
					for i, mis in pairs(self.DetectedMissiles) do if mis.name == missile.missileData.name then return end end
					TableInsert(DetectedMissiles, {name = missile.missileData.name, timer = GameTimer()})
					local startPos = Vector(missile.missileData.startPos); local placementPos = Vector(missile.missileData.placementPos); local unitPos = unit.pos
					local radius = Detected.radius; local range = Detected.range; local col = Detected.collision; local type = Detected.type
					local endPos, range2 = Morgana:CalculateEndPos(startPos, placementPos, unitPos, range, radius, col, type)
					TableInsert(self.DetectedSpells, {startPos = startPos, endPos = endPos, startTime = GameTimer(), speed = Detected.speed, range = range2, delay = Detected.delay, radius = radius, radius2 = radius2 or nil, angle = angle or nil, type = type, collision = col, origin = "missile"})
				end
			end
		end
	end
end

function Morgana:OnProcessSpell()
	local unit, spell = OnProcessSpell()
	if unit and spell and CCSpells[spell.name] then
		if Morgana:GetDistance(unit.pos, myHero.pos) > 3000 or not self.Menu.ESet.BlockList["Dodge"..spell.name]:Value() then return end
		local Detected = CCSpells[spell.name]
		if Detected.origin ~= "missile" then
			local type = Detected.type
			if type == "targeted" then
				if spell.target == myHero.handle then Control.CastSpell(HK_E, myHero.pos) end
			else
				local startPos = Vector(spell.startPos); local placementPos = Vector(spell.placementPos); local unitPos = unit.pos
				local radius = Detected.radius; local range = Detected.range; local col = Detected.collision; local type = Detected.type
				local endPos, range2 = Morgana:CalculateEndPos(startPos, placementPos, unitPos, range, radius, col, type)
				TableInsert(self.DetectedSpells, {startPos = startPos, endPos = endPos, startTime = GameTimer(), speed = Detected.speed, range = range2, delay = Detected.delay, radius = radius, radius2 = radius2 or nil, angle = angle or nil, type = type, collision = col, origin = "spell"})
			end
		end
	end
end


function Morgana:UseEally(i, s)
for i = 1, Game.HeroCount() do
local hero = Game.Hero(i)
if hero and hero.isAlly and hero.alive and hero.isTargetable and hero ~= myHero then	
	local startPos = s.startPos; local endPos = s.endPos; local travelTime = 0
	if s.speed == MathHuge then travelTime = s.delay else travelTime = s.range / s.speed + s.delay end
	if s.type == "rectangular" then
		local StartPosition = endPos-Vector(endPos-startPos):Normalized():Perpendicular()*(s.radius2 or 400)
		local EndPosition = endPos+Vector(endPos-startPos):Normalized():Perpendicular()*(s.radius2 or 400)
		startPos = StartPosition; endPos = EndPosition
	end
	if s.startTime + travelTime > GameTimer() then
		local Col = Morgana:VectorPointProjectionOnLineSegment(startPos, endPos, hero.pos)
		if s.type == "circular" and Morgana:GetDistanceSqr(hero.pos, endPos) < (s.radius + hero.boundingRadius) ^ 2 or Morgana:GetDistanceSqr(hero.pos, Col) < (s.radius + hero.boundingRadius * 1.25) ^ 2 then
			local t = 0.29; t = s.speed ~= MathHuge and Morgana:CalculateCollisionTime(startPos, endPos, hero.pos, s.startTime, s.speed, s.delay, s.origin)
			if t < 0.3 then Control.CastSpell(HK_E, hero.pos) end
		end
	else TableRemove(self.DetectedSpells, i) end
end
end
end

function Morgana:OnMissileCreate1()
for i = 1, Game.HeroCount() do
local hero = Game.Hero(i)
if hero and hero.isAlly and hero.alive and hero.isTargetable and hero ~= myHero then	
	if GameTimer() > self.Timer + 0.15 then
		for i, mis in pairs(self.DetectedMissiles) do if GameTimer() > mis.timer + 2 then TableRemove(self.DetectedMissiles, i) end end
		self.Timer = GameTimer()
	end
	for i = 1, Game.MissileCount() do
		local missile = Game.Missile(i)
		if CCSpells[missile.missileData.name] then
			local unit = self:GetHeroByHandle(missile.missileData.owner)
			if (not unit.visible and CCSpells[missile.missileData.name].origin ~= "spell") or CCExceptions[missile.missileData.name] then
				if Morgana:GetDistance(unit.pos, hero.pos) > 3000 or not self.Menu.ESet.BlockList["Dodge"..missile.missileData.name]:Value() then return end
				local Detected = CCSpells[missile.missileData.name]
				if Detected.origin ~= "spell" then
					for i, mis in pairs(self.DetectedMissiles) do if mis.name == missile.missileData.name then return end end
					TableInsert(DetectedMissiles, {name = missile.missileData.name, timer = GameTimer()})
					local startPos = Vector(missile.missileData.startPos); local placementPos = Vector(missile.missileData.placementPos); local unitPos = unit.pos
					local radius = Detected.radius; local range = Detected.range; local col = Detected.collision; local type = Detected.type
					local endPos, range2 = Morgana:CalculateEndPos(startPos, placementPos, unitPos, range, radius, col, type)
					TableInsert(self.DetectedSpells, {startPos = startPos, endPos = endPos, startTime = GameTimer(), speed = Detected.speed, range = range2, delay = Detected.delay, radius = radius, radius2 = radius2 or nil, angle = angle or nil, type = type, collision = col, origin = "missile"})
				end
			end
		end
	end
end
end
end

function Morgana:OnProcessSpell1()
for i = 1, Game.HeroCount() do
local hero = Game.Hero(i)
if hero and hero.isAlly and hero.alive and hero.isTargetable and hero ~= myHero then
if hero == nil then return end	
	local unit, spell = OnProcessSpell()
	if unit and spell and CCSpells[spell.name] and myHero.pos:DistanceTo(hero.pos) <= 800 then
		if not self.Menu.ESet.BlockList["Dodge"..spell.name]:Value() then return end
		local Detected = CCSpells[spell.name]
		if Detected.origin ~= "missile" then
			local type = Detected.type
			if type == "targeted" then
				if spell.target == hero.handle then Control.CastSpell(HK_E, hero.pos) end
			else
				local startPos = Vector(spell.startPos); local placementPos = Vector(spell.placementPos); local unitPos = unit.pos
				local radius = Detected.radius; local range = Detected.range; local col = Detected.collision; local type = Detected.type
				local endPos, range2 = Morgana:CalculateEndPos(startPos, placementPos, unitPos, range, radius, col, type)
				TableInsert(self.DetectedSpells, {startPos = startPos, endPos = endPos, startTime = GameTimer(), speed = Detected.speed, range = range2, delay = Detected.delay, radius = radius, radius2 = radius2 or nil, angle = angle or nil, type = type, collision = col, origin = "spell"})
			end
		end
	end
end
end
end 



function Morgana:AutoE()
for i = 1, Game.HeroCount() do
local ally = Game.Hero(i)	
	if self.Menu.AutoE.self:Value() and Ready(_E) and IsImmobileTarget(myHero) then
		Control.CastSpell(HK_E, myHero)
	end
	if ally and ally.isAlly and ally.alive and ally.isTargetable and ally ~= myHero then 
	if self.Menu.AutoE.ally:Value() and self.Menu.AutoE.Targets[ally.charName] and self.Menu.AutoE.Targets[ally.charName]:Value() and Ready(_E) and myHero.pos:DistanceTo(ally.pos) <= 800 and IsImmobileTarget(ally) then
		Control.CastSpell(HK_E, ally.pos)
	end
	end
end
end
	






function Morgana:Activator()
if myHero.dead then return end
			--Zhonyas
	if self:EnemiesAround(myHero.pos,2000) then	
		if self.Menu.a.ON:Value() then
		local Zhonyas = GetItemSlot(myHero, 3157)
			if Zhonyas > 0 and Ready(Zhonyas) then 
				if myHero.health/myHero.maxHealth <= self.Menu.a.HP:Value()/100 then
					Control.CastSpell(ItemHotKey[Zhonyas])
				end
			end
		end
			--Stopwatch
		if self.Menu.a.ON:Value() then
		local Stop = GetItemSlot(myHero, 2420)
			if Stop > 0 and Ready(Stop) then 
				if myHero.health/myHero.maxHealth <= self.Menu.a.HP:Value()/100 then
					Control.CastSpell(ItemHotKey[Stop])
				end
			end
		end
	end
end	
			


function Morgana:Draw()
  if myHero.dead then return end
	if self.Menu.Drawing.DrawR:Value() and Ready(_R) then
    Draw.Circle(myHero, 625, 3, Draw.Color(255, 225, 255, 10))
	end                                                 
	if self.Menu.Drawing.DrawQ:Value() and Ready(_Q) then
    Draw.Circle(myHero, 1175, 3, Draw.Color(225, 225, 0, 10))
	end
	if self.Menu.Drawing.DrawE:Value() and Ready(_E) then
    Draw.Circle(myHero, 800, 3, Draw.Color(225, 225, 125, 10))
	end
	if self.Menu.Drawing.DrawW:Value() and Ready(_W) then
    Draw.Circle(myHero, 900, 3, Draw.Color(225, 225, 125, 10))
	end
	local target = CurrentTarget(20000)
	if target == nil then return end	
	if target and self.Menu.Drawing.Kill:Value() and not target.dead then
	local hp = target.health	
		if Ready(_Q) and getdmg("Q", target) > hp then
			Draw.Text("Killable", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Killable", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))
		end	
		if Ready(_W) and getdmg("W", target) > hp then
			Draw.Text("Killable", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Killable", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))		
		end	
	end
end
       
function Morgana:ValidTarget(unit,range) 
  return unit ~= nil and unit.valid and unit.visible and not unit.dead and unit.isTargetable and not unit.isImmortal 
end

function Morgana:KillSteal()
if myHero.dead then return end	
	local target = CurrentTarget(1200)     	
	if target == nil then return end
	local hp = target.health
	local QDmg = getdmg("Q", target, myHero)
	local WDmg = getdmg("W", target, myHero)
		if self.Menu.ks.UseQ:Value() and Ready(_Q) then
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, Q.range, Q.delay, Q.speed, Q.radius, Q.collision)
			if QDmg >= hp and myHero.pos:DistanceTo(target.pos) <= 1175 and hitRate and hitRate >= self.Menu.ks.PredQ:Value() then
				Control.CastSpell(HK_Q, aimPosition)
			end
		end
		if self.Menu.ks.UseW:Value() and Ready(_W) then
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, W.range, W.delay, W.speed, W.radius, W.collision)
			if WDmg >= hp and myHero.pos:DistanceTo(target.pos) <= 900 and hitRate and hitRate >= 1 then			
				Control.CastSpell(HK_W, aimPosition)
	
			end
		end
	end


function Morgana:AutoW()
	local target = CurrentTarget(1200)
	if target == nil then return end
		if self.Menu.AutoW.UseW:Value() and Ready(_W) and myHero.pos:DistanceTo(target.pos) <= 900 and IsImmobileTarget(target) then
			Control.CastSpell(HK_W, target)
		
		elseif self.Menu.AutoW.UseW:Value() and Ready(_W) and myHero.pos:DistanceTo(target.pos) > 900 and myHero.pos:DistanceTo(target.pos) < 1175 and IsImmobileTarget(target) then
			local WPos = myHero.pos:Shortened(target.pos - 900)
			Control.SetCursorPos(WPos)
			Control.KeyDown(HK_W)
			Control.KeyUp(HK_W)
		end	
	end
	


function Morgana:Combo()
	local target = CurrentTarget(1200)
	if target == nil then return end


		if self.Menu.Combo.UseQ:Value() and Ready(_Q) and myHero.pos:DistanceTo(target.pos) <= 1175 then 	
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, Q.range, Q.delay, Q.speed, Q.radius, Q.collision)
			if hitRate and hitRate >= self.Menu.Combo.PredQ:Value() then
				Control.CastSpell(HK_Q, aimPosition)
			end	
		end
		
		if self.Menu.Combo.UseW:Value() and Ready(_W) and not Ready(_Q) then
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, W.range, W.delay, W.speed, W.radius, W.collision)
			if myHero.pos:DistanceTo(target.pos) <= 900 and hitRate and hitRate >= 1 then			
				Control.CastSpell(HK_W, aimPosition)
	
			end
		end	
		
		local count = GetEnemyCount(625, myHero)
		if Ready(_R) and self.Menu.Combo.Ult.UseR:Value() and count >= self.Menu.Combo.Ult.UseRE:Value() then
			Control.CastSpell(HK_R)
		end
	end	




function Morgana:Harass()
local target = CurrentTarget(1200)
if target == nil then return end
	if myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100 then
		if self.Menu.Harass.UseQ:Value() and Ready(_Q) and myHero.pos:DistanceTo(target.pos) <= 1175 then 
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, Q.range, Q.delay, Q.speed, Q.radius, Q.collision)
			if hitRate and hitRate >= self.Menu.Harass.PredQ:Value()	then
				Control.CastSpell(HK_Q, aimPosition)
			end
		end
		if self.Menu.Harass.UseW:Value() and Ready(_W) and not Ready(_Q) then
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, W.range, W.delay, W.speed, W.radius, W.collision)
			if myHero.pos:DistanceTo(target.pos) <= 900 and hitRate and hitRate >= 1 then			
				Control.CastSpell(HK_W, aimPosition)
	
			end
		end
	end
end	




function Morgana:Clear()
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
    local TEAM_ALLY = myHero.team
	local TEAM_ENEMY = 300 - myHero.team

		if minion.team == TEAM_ENEMY and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100  then	
		local hp = minion.health
		local QDmg = getdmg("Q", minion, myHero)				
			if Ready(_Q) and hp <= QDmg and myHero.pos:DistanceTo(minion.pos) <= 1175 and self.Menu.Clear.UseQL:Value() then
				Control.CastSpell(HK_Q, minion)
			end	
			local count = GetMinionCount(275, minion)
			if Ready(_W) and myHero.pos:DistanceTo(minion.pos) <= 900 and self.Menu.Clear.UseW:Value() and count >= self.Menu.Clear.UseWM:Value() then
				Control.CastSpell(HK_W, minion)
			end  
		end
	end
end

function Morgana:JungleClear()
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)	
	local TEAM_JUNGLE = 300
		if minion.team == TEAM_JUNGLE and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100 then	
			if Ready(_Q) and myHero.pos:DistanceTo(minion.pos) <= 1175 and self.Menu.JClear.UseQ:Value() then
				Control.CastSpell(HK_Q, minion)
			end
			local count = GetMinionCount(275, minion)
			if Ready(_W) and myHero.pos:DistanceTo(minion.pos) <= 900 and self.Menu.JClear.UseW:Value() and count >= self.Menu.JClear.UseWM:Value() then
				Control.CastSpell(HK_W, minion)
			end  
		end
	end
end

------------------------------------------------------------------------------------------------------------

--Dmg Lib



local DamageReductionTable = {
  ["Braum"] = {buff = "BraumShieldRaise", amount = function(target) return 1 - ({0.3, 0.325, 0.35, 0.375, 0.4})[target:GetSpellData(_E).level] end},
  ["Urgot"] = {buff = "urgotswapdef", amount = function(target) return 1 - ({0.3, 0.4, 0.5})[target:GetSpellData(_R).level] end},
  ["Alistar"] = {buff = "Ferocious Howl", amount = function(target) return ({0.5, 0.4, 0.3})[target:GetSpellData(_R).level] end},
  ["Amumu"] = {buff = "Tantrum", amount = function(target) return ({2, 4, 6, 8, 10})[target:GetSpellData(_E).level] end, damageType = 1},
  ["Galio"] = {buff = "GalioIdolOfDurand", amount = function(target) return 0.5 end},
  ["Garen"] = {buff = "GarenW", amount = function(target) return 0.7 end},
  ["Gragas"] = {buff = "GragasWSelf", amount = function(target) return ({0.1, 0.12, 0.14, 0.16, 0.18})[target:GetSpellData(_W).level] end},
  ["Annie"] = {buff = "MoltenShield", amount = function(target) return 1 - ({0.16,0.22,0.28,0.34,0.4})[target:GetSpellData(_E).level] end},
  ["Malzahar"] = {buff = "malzaharpassiveshield", amount = function(target) return 0.1 end}
}

function GetPercentHP(unit)
  return 100 * unit.health / unit.maxHealth
end

function string.ends(String,End)
  return End == "" or string.sub(String,-string.len(End)) == End
end

function GetItemSlot(unit, id)
  for i = ITEM_1, ITEM_7 do
    if unit:GetItemData(i).itemID == id then
      return i
    end
  end
  return 0
end

function GotBuff(unit, buffname)
  for i = 0, unit.buffCount do
    local buff = unit:GetBuff(i)
    if buff.name == buffname and buff.count > 0 then 
      return buff.count
    end
  end
  return 0
end

function GetBuffData(unit, buffname)
  for i = 0, unit.buffCount do
    local buff = unit:GetBuff(i)
    if buff.name == buffname and buff.count > 0 then 
      return buff
    end
  end
  return {type = 0, name = "", startTime = 0, expireTime = 0, duration = 0, stacks = 0, count = 0}
end

function CalcPhysicalDamage(source, target, amount)
  local ArmorPenPercent = source.armorPenPercent
  local ArmorPenFlat = (0.4 + target.levelData.lvl / 30) * source.armorPen
  local BonusArmorPen = source.bonusArmorPenPercent

  if source.type == Obj_AI_Minion then
    ArmorPenPercent = 1
    ArmorPenFlat = 0
    BonusArmorPen = 1
  elseif source.type == Obj_AI_Turret then
    ArmorPenFlat = 0
    BonusArmorPen = 1
    if source.charName:find("3") or source.charName:find("4") then
      ArmorPenPercent = 0.25
    else
      ArmorPenPercent = 0.7
    end
  end

  if source.type == Obj_AI_Turret then
    if target.type == Obj_AI_Minion then
      amount = amount * 1.25
      if string.ends(target.charName, "MinionSiege") then
        amount = amount * 0.7
      end
      return amount
    end
  end

  local armor = target.armor
  local bonusArmor = target.bonusArmor
  local value = 100 / (100 + (armor * ArmorPenPercent) - (bonusArmor * (1 - BonusArmorPen)) - ArmorPenFlat)

  if armor < 0 then
    value = 2 - 100 / (100 - armor)
  elseif (armor * ArmorPenPercent) - (bonusArmor * (1 - BonusArmorPen)) - ArmorPenFlat < 0 then
    value = 1
  end
  return math.max(0, math.floor(DamageReductionMod(source, target, PassivePercentMod(source, target, value) * amount, 1)))
end

function CalcMagicalDamage(source, target, amount)
  local mr = target.magicResist
  local value = 100 / (100 + (mr * source.magicPenPercent) - source.magicPen)

  if mr < 0 then
    value = 2 - 100 / (100 - mr)
  elseif (mr * source.magicPenPercent) - source.magicPen < 0 then
    value = 1
  end
  return math.max(0, math.floor(DamageReductionMod(source, target, PassivePercentMod(source, target, value) * amount, 2)))
end

function DamageReductionMod(source,target,amount,DamageType)
  if source.type == Obj_AI_Hero then
    if GotBuff(source, "Exhaust") > 0 then
      amount = amount * 0.6
    end
  end

  if target.type == Obj_AI_Hero then

    for i = 0, target.buffCount do
      if target:GetBuff(i).count > 0 then
        local buff = target:GetBuff(i)
        if buff.name == "MasteryWardenOfTheDawn" then
          amount = amount * (1 - (0.06 * buff.count))
        end
    
        if DamageReductionTable[target.charName] then
          if buff.name == DamageReductionTable[target.charName].buff and (not DamageReductionTable[target.charName].damagetype or DamageReductionTable[target.charName].damagetype == DamageType) then
            amount = amount * DamageReductionTable[target.charName].amount(target)
          end
        end

        if target.charName == "Maokai" and source.type ~= Obj_AI_Turret then
          if buff.name == "MaokaiDrainDefense" then
            amount = amount * 0.8
          end
        end

        if target.charName == "MasterYi" then
          if buff.name == "Meditate" then
            amount = amount - amount * ({0.5, 0.55, 0.6, 0.65, 0.7})[target:GetSpellData(_W).level] / (source.type == Obj_AI_Turret and 2 or 1)
          end
        end
      end
    end

    if GetItemSlot(target, 1054) > 0 then
      amount = amount - 8
    end

    if target.charName == "Kassadin" and DamageType == 2 then
      amount = amount * 0.85
    end
  end

  return amount
end

function PassivePercentMod(source, target, amount, damageType)
  local SiegeMinionList = {"Red_Minion_MechCannon", "Blue_Minion_MechCannon"}
  local NormalMinionList = {"Red_Minion_Wizard", "Blue_Minion_Wizard", "Red_Minion_Basic", "Blue_Minion_Basic"}

  if source.type == Obj_AI_Turret then
    if table.contains(SiegeMinionList, target.charName) then
      amount = amount * 0.7
    elseif table.contains(NormalMinionList, target.charName) then
      amount = amount * 1.14285714285714
    end
  end
  if source.type == Obj_AI_Hero then 
    if target.type == Obj_AI_Hero then
      if (GetItemSlot(source, 3036) > 0 or GetItemSlot(source, 3034) > 0) and source.maxHealth < target.maxHealth and damageType == 1 then
        amount = amount * (1 + math.min(target.maxHealth - source.maxHealth, 500) / 50 * (GetItemSlot(source, 3036) > 0 and 0.015 or 0.01))
      end
    end
  end
  return amount
end

local DamageLibTable = {

  ["Morgana"] = {  
    {Slot = "Q", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({80, 135, 190, 245, 300})[level] + 0.9 * source.ap end},
	{Slot = "W", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({8, 16, 24, 24, 40})[level] + 0.11 * source.ap end},
    {Slot = "R", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({150, 225, 300})[level] + 0.7 * source.ap end}

  }
}


function getdmg(spell,target,source,stage,level)
  local source = source or myHero
  local stage = stage or 1
  local swagtable = {}
  local k = 0
  if stage > 4 then stage = 4 end
  if spell == "Q" or spell == "W" or spell == "E" or spell == "R" or spell == "QM" or spell == "WM" or spell == "EM" then
    local level = level or source:GetSpellData(({["Q"] = _Q, ["QM"] = _Q, ["W"] = _W, ["WM"] = _W, ["E"] = _E, ["EM"] = _E, ["R"] = _R})[spell]).level
    if level <= 0 then return 0 end
    if level > 5 then level = 5 end
    if DamageLibTable[source.charName] then
      for i, spells in pairs(DamageLibTable[source.charName]) do
        if spells.Slot == spell then
          table.insert(swagtable, spells)
        end
      end
      if stage > #swagtable then stage = #swagtable end
      for v = #swagtable, 1, -1 do
        local spells = swagtable[v]
        if spells.Stage == stage then
          if spells.DamageType == 1 then
            return CalcPhysicalDamage(source, target, spells.Damage(source, target, level))
          elseif spells.DamageType == 2 then
            return CalcMagicalDamage(source, target, spells.Damage(source, target, level))
          elseif spells.DamageType == 3 then
            return spells.Damage(source, target, level)
          end
        end
      end
    end
  end
  if spell == "AA" then
    return CalcPhysicalDamage(source, target, source.totalDamage)
  end
  if spell == "IGNITE" then
    return 50+20*source.levelData.lvl - (target.hpRegen*3)
  end
  if spell == "SMITE" then
    if Smite then
      if target.type == Obj_AI_Hero then
        if source:GetSpellData(Smite).name == "s5_summonersmiteplayerganker" then
          return 20+8*source.levelData.lvl
        end
        if source:GetSpellData(Smite).name == "s5_summonersmiteduel" then
          return 54+6*source.levelData.lvl
        end
      end
      return ({390, 410, 430, 450, 480, 510, 540, 570, 600, 640, 680, 720, 760, 800, 850, 900, 950, 1000})[source.levelData.lvl]
    end
  end
  if spell == "BILGEWATER" then
    return CalcMagicalDamage(source, target, 100)
  end
  if spell == "BOTRK" then
    return CalcPhysicalDamage(source, target, target.maxHealth*0.1)
  end
  if spell == "HEXTECH" then
    return CalcMagicalDamage(source, target, 150+0.4*source.ap)
  end
  return 0
end

--[[
		GENERAL API
	
	HPred:GetReliableTarget(source, range, delay, speed, radius, timingAccuracy, checkCollision)
		Usage Purpose
			Wrapper method to find an enemy who can be very reliably hit. Includes hourglas, teleport, blink, dash, CC and more.
			Returns target, aimPosition
		Param Description
			Source: Where the spell will be cast from
			Range: How far away to search for targets (max spell range)
			Delay: How long it will take for the spell to cast
			Speed: How fast the spell will travel
			Radius: How wide the spell is for hitbox calculations
			TimingAccuracy: General accuracy setting. This is how long after a hourglass/teleport/etc we can allow the spell to hit. I suggest ~0.25 seconds
			CheckCollision: Determines if a linear skillshot can be body blocked by minions or other heroes
			
	HPred:GetUnreliableTarget(source, range, delay, speed, radius, checkCollision, minimumHitChance, whitelist)
		Usage Purpose
			Finds any target in range who can be hit with at least 'minimumHitChance' of accuracy. Used as a wrapper for HPred:GetHitchance
			Returns target, aimPosition
		Param Description
			Source: Where the spell will be cast from
			Range: How far away to search for targets (max spell range)
			Delay: How long it will take for the spell to cast
			Speed: How fast the spell will travel
			Radius: How wide the spell is for hitbox calculations
			CheckCollision: Determines if a linear skillshot can be body blocked by minions or other heroes
			MinimumHitChance: How confident must we be that the target can be hit for the target to qualify. Recommend accuracy of 3 on almost all skills
				-1 	=	Invalid Target
				1	=	Standard accuracy
				2	=	Target is standing still or has changed movement path within the past 0.25 seconds
				3	=	The target is auto attacking and our spell will give them little time to react in order to dodge
				4	=	The target is using a spell and our spell will give them virtually no time in order to dodge
				5	=	The target should not be able to dodge without using movement skills
				
	HPred:GetHitchance(source, target, range, delay, speed, radius, checkCollision)
		Usage Purpose
			Determines the hitchance of a spell on a specified target and where to aim the spell
			Returns hitChance, aimPosition
		Param Description
			Source: Where the spell will be cast from
			Target: What entity are we trying to hit
			Range: How far away to search for targets (max spell range)
			Delay: How long it will take for the spell to cast
			Speed: How fast the spell will travel
			Radius: How wide the spell is for hitbox calculations
			CheckCollision: Determines if a linear skillshot can be body blocked by minions or other heroes
			
	HPred:GetLineTargetCount(source, aimPos, delay, speed, width, targetAllies)
		Usage Purpose
			Determines how many targets will be hit if we cast a linear spell at a specified location - Can specify if the targets are enemies or allies
			Returns total target count
			
			
	HPred:GetGuarenteedTarget(source, range, delay, speed, radius, timingAccuracy, checkCollision)
		UsagePurpose
			Simplified version of GetReliableTarget - will only check for hourglass, revive, teleport and CCd targets. Useful for high priority skills where you don't want to cast it every time an enemy dashes
			
]]



class "HPred"
local _atan = math.atan2
local _pi = math.pi
local _min = math.min
local _abs = math.abs
local _sqrt = math.sqrt
local _huge = math.huge
local _insert = table.insert
local _sort = table.sort
local _find = string.find
local _sub = string.sub
local _len = string.len

local LocalDrawLine					= Draw.Line;
local LocalDrawColor				= Draw.Color;
local LocalDrawCircle				= Draw.Circle;
local LocalDrawText					= Draw.Text;
local LocalControlIsKeyDown			= Control.IsKeyDown;
local LocalControlMouseEvent		= Control.mouse_event;
local LocalControlSetCursorPos		= Control.SetCursorPos;
local LocalControlKeyUp				= Control.KeyUp;
local LocalControlKeyDown			= Control.KeyDown;
local LocalGameCanUseSpell			= Game.CanUseSpell;
local LocalGameLatency				= Game.Latency;
local LocalGameTimer				= Game.Timer;
local LocalGameHeroCount 			= Game.HeroCount;
local LocalGameHero 				= Game.Hero;
local LocalGameMinionCount 			= Game.MinionCount;
local LocalGameMinion 				= Game.Minion;
local LocalGameTurretCount 			= Game.TurretCount;
local LocalGameTurret 				= Game.Turret;
local LocalGameWardCount 			= Game.WardCount;
local LocalGameWard 				= Game.Ward;
local LocalGameObjectCount 			= Game.ObjectCount;
local LocalGameObject				= Game.Object;
local LocalGameMissileCount 		= Game.MissileCount;
local LocalGameMissile				= Game.Missile;
local LocalGameParticleCount 		= Game.ParticleCount;
local LocalGameParticle				= Game.Particle;
local LocalGameIsChatOpen			= Game.IsChatOpen;
local LocalGameIsOnTop				= Game.IsOnTop;
	
local _tickFrequency = .2
local _nextTick = Game.Timer()
local _reviveLookupTable = 
	{ 
		["LifeAura.troy"] = 4, 
		["ZileanBase_R_Buf.troy"] = 3,
		["Aatrox_Base_Passive_Death_Activate"] = 3
		
		--TwistedFate_Base_R_Gatemarker_Red
			--String match would be ideal.... could be different in other skins
	}

--Stores a collection of spells that will cause a character to blink
	--Ground targeted spells go towards mouse castPos with a maximum range
	--Hero/Minion targeted spells have a direction type to determine where we will land relative to our target (in front of, behind, etc)
	
--Key = Spell name
--Value = range a spell can travel, OR a targeted end position type, OR a list of particles the spell can teleport to	
local _blinkSpellLookupTable = 
	{ 
		["EzrealArcaneShift"] = 475, 
		["RiftWalk"] = 500,
		
		--Ekko and other similar blinks end up between their start pos and target pos (in front of their target relatively speaking)
		["EkkoEAttack"] = 0,
		["AlphaStrike"] = 0,
		
		--Katarina E ends on the side of her target closest to where her mouse was... 
		["KatarinaE"] = -255,
		
		--Katarina can target a dagger to teleport directly to it: Each skin has a different particle name. This should cover all of them.
		["KatarinaEDagger"] = { "Katarina_Base_Dagger_Ground_Indicator","Katarina_Skin01_Dagger_Ground_Indicator","Katarina_Skin02_Dagger_Ground_Indicator","Katarina_Skin03_Dagger_Ground_Indicator","Katarina_Skin04_Dagger_Ground_Indicator","Katarina_Skin05_Dagger_Ground_Indicator","Katarina_Skin06_Dagger_Ground_Indicator","Katarina_Skin07_Dagger_Ground_Indicator" ,"Katarina_Skin08_Dagger_Ground_Indicator","Katarina_Skin09_Dagger_Ground_Indicator"  }, 
	}

local _blinkLookupTable = 
	{ 
		"global_ss_flash_02.troy",
		"Lissandra_Base_E_Arrival.troy",
		"LeBlanc_Base_W_return_activation.troy"
		--TODO: Check if liss/leblanc have diff skill versions. MOST likely dont but worth checking for completion sake
		
		--Zed uses 'switch shadows'... It will require some special checks to choose the shadow he's going TO not from...
		--Shaco deceive no longer has any particles where you jump to so it cant be tracked (no spell data or particles showing path)
		
	}

local _cachedBlinks = {}
local _cachedRevives = {}
local _cachedTeleports = {}

--Cache of all TARGETED missiles currently running
local _cachedMissiles = {}
local _incomingDamage = {}

--Cache of active enemy windwalls so we can calculate it when dealing with collision checks
local _windwall
local _windwallStartPos
local _windwallWidth

local _OnVision = {}
function HPred:OnVision(unit)
	if unit == nil or type(unit) ~= "userdata" then return end
	if _OnVision[unit.networkID] == nil then _OnVision[unit.networkID] = {visible = unit.visible , tick = GetTickCount(), pos = unit.pos } end
	if _OnVision[unit.networkID].visible == true and not unit.visible then _OnVision[unit.networkID].visible = false _OnVision[unit.networkID].tick = GetTickCount() end
	if _OnVision[unit.networkID].visible == false and unit.visible then _OnVision[unit.networkID].visible = true _OnVision[unit.networkID].tick = GetTickCount() _OnVision[unit.networkID].pos = unit.pos end
	return _OnVision[unit.networkID]
end

--This must be called manually - It's not on by default because we've tracked down most of the freeze issues to this.
function HPred:Tick()
	
	
	--Update missile cache
	--DISABLED UNTIL LATER.
	--self:CacheMissiles()
	
	--Limit how often tick logic runs
	if _nextTick > Game.Timer() then return end
	_nextTick = Game.Timer() + _tickFrequency
	
	--Update hero movement history	
	for i = 1, LocalGameHeroCount() do
		local t = LocalGameHero(i)
		if t then
			if t.isEnemy then
				HPred:OnVision(t)
			end
		end
	end
	
	--Do not run rest of logic until freeze issues are fully tracked down
	if true then return end
	
	
	--Remove old cached teleports	
	for _, teleport in pairs(_cachedTeleports) do
		if teleport and Game.Timer() > teleport.expireTime + .5 then
			_cachedTeleports[_] = nil
		end
	end	
	
	--Update teleport cache
	HPred:CacheTeleports()	
	
	
	--Record windwall
	HPred:CacheParticles()
	
	--Remove old cached revives
	for _, revive in pairs(_cachedRevives) do
		if Game.Timer() > revive.expireTime + .5 then
			_cachedRevives[_] = nil
		end
	end
	
	--Remove old cached blinks
	for _, revive in pairs(_cachedRevives) do
		if Game.Timer() > revive.expireTime + .5 then
			_cachedRevives[_] = nil
		end
	end
	
	for i = 1, LocalGameParticleCount() do 
		local particle = LocalGameParticle(i)
		--Record revives
		if particle and not _cachedRevives[particle.networkID] and  _reviveLookupTable[particle.name] then
			_cachedRevives[particle.networkID] = {}
			_cachedRevives[particle.networkID]["expireTime"] = Game.Timer() + _reviveLookupTable[particle.name]			
			local target = HPred:GetHeroByPosition(particle.pos)
			if target.isEnemy then				
				_cachedRevives[particle.networkID]["target"] = target
				_cachedRevives[particle.networkID]["pos"] = target.pos
				_cachedRevives[particle.networkID]["isEnemy"] = target.isEnemy	
			end
		end
		
		--Record blinks
		if particle and not _cachedBlinks[particle.networkID] and  _blinkLookupTable[particle.name] then
			_cachedBlinks[particle.networkID] = {}
			_cachedBlinks[particle.networkID]["expireTime"] = Game.Timer() + _reviveLookupTable[particle.name]			
			local target = HPred:GetHeroByPosition(particle.pos)
			if target.isEnemy then				
				_cachedBlinks[particle.networkID]["target"] = target
				_cachedBlinks[particle.networkID]["pos"] = target.pos
				_cachedBlinks[particle.networkID]["isEnemy"] = target.isEnemy	
			end
		end
	end
	
end

function HPred:GetEnemyNexusPosition()
	--This is slightly wrong. It represents fountain not the nexus. Fix later.
	if myHero.team == 100 then return Vector(14340, 171.977722167969, 14390); else return Vector(396,182.132507324219,462); end
end


function HPred:GetGuarenteedTarget(source, range, delay, speed, radius, timingAccuracy, checkCollision)
	--Get hourglass enemies
	local target, aimPosition =self:GetHourglassTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	if target and aimPosition then
		return target, aimPosition
	end
	
	--Get reviving target
	local target, aimPosition =self:GetRevivingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	if target and aimPosition then
		return target, aimPosition
	end	
	
	--Get teleporting enemies
	local target, aimPosition =self:GetTeleportingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)	
	if target and aimPosition then
		return target, aimPosition
	end
	
	--Get stunned enemies
	local target, aimPosition =self:GetImmobileTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	if target and aimPosition then
		return target, aimPosition
	end
end


function HPred:GetReliableTarget(source, range, delay, speed, radius, timingAccuracy, checkCollision)
	--TODO: Target whitelist. This will target anyone which is definitely not what we want
	--For now we can handle in the champ script. That will cause issues with multiple people in range who are goood targets though.
	
	
	--Get hourglass enemies
	local target, aimPosition =self:GetHourglassTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	if target and aimPosition then
		return target, aimPosition
	end
	
	--Get reviving target
	local target, aimPosition =self:GetRevivingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	if target and aimPosition then
		return target, aimPosition
	end
	
	--Get channeling enemies
	--local target, aimPosition =self:GetChannelingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	--	if target and aimPosition then
	--	return target, aimPosition
	--end
	
	--Get teleporting enemies
	local target, aimPosition =self:GetTeleportingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)	
	if target and aimPosition then
		return target, aimPosition
	end
	
	--Get instant dash enemies
	local target, aimPosition =self:GetInstantDashTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	if target and aimPosition then
		return target, aimPosition
	end	
	
	--Get dashing enemies
	local target, aimPosition =self:GetDashingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius, midDash)
	if target and aimPosition then
		return target, aimPosition
	end
	
	--Get stunned enemies
	local target, aimPosition =self:GetImmobileTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	if target and aimPosition then
		return target, aimPosition
	end
	
	--Get blink targets
	local target, aimPosition =self:GetBlinkTarget(source, range, speed, delay, checkCollision, radius)
	if target and aimPosition then
		return target, aimPosition
	end	
end

--Will return how many allies or enemies will be hit by a linear spell based on current waypoint data.
function HPred:GetLineTargetCount(source, aimPos, delay, speed, width, targetAllies)
	local targetCount = 0
	for i = 1, LocalGameHeroCount() do
		local t = LocalGameHero(i)
		if t and self:CanTargetALL(t) and ( targetAllies or t.isEnemy) then
			
			local predictedPos = self:PredictUnitPosition(t, delay+ self:GetDistance(source, t.pos) / speed)
			local proj1, pointLine, isOnSegment = self:VectorPointProjectionOnLineSegment(source, aimPos, predictedPos)
			if proj1 and isOnSegment and (self:GetDistanceSqr(predictedPos, proj1) <= (t.boundingRadius + width) * (t.boundingRadius + width)) then
				targetCount = targetCount + 1
			end
		end
	end
	return targetCount
end

--Will return the valid target who has the highest hit chance and meets all conditions (minHitChance, whitelist check, etc)
function HPred:GetUnreliableTarget(source, range, delay, speed, radius, checkCollision, minimumHitChance, whitelist, isLine)
	local _validTargets = {}
	for i = 1, LocalGameHeroCount() do
		local t = LocalGameHero(i)		
		if t and self:CanTarget(t, true) and (not whitelist or whitelist[t.charName]) then
			local hitChance, aimPosition = self:GetHitchance(source, t, range, delay, speed, radius, checkCollision, isLine)		
			if hitChance >= minimumHitChance then
				_insert(_validTargets, {aimPosition,hitChance, hitChance * 100 + self:CalculateMagicDamage(t, 400)})
			end
		end
	end	
	_sort(_validTargets, function( a, b ) return a[3] >b[3] end)	
	if #_validTargets > 0 then	
		return _validTargets[1][2], _validTargets[1][1]
	end
end

function HPred:GetHitchance(source, target, range, delay, speed, radius, checkCollision, isLine)

	if isLine == nil and checkCollision then
		isLine = true
	end
	
	local hitChance = 1
	local aimPosition = self:PredictUnitPosition(target, delay + self:GetDistance(source, target.pos) / speed)	
	local interceptTime = self:GetSpellInterceptTime(source, aimPosition, delay, speed)
	local reactionTime = self:PredictReactionTime(target, .1, isLine)
	
	--Check if they are walking the same path as the line or very close to it
	if isLine then
		local pathVector = aimPosition - target.pos
		local castVector = (aimPosition - myHero.pos):Normalized()
		if pathVector.x + pathVector.z ~= 0 then
			pathVector = pathVector:Normalized()
			if pathVector:DotProduct(castVector) < -.85 or pathVector:DotProduct(castVector) > .85 then
				if speed > 3000 then
					reactionTime = reactionTime + .25
				else
					reactionTime = reactionTime + .15
				end
			end
		end
	end			

	--If they are standing still give a higher accuracy because they have to take actions to react to it
	if not target.pathing or not target.pathing.hasMovePath then
		hitChancevisionData = 2
	end	
	
	
	local origin,movementRadius = self:UnitMovementBounds(target, interceptTime, reactionTime)
	--Our spell is so wide or the target so slow or their reaction time is such that the spell will be nearly impossible to avoid
	if movementRadius - target.boundingRadius <= radius /2 then
		origin,movementRadius = self:UnitMovementBounds(target, interceptTime, 0)
		if movementRadius - target.boundingRadius <= radius /2 then
			hitChance = 4
		else		
			hitChance = 3
		end
	end	
	
	--If they are casting a spell then the accuracy will be fairly high. if the windup is longer than our delay then it's quite likely to hit. 
	--Ideally we would predict where they will go AFTER the spell finishes but that's beyond the scope of this prediction
	if target.activeSpell and target.activeSpell.valid then
		if target.activeSpell.startTime + target.activeSpell.windup - Game.Timer() >= delay then
			hitChance = 5
		else			
			hitChance = 3
		end
	end
	
	local visionData = HPred:OnVision(target)
	if visionData and visionData.visible == false then
		local hiddenTime = visionData.tick -GetTickCount()
		if hiddenTime < -1000 then
			hitChance = -1
		else
			local targetSpeed = self:GetTargetMS(target)
			local unitPos = target.pos + Vector(target.pos,target.posTo):Normalized() * ((GetTickCount() - visionData.tick)/1000 * targetSpeed)
			local aimPosition = unitPos + Vector(target.pos,target.posTo):Normalized() * (targetSpeed * (delay + (self:GetDistance(myHero.pos,unitPos)/speed)))
			if self:GetDistance(target.pos,aimPosition) > self:GetDistance(target.pos,target.posTo) then aimPosition = target.posTo end
			hitChance = _min(hitChance, 2)
		end
	end
	
	--Check for out of range
	if not self:IsInRange(source, aimPosition, range) then
		hitChance = -1
	end
	
	--Check minion block
	if hitChance > 0 and checkCollision then
		if self:IsWindwallBlocking(source, aimPosition) then
			hitChance = -1		
		elseif self:CheckMinionCollision(source, aimPosition, delay, speed, radius) then
			hitChance = -1
		end
	end
	
	return hitChance, aimPosition
end

function HPred:PredictReactionTime(unit, minimumReactionTime)
	local reactionTime = minimumReactionTime
	
	--If the target is auto attacking increase their reaction time by .15s - If using a skill use the remaining windup time
	if unit.activeSpell and unit.activeSpell.valid then
		local windupRemaining = unit.activeSpell.startTime + unit.activeSpell.windup - Game.Timer()
		if windupRemaining > 0 then
			reactionTime = windupRemaining
		end
	end	
	return reactionTime
end

function HPred:GetDashingTarget(source, range, delay, speed, dashThreshold, checkCollision, radius, midDash)

	local target
	local aimPosition
	for i = 1, LocalGameHeroCount() do
		local t = LocalGameHero(i)
		if t and t.isEnemy and t.pathing.hasMovePath and t.pathing.isDashing and t.pathing.dashSpeed>500  then
			local dashEndPosition = t:GetPath(1)
			if self:IsInRange(source, dashEndPosition, range) then				
				--The dash ends within range of our skill. We now need to find if our spell can connect with them very close to the time their dash will end
				local dashTimeRemaining = self:GetDistance(t.pos, dashEndPosition) / t.pathing.dashSpeed
				local skillInterceptTime = self:GetSpellInterceptTime(source, dashEndPosition, delay, speed)
				local deltaInterceptTime =skillInterceptTime - dashTimeRemaining
				if deltaInterceptTime > 0 and deltaInterceptTime < dashThreshold and (not checkCollision or not self:CheckMinionCollision(source, dashEndPosition, delay, speed, radius)) then
					target = t
					aimPosition = dashEndPosition
					return target, aimPosition
				end
			end			
		end
	end
end

function HPred:GetHourglassTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	local target
	local aimPosition
	for i = 1, LocalGameHeroCount() do
		local t = LocalGameHero(i)
		if t and t.isEnemy then		
			local success, timeRemaining = self:HasBuff(t, "zhonyasringshield")
			if success then
				local spellInterceptTime = self:GetSpellInterceptTime(source, t.pos, delay, speed)
				local deltaInterceptTime = spellInterceptTime - timeRemaining
				if spellInterceptTime > timeRemaining and deltaInterceptTime < timingAccuracy and (not checkCollision or not self:CheckMinionCollision(source, interceptPosition, delay, speed, radius)) then
					target = t
					aimPosition = t.pos
					return target, aimPosition
				end
			end
		end
	end
end

function HPred:GetRevivingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	local target
	local aimPosition
	for _, revive in pairs(_cachedRevives) do	
		if revive.isEnemy then
			local interceptTime = self:GetSpellInterceptTime(source, revive.pos, delay, speed)
			if interceptTime > revive.expireTime - Game.Timer() and interceptTime - revive.expireTime - Game.Timer() < timingAccuracy then
				target = revive.target
				aimPosition = revive.pos
				return target, aimPosition
			end
		end
	end	
end

function HPred:GetInstantDashTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	local target
	local aimPosition
	for i = 1, LocalGameHeroCount() do
		local t = LocalGameHero(i)
		if t and t.isEnemy and t.activeSpell and t.activeSpell.valid and _blinkSpellLookupTable[t.activeSpell.name] then
			local windupRemaining = t.activeSpell.startTime + t.activeSpell.windup - Game.Timer()
			if windupRemaining > 0 then
				local endPos
				local blinkRange = _blinkSpellLookupTable[t.activeSpell.name]
				if type(blinkRange) == "table" then
					--Find the nearest matching particle to our mouse
					--local target, distance = self:GetNearestParticleByNames(t.pos, blinkRange)
					--if target and distance < 250 then					
					--	endPos = target.pos		
					--end
				elseif blinkRange > 0 then
					endPos = Vector(t.activeSpell.placementPos.x, t.activeSpell.placementPos.y, t.activeSpell.placementPos.z)					
					endPos = t.activeSpell.startPos + (endPos- t.activeSpell.startPos):Normalized() * _min(self:GetDistance(t.activeSpell.startPos,endPos), range)
				else
					local blinkTarget = self:GetObjectByHandle(t.activeSpell.target)
					if blinkTarget then				
						local offsetDirection						
						
						--We will land in front of our target relative to our starting position
						if blinkRange == 0 then				

							if t.activeSpell.name ==  "AlphaStrike" then
								windupRemaining = windupRemaining + .75
								--TODO: Boost the windup time by the number of targets alpha will hit. Need to calculate the exact times this is just rough testing right now
							end						
							offsetDirection = (blinkTarget.pos - t.pos):Normalized()
						--We will land behind our target relative to our starting position
						elseif blinkRange == -1 then						
							offsetDirection = (t.pos-blinkTarget.pos):Normalized()
						--They can choose which side of target to come out on , there is no way currently to read this data so we will only use this calculation if the spell radius is large
						elseif blinkRange == -255 then
							if radius > 250 then
								endPos = blinkTarget.pos
							end							
						end
						
						if offsetDirection then
							endPos = blinkTarget.pos - offsetDirection * blinkTarget.boundingRadius
						end
						
					end
				end	
				
				local interceptTime = self:GetSpellInterceptTime(source, endPos, delay,speed)
				local deltaInterceptTime = interceptTime - windupRemaining
				if self:IsInRange(source, endPos, range) and deltaInterceptTime < timingAccuracy and (not checkCollision or not self:CheckMinionCollision(source, endPos, delay, speed, radius)) then
					target = t
					aimPosition = endPos
					return target,aimPosition					
				end
			end
		end
	end
end

function HPred:GetBlinkTarget(source, range, speed, delay, checkCollision, radius)
	local target
	local aimPosition
	for _, particle in pairs(_cachedBlinks) do
		if particle  and self:IsInRange(source, particle.pos, range) then
			local t = particle.target
			local pPos = particle.pos
			if t and t.isEnemy and (not checkCollision or not self:CheckMinionCollision(source, pPos, delay, speed, radius)) then
				target = t
				aimPosition = pPos
				return target,aimPosition
			end
		end		
	end
end

function HPred:GetChannelingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	local target
	local aimPosition
	for i = 1, LocalGameHeroCount() do
		local t = LocalGameHero(i)
		if t then
			local interceptTime = self:GetSpellInterceptTime(source, t.pos, delay, speed)
			if self:CanTarget(t) and self:IsInRange(source, t.pos, range) and self:IsChannelling(t, interceptTime) and (not checkCollision or not self:CheckMinionCollision(source, t.pos, delay, speed, radius)) then
				target = t
				aimPosition = t.pos	
				return target, aimPosition
			end
		end
	end
end

function HPred:GetImmobileTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	local target
	local aimPosition
	for i = 1, LocalGameHeroCount() do
		local t = LocalGameHero(i)
		if t and self:CanTarget(t) and self:IsInRange(source, t.pos, range) then
			local immobileTime = self:GetImmobileTime(t)
			
			local interceptTime = self:GetSpellInterceptTime(source, t.pos, delay, speed)
			if immobileTime - interceptTime > timingAccuracy and (not checkCollision or not self:CheckMinionCollision(source, t.pos, delay, speed, radius)) then
				target = t
				aimPosition = t.pos
				return target, aimPosition
			end
		end
	end
end

function HPred:CacheTeleports()
	--Get enemies who are teleporting to towers
	for i = 1, LocalGameTurretCount() do
		local turret = LocalGameTurret(i);
		if turret and turret.isEnemy and not _cachedTeleports[turret.networkID] then
			local hasBuff, expiresAt = self:HasBuff(turret, "teleport_target")
			if hasBuff then
				self:RecordTeleport(turret, self:GetTeleportOffset(turret.pos,223.31),expiresAt)
			end
		end
	end	
	
	--Get enemies who are teleporting to wards	
	for i = 1, LocalGameWardCount() do
		local ward = LocalGameWard(i);
		if ward and ward.isEnemy and not _cachedTeleports[ward.networkID] then
			local hasBuff, expiresAt = self:HasBuff(ward, "teleport_target")
			if hasBuff then
				self:RecordTeleport(ward, self:GetTeleportOffset(ward.pos,100.01),expiresAt)
			end
		end
	end
	
	--Get enemies who are teleporting to minions
	for i = 1, LocalGameMinionCount() do
		local minion = LocalGameMinion(i);
		if minion and minion.isEnemy and not _cachedTeleports[minion.networkID] then
			local hasBuff, expiresAt = self:HasBuff(minion, "teleport_target")
			if hasBuff then
				self:RecordTeleport(minion, self:GetTeleportOffset(minion.pos,143.25),expiresAt)
			end
		end
	end	
end

function HPred:RecordTeleport(target, aimPos, endTime)
	_cachedTeleports[target.networkID] = {}
	_cachedTeleports[target.networkID]["target"] = target
	_cachedTeleports[target.networkID]["aimPos"] = aimPos
	_cachedTeleports[target.networkID]["expireTime"] = endTime + Game.Timer()
end


function HPred:CalculateIncomingDamage()
	_incomingDamage = {}
	local currentTime = Game.Timer()
	for _, missile in pairs(_cachedMissiles) do
		if missile then 
			local dist = self:GetDistance(missile.data.pos, missile.target.pos)			
			if missile.name == "" or currentTime >= missile.timeout or dist < missile.target.boundingRadius then
				_cachedMissiles[_] = nil
			else
				if not _incomingDamage[missile.target.networkID] then
					_incomingDamage[missile.target.networkID] = missile.damage
				else
					_incomingDamage[missile.target.networkID] = _incomingDamage[missile.target.networkID] + missile.damage
				end
			end
		end
	end	
end

function HPred:GetIncomingDamage(target)
	local damage = 0
	if _incomingDamage[target.networkID] then
		damage = _incomingDamage[target.networkID]
	end
	return damage
end


local _maxCacheRange = 3000

--Right now only used to cache enemy windwalls
function HPred:CacheParticles()	
	if _windwall and _windwall.name == "" then
		_windwall = nil
	end
	
	for i = 1, LocalGameParticleCount() do
		local particle = LocalGameParticle(i)		
		if particle and self:IsInRange(particle.pos, myHero.pos, _maxCacheRange) then			
			if _find(particle.name, "W_windwall%d") and not _windwall then
				--We don't care about ally windwalls for now
				local owner =  self:GetObjectByHandle(particle.handle)
				if owner and owner.isEnemy then
					_windwall = particle
					_windwallStartPos = Vector(particle.pos.x, particle.pos.y, particle.pos.z)				
					
					local index = _len(particle.name) - 5
					local spellLevel = _sub(particle.name, index, index) -1
					--Simple fix
					if type(spellLevel) ~= "number" then
						spellLevel = 1
					end
					_windwallWidth = 150 + spellLevel * 25					
				end
			end
		end
	end
end

function HPred:CacheMissiles()
	local currentTime = Game.Timer()
	for i = 1, LocalGameMissileCount() do
		local missile = LocalGameMissile(i)
		if missile and not _cachedMissiles[missile.networkID] and missile.missileData then
			--Handle targeted missiles
			if missile.missileData.target and missile.missileData.owner then
				local missileName = missile.missileData.name
				local owner =  self:GetObjectByHandle(missile.missileData.owner)	
				local target =  self:GetObjectByHandle(missile.missileData.target)		
				if owner and target and _find(target.type, "Hero") then			
					--The missile is an auto attack of some sort that is targeting a player	
					if (_find(missileName, "BasicAttack") or _find(missileName, "CritAttack")) then
						--Cache it all and update the count
						_cachedMissiles[missile.networkID] = {}
						_cachedMissiles[missile.networkID].target = target
						_cachedMissiles[missile.networkID].data = missile
						_cachedMissiles[missile.networkID].danger = 1
						_cachedMissiles[missile.networkID].timeout = currentTime + 1.5
						
						local damage = owner.totalDamage
						if _find(missileName, "CritAttack") then
							--Leave it rough we're not that concerned
							damage = damage * 1.5
						end						
						_cachedMissiles[missile.networkID].damage = self:CalculatePhysicalDamage(target, damage)
					end
				end
			end
		end
	end
end

function HPred:CalculatePhysicalDamage(target, damage)			
	local targetArmor = target.armor * myHero.armorPenPercent - myHero.armorPen
	local damageReduction = 100 / ( 100 + targetArmor)
	if targetArmor < 0 then
		damageReduction = 2 - (100 / (100 - targetArmor))
	end		
	damage = damage * damageReduction	
	return damage
end

function HPred:CalculateMagicDamage(target, damage)			
	local targetMR = target.magicResist * myHero.magicPenPercent - myHero.magicPen
	local damageReduction = 100 / ( 100 + targetMR)
	if targetMR < 0 then
		damageReduction = 2 - (100 / (100 - targetMR))
	end		
	damage = damage * damageReduction
	
	return damage
end


function HPred:GetTeleportingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)

	local target
	local aimPosition
	for _, teleport in pairs(_cachedTeleports) do
		if teleport.expireTime > Game.Timer() and self:IsInRange(source,teleport.aimPos, range) then			
			local spellInterceptTime = self:GetSpellInterceptTime(source, teleport.aimPos, delay, speed)
			local teleportRemaining = teleport.expireTime - Game.Timer()
			if spellInterceptTime > teleportRemaining and spellInterceptTime - teleportRemaining <= timingAccuracy and (not checkCollision or not self:CheckMinionCollision(source, teleport.aimPos, delay, speed, radius)) then								
				target = teleport.target
				aimPosition = teleport.aimPos
				return target, aimPosition
			end
		end
	end		
end

function HPred:GetTargetMS(target)
	local ms = target.pathing.isDashing and target.pathing.dashSpeed or target.ms
	return ms
end

function HPred:Angle(A, B)
	local deltaPos = A - B
	local angle = _atan(deltaPos.x, deltaPos.z) *  180 / _pi	
	if angle < 0 then angle = angle + 360 end
	return angle
end

--Returns where the unit will be when the delay has passed given current pathing information. This assumes the target makes NO CHANGES during the delay.
function HPred:PredictUnitPosition(unit, delay)
	local predictedPosition = unit.pos
	local timeRemaining = delay
	local pathNodes = self:GetPathNodes(unit)
	for i = 1, #pathNodes -1 do
		local nodeDistance = self:GetDistance(pathNodes[i], pathNodes[i +1])
		local nodeTraversalTime = nodeDistance / self:GetTargetMS(unit)
			
		if timeRemaining > nodeTraversalTime then
			--This node of the path will be completed before the delay has finished. Move on to the next node if one remains
			timeRemaining =  timeRemaining - nodeTraversalTime
			predictedPosition = pathNodes[i + 1]
		else
			local directionVector = (pathNodes[i+1] - pathNodes[i]):Normalized()
			predictedPosition = pathNodes[i] + directionVector *  self:GetTargetMS(unit) * timeRemaining
			break;
		end
	end
	return predictedPosition
end

function HPred:IsChannelling(target, interceptTime)
	if target.activeSpell and target.activeSpell.valid and target.activeSpell.isChanneling then
		return true
	end
end

function HPred:HasBuff(target, buffName, minimumDuration)
	local duration = minimumDuration
	if not minimumDuration then
		duration = 0
	end
	local durationRemaining
	for i = 1, target.buffCount do 
		local buff = target:GetBuff(i)
		if buff.duration > duration and buff.name == buffName then
			durationRemaining = buff.duration
			return true, durationRemaining
		end
	end
end

--Moves an origin towards the enemy team nexus by magnitude
function HPred:GetTeleportOffset(origin, magnitude)
	local teleportOffset = origin + (self:GetEnemyNexusPosition()- origin):Normalized() * magnitude
	return teleportOffset
end

function HPred:GetSpellInterceptTime(startPos, endPos, delay, speed)	
	local interceptTime = Game.Latency()/2000 + delay + self:GetDistance(startPos, endPos) / speed
	return interceptTime
end

--Checks if a target can be targeted by abilities or auto attacks currently.
--CanTarget(target)
	--target : gameObject we are trying to hit
function HPred:CanTarget(target, allowInvisible)
	return target.isEnemy and target.alive and target.health > 0  and (allowInvisible or target.visible) and target.isTargetable
end

--Derp: dont want to fuck with the isEnemy checks elsewhere. This will just let us know if the target can actually be hit by something even if its an ally
function HPred:CanTargetALL(target)
	return target.alive and target.health > 0 and target.visible and target.isTargetable
end

--Returns a position and radius in which the target could potentially move before the delay ends. ReactionTime defines how quick we expect the target to be able to change their current path
function HPred:UnitMovementBounds(unit, delay, reactionTime)
	local startPosition = self:PredictUnitPosition(unit, delay)
	
	local radius = 0
	local deltaDelay = delay -reactionTime- self:GetImmobileTime(unit)	
	if (deltaDelay >0) then
		radius = self:GetTargetMS(unit) * deltaDelay	
	end
	return startPosition, radius	
end

--Returns how long (in seconds) the target will be unable to move from their current location
function HPred:GetImmobileTime(unit)
	local duration = 0
	for i = 0, unit.buffCount do
		local buff = unit:GetBuff(i);
		if buff.count > 0 and buff.duration> duration and (buff.type == 5 or buff.type == 8 or buff.type == 21 or buff.type == 22 or buff.type == 24 or buff.type == 11 or buff.type == 29 or buff.type == 30 or buff.type == 39 ) then
			duration = buff.duration
		end
	end
	return duration		
end

--Returns how long (in seconds) the target will be slowed for
function HPred:GetSlowedTime(unit)
	local duration = 0
	for i = 0, unit.buffCount do
		local buff = unit:GetBuff(i);
		if buff.count > 0 and buff.duration > duration and buff.type == 10 then
			duration = buff.duration			
			return duration
		end
	end
	return duration		
end

--Returns all existing path nodes
function HPred:GetPathNodes(unit)
	local nodes = {}
	table.insert(nodes, unit.pos)
	if unit.pathing.hasMovePath then
		for i = unit.pathing.pathIndex, unit.pathing.pathCount do
			path = unit:GetPath(i)
			table.insert(nodes, path)
		end
	end		
	return nodes
end

--Finds any game object with the correct handle to match (hero, minion, wards on either team)
function HPred:GetObjectByHandle(handle)
	local target
	for i = 1, LocalGameHeroCount() do
		local enemy = LocalGameHero(i)
		if enemy and enemy.handle == handle then
			target = enemy
			return target
		end
	end
	
	for i = 1, LocalGameMinionCount() do
		local minion = LocalGameMinion(i)
		if minion and minion.handle == handle then
			target = minion
			return target
		end
	end
	
	for i = 1, LocalGameWardCount() do
		local ward = LocalGameWard(i);
		if ward and ward.handle == handle then
			target = ward
			return target
		end
	end
	
	for i = 1, LocalGameTurretCount() do 
		local turret = LocalGameTurret(i)
		if turret and turret.handle == handle then
			target = turret
			return target
		end
	end
	
	for i = 1, LocalGameParticleCount() do 
		local particle = LocalGameParticle(i)
		if particle and particle.handle == handle then
			target = particle
			return target
		end
	end
end

function HPred:GetHeroByPosition(position)
	local target
	for i = 1, LocalGameHeroCount() do
		local enemy = LocalGameHero(i)
		if enemy and enemy.pos.x == position.x and enemy.pos.y == position.y and enemy.pos.z == position.z then
			target = enemy
			return target
		end
	end
end

function HPred:GetObjectByPosition(position)
	local target
	for i = 1, LocalGameHeroCount() do
		local enemy = LocalGameHero(i)
		if enemy and enemy.pos.x == position.x and enemy.pos.y == position.y and enemy.pos.z == position.z then
			target = enemy
			return target
		end
	end
	
	for i = 1, LocalGameMinionCount() do
		local enemy = LocalGameMinion(i)
		if enemy and enemy.pos.x == position.x and enemy.pos.y == position.y and enemy.pos.z == position.z then
			target = enemy
			return target
		end
	end
	
	for i = 1, LocalGameWardCount() do
		local enemy = LocalGameWard(i);
		if enemy and enemy.pos.x == position.x and enemy.pos.y == position.y and enemy.pos.z == position.z then
			target = enemy
			return target
		end
	end
	
	for i = 1, LocalGameParticleCount() do 
		local enemy = LocalGameParticle(i)
		if enemy and enemy.pos.x == position.x and enemy.pos.y == position.y and enemy.pos.z == position.z then
			target = enemy
			return target
		end
	end
end

function HPred:GetEnemyHeroByHandle(handle)	
	local target
	for i = 1, LocalGameHeroCount() do
		local enemy = LocalGameHero(i)
		if enemy and enemy.handle == handle then
			target = enemy
			return target
		end
	end
end

--Finds the closest particle to the origin that is contained in the names array
function HPred:GetNearestParticleByNames(origin, names)
	local target
	local distance = 999999
	for i = 1, LocalGameParticleCount() do 
		local particle = LocalGameParticle(i)
		if particle then 
			local d = self:GetDistance(origin, particle.pos)
			if d < distance then
				distance = d
				target = particle
			end
		end
	end
	return target, distance
end

--Returns the total distance of our current path so we can calculate how long it will take to complete
function HPred:GetPathLength(nodes)
	local result = 0
	for i = 1, #nodes -1 do
		result = result + self:GetDistance(nodes[i], nodes[i + 1])
	end
	return result
end


--I know this isn't efficient but it works accurately... Leaving it for now.
function HPred:CheckMinionCollision(origin, endPos, delay, speed, radius, frequency)
		
	if not frequency then
		frequency = radius
	end
	local directionVector = (endPos - origin):Normalized()
	local checkCount = self:GetDistance(origin, endPos) / frequency
	for i = 1, checkCount do
		local checkPosition = origin + directionVector * i * frequency
		local checkDelay = delay + self:GetDistance(origin, checkPosition) / speed
		if self:IsMinionIntersection(checkPosition, radius, checkDelay, radius * 3) then
			return true
		end
	end
	return false
end


function HPred:IsMinionIntersection(location, radius, delay, maxDistance)
	if not maxDistance then
		maxDistance = 500
	end
	for i = 1, LocalGameMinionCount() do
		local minion = LocalGameMinion(i)
		if minion and self:CanTarget(minion) and self:IsInRange(minion.pos, location, maxDistance) then
			local predictedPosition = self:PredictUnitPosition(minion, delay)
			if self:IsInRange(location, predictedPosition, radius + minion.boundingRadius) then
				return true
			end
		end
	end
	return false
end

function HPred:VectorPointProjectionOnLineSegment(v1, v2, v)
	assert(v1 and v2 and v, "VectorPointProjectionOnLineSegment: wrong argument types (3 <Vector> expected)")
	local cx, cy, ax, ay, bx, by = v.x, (v.z or v.y), v1.x, (v1.z or v1.y), v2.x, (v2.z or v2.y)
	local rL = ((cx - ax) * (bx - ax) + (cy - ay) * (by - ay)) / ((bx - ax) * (bx - ax) + (by - ay) * (by - ay))
	local pointLine = { x = ax + rL * (bx - ax), y = ay + rL * (by - ay) }
	local rS = rL < 0 and 0 or (rL > 1 and 1 or rL)
	local isOnSegment = rS == rL
	local pointSegment = isOnSegment and pointLine or { x = ax + rS * (bx - ax), y = ay + rS * (by - ay) }
	return pointSegment, pointLine, isOnSegment
end

--Determines if there is a windwall between the source and target pos. 
function HPred:IsWindwallBlocking(source, target)
	if _windwall then
		local windwallFacing = (_windwallStartPos-_windwall.pos):Normalized()
		return self:DoLineSegmentsIntersect(source, target, _windwall.pos + windwallFacing:Perpendicular() * _windwallWidth, _windwall.pos + windwallFacing:Perpendicular2() * _windwallWidth)
	end	
	return false
end
--Returns if two line segments cross eachother. AB is segment 1, CD is segment 2.
function HPred:DoLineSegmentsIntersect(A, B, C, D)

	local o1 = self:GetOrientation(A, B, C)
	local o2 = self:GetOrientation(A, B, D)
	local o3 = self:GetOrientation(C, D, A)
	local o4 = self:GetOrientation(C, D, B)
	
	if o1 ~= o2 and o3 ~= o4 then
		return true
	end
	
	if o1 == 0 and self:IsOnSegment(A, C, B) then return true end
	if o2 == 0 and self:IsOnSegment(A, D, B) then return true end
	if o3 == 0 and self:IsOnSegment(C, A, D) then return true end
	if o4 == 0 and self:IsOnSegment(C, B, D) then return true end
	
	return false
end

--Determines the orientation of ordered triplet
--0 = Colinear
--1 = Clockwise
--2 = CounterClockwise
function HPred:GetOrientation(A,B,C)
	local val = (B.z - A.z) * (C.x - B.x) -
		(B.x - A.x) * (C.z - B.z)
	if val == 0 then
		return 0
	elseif val > 0 then
		return 1
	else
		return 2
	end
	
end

function HPred:IsOnSegment(A, B, C)
	return B.x <= _max(A.x, C.x) and 
		B.x >= _min(A.x, C.x) and
		B.z <= _max(A.z, C.z) and
		B.z >= _min(A.z, C.z)
end

--Gets the slope between two vectors. Ignores Y because it is non-needed height data. Its all 2d math.
function HPred:GetSlope(A, B)
	return (B.z - A.z) / (B.x - A.x)
end

function HPred:GetEnemyByName(name)
	local target
	for i = 1, LocalGameHeroCount() do
		local enemy = LocalGameHero(i)
		if enemy and enemy.isEnemy and enemy.charName == name then
			target = enemy
			return target
		end
	end
end

function HPred:IsPointInArc(source, origin, target, angle, range)
	local deltaAngle = _abs(HPred:Angle(origin, target) - HPred:Angle(source, origin))
	if deltaAngle < angle and self:IsInRange(origin,target,range) then
		return true
	end
end

function HPred:GetDistanceSqr(p1, p2)
	if not p1 or not p2 then
		local dInfo = debug.getinfo(2)
		print("Undefined GetDistanceSqr target. Please report. Method: " .. dInfo.name .. "  Line: " .. dInfo.linedefined)
		return _huge
	end
	return (p1.x - p2.x) *  (p1.x - p2.x) + ((p1.z or p1.y) - (p2.z or p2.y)) * ((p1.z or p1.y) - (p2.z or p2.y)) 
end

function HPred:IsInRange(p1, p2, range)
	if not p1 or not p2 then
		local dInfo = debug.getinfo(2)
		print("Undefined IsInRange target. Please report. Method: " .. dInfo.name .. "  Line: " .. dInfo.linedefined)
		return false
	end
	return (p1.x - p2.x) *  (p1.x - p2.x) + ((p1.z or p1.y) - (p2.z or p2.y)) * ((p1.z or p1.y) - (p2.z or p2.y)) < range * range 
end

function HPred:GetDistance(p1, p2)
	if not p1 or not p2 then
		local dInfo = debug.getinfo(2)
		print("Undefined GetDistance target. Please report. Method: " .. dInfo.name .. "  Line: " .. dInfo.linedefined)
		return _huge
	end
	return _sqrt(self:GetDistanceSqr(p1, p2))
end
	


function OnLoad()
	Morgana()
	LoadUnits()
end
	
  
















