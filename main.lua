local CharactersReworkMod = RegisterMod("CharactersReworkMod",1)
local voiceofsatan1 = Isaac.GetSoundIdByName("Satan Voice1")
local satanWelcome = Isaac.GetSoundIdByName("Satan Welcome")
local talkCooldown = 0

function CharactersReworkMod:satanVoice(_CharactersReworkMod)
    local level = Game():GetLevel()
    local room = level:GetCurrentRoom()
    local sound = SFXManager()
    if room:GetBackdropType() == BackdropType.SHEOL 
       and not room:IsClear() 
       and room:GetType() ~= RoomType.ROOM_BOSS 
       
        -- Generar un número aleatorio para decidir si Satan habla
        local randomChance = math.random() -- Devuelve un valor entre 0 y 1
        if randomChance < 0.2 then -- 20% de probabilidad de que hable
            sound:Play(voiceofsatan1)
        end
    end

end

CharactersReworkMod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM,CharactersReworkMod.satanVoice)

function CharactersReworkMod:satanWelcome(_CharactersReworkMod)
    local level = Game():GetLevel()
    local room = level:GetCurrentRoom()
    if room:GetBackdropType() == BackdropType.SHEOL then
        SFXManager():Play(satanWelcome)
    end
end

CharactersReworkMod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL,CharactersReworkMod.satanWelcome)