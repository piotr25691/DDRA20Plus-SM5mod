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
----------------------------------------------------------------------------
return Def.ActorFrame {



Def.Sprite{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,2);
	OnCommand=function(self)
		
	self:Load(THEME:GetPathG("StageInformation/Stage","Blue BG" ));
	-- self:diffusealpha(0):zoom(3)
	-- :linear(0.264):diffusealpha(1):zoom(1.5):sleep(1.732):linear(0.04):zoomx(3):zoomy(0.1):sleep(0.1):zoomy(0):diffusealpha(0);
	-- end;
	
	self:diffusealpha(1);
	self:zoomx(2.25);
	self:zoomy(2.25);
	self:linear(0.2);
	self:diffusealpha(1);
	self:zoomx(2.5);
	self:zoomy(2.5);
	self:linear(0.1);
	self:diffusealpha(1);
	self:zoomx(2.3);
	self:zoomy(2.3);
	self:sleep(0.3);
	self:sleep(0.1);
	self:linear(0.1);
	self:zoomx(2.1);
	self:zoomy(2.1);
	self:sleep(0.85);
	self:linear(0.10);
	self:diffusealpha(0);
	self:zoomx(1.8*1.2);
	self:zoomy(0);
	end;
	};

	
Def.Sprite{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,3;);
	OnCommand=function(self)
	self:Load(THEME:GetPathG("StageInformation/Stage","Blue Line" ));
	self:diffusealpha(0);
	self:zoomx(0);
	self:sleep(0.1);
	self:linear(0.25);
	self:diffusealpha(1);
	self:zoomx(3);
	self:linear(0.25);
	self:diffusealpha(0);
	end;
	};


	Def.Sprite{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+5;zoom,1.4);
	OnCommand=function(self)
		-- if GAMESTATE:GetPlayMode() == 'PlayMode_Regular' or GAMESTATE:GetPlayMode() == 'PlayMode_Battle' or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then 
			self:Load(THEME:GetPathG("", "StageInformation/Stage " .. ToEnumShortString(sStage) ));
		-- elseif GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then
		-- 	self:Load(THEME:GetPathG("ScreenStageInformation", "Stage oni"));
		-- elseif GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then
		-- 	self:Load(THEME:GetPathG("ScreenStageInformation", "Stage Nonstop"));
		-- elseif (GAMESTATE:Env()).EndlessState then
		-- 	self:Load(THEME:GetPathG("ScreenStageInformation", "Stage endless"));
		-- end;
	-- self:diffusealpha(0):zoom(3)
	-- :linear(0.264):diffusealpha(1):zoom(1.5):sleep(1.732):linear(0.04):diffusealpha(0):zoomx(1.8):zoomy(0);
	self:diffusealpha(1)
	:linear(0.1):diffusealpha(1):zoomx(2):zoomy(2.4):linear(0.1):zoomx(2.4):zoomy(2):linear(0.15):zoomx(2.3):zoomy(2.3):sleep(0.3):linear(0.1):zoomx(1.45):zoomy(1.4):sleep(0.8):linear(0.10):diffusealpha(0.2):zoomx(1.8*2):zoomy(0);
	end;
	};
	
	Def.Sprite{
	InitCommand=cmd(x,SCREEN_CENTER_X-0;y,SCREEN_CENTER_Y;zoom,1;blend,Blend.Add);
	OnCommand=function(self)
			self:Load(THEME:GetPathG("", "StageInformation/Stage " .. ToEnumShortString(sStage) ));
	self:diffusealpha(0.5):zoom(3)
	:linear(0.1):diffusealpha(0.5):zoomx(2):zoomy(1.3):linear(0.1):zoomx(3):zoomy(3.3):linear(0.1):zoomx(4):zoomy(4.3):diffusealpha(0);
	end;
	};
	
};