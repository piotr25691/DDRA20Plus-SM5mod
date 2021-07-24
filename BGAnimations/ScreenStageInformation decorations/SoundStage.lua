local sStage = GAMESTATE:GetCurrentStage();
local tRemap = {
	Stage_1st		= 1,
	Stage_2nd		= 2,
	Stage_3rd		= 3,
	Stage_4th		= 4,
	Stage_5th		= 5,
	Stage_6th		= 6,
};
if tRemap[sStage] == PREFSMAN:GetPreference("SongsPerPlay") then
	sStage = "Stage_Final";
else
	sStage = sStage;
end;



local t = Def.ActorFrame{};
local song = GAMESTATE:GetCurrentSong();
function isExtraExclusive(STitle)
	if STitle == "ORCA" or STitle == "Splash Gold" then
		return true;
	else
		return false;
	end
end;


if GAMESTATE:IsEventMode() or (GAMESTATE:GetPlayMode()=='PlayMode_Oni') or (GAMESTATE:GetPlayMode()=='PlayMode_Nonstop') then
	SOUND:PlayAnnouncer("stage")
t[#t+1] = Def.ActorFrame {
	LoadActor("event") .. {		
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play);
	};
};
elseif GAMESTATE:GetCurrentStage() == 'Stage_1st' then
t[#t+1] = Def.ActorFrame {
	LoadActor("1st_stage") .. {		
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play);
	};
};
SOUND:PlayAnnouncer("stage")
elseif GAMESTATE:GetCurrentStage() == 'Stage_2nd' then
t[#t+1] = Def.ActorFrame {
	LoadActor("2nd_stage") .. {		
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play);
	};
};
SOUND:PlayAnnouncer("stage")
elseif GAMESTATE:GetCurrentStage() == 'Stage_3rd' and (PREFSMAN:GetPreference("SongsPerPlay") == 5 or PREFSMAN:GetPreference("SongsPerPlay") == 4) then
t[#t+1] = Def.ActorFrame {
	LoadActor("3rd_stage") .. {		
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play);
	};
};
SOUND:PlayAnnouncer("stage")
elseif GAMESTATE:GetCurrentStage() == 'Stage_4th' then
t[#t+1] = Def.ActorFrame {
	LoadActor("4th_stage") .. {		
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play);
	};
};
SOUND:PlayAnnouncer("stage")
elseif GAMESTATE:GetCurrentStage() == 'Stage_Final' then
t[#t+1] = Def.ActorFrame {
	LoadActor("Final_stage") .. {		
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play);
	};
};
SOUND:PlayAnnouncer("stage")
elseif GAMESTATE:IsExtraStage() then
t[#t+1] = Def.ActorFrame {
	LoadActor("Extra_stage") .. {		
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play);
	};
};
SOUND:PlayAnnouncer("stage")
elseif GAMESTATE:IsExtraStage2() then
t[#t+1] = Def.ActorFrame {
	LoadActor("Encore_Extra_stage") .. {		
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play);
	};
};
SOUND:PlayAnnouncer("stage")
end;

return t;