local t = Def.ActorFrame{
	Def.Sprite{
		Texture="base.png",
		InitCommand=function(s) s:FullScreen():diffusealpha(0) end,
	};
}
local customscore=GetCustomScoreMode();
local cscore="A20";
if not GAMESTATE:IsCourseMode() then
 local stepcnt={0,0}
 t[#t+1] = Def.Actor{
     JudgmentMessageCommand = function(self, params)
		if STATSMAN:GetCurStageStats():GetPlayerStageStats(params.Player):GetFailed() == false then
         if params.TapNoteScore and
          params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
          params.TapNoteScore ~= 'TapNoteScore_HitMine' and
          params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
          params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
          params.TapNoteScore ~= 'TapNoteScore_None'
         then
             if customscore=="old" then
                 Scoring[scoreType](params, 
                     STATSMAN:GetCurStageStats():GetPlayerStageStats(params.Player))
             elseif customscore=="5b2" then
                 local pn=((params.Player==PLAYER_1) and 1 or 2);
                 stepcnt[pn]=stepcnt[pn]+1;
                 CustomScore_SM5b2(params,cscore,GAMESTATE:GetCurrentSteps(params.Player),stepcnt[pn]);
             elseif customscore=="5b1" then
                 local pn=((params.Player==PLAYER_1) and 1 or 2);
                 stepcnt[pn]=stepcnt[pn]+1;
                 CustomScore_SM5b1(params,cscore,GAMESTATE:GetCurrentSteps(params.Player),stepcnt[pn]);
             else
                 local pn=((params.Player==PLAYER_1) and 1 or 2);
                 stepcnt[pn]=stepcnt[pn]+1;
                 CustomScore_SM5a2(params,cscore,GAMESTATE:GetCurrentSteps(params.Player),stepcnt[pn]);
             end;
         end
		 end
     end;
     InitCommand=function(self)
         if customscore=="non" then
             CustomScore_SM5a2_Init();
         end;
     end;
     OffCommand=function(self)
         if customscore=="non" then
             CustomScore_SM5a2_Out();
         end;
     end;
 };
 end;
 
 --JacketBG
t[#t+1] = LoadActor(ddrgame.."cdbg")..{
	OnCommand=cmd(x,SCREEN_RIGHT-240;y,SCREEN_CENTER_Y+8;zoom,1.9;draworder,1);
	OffCommand=cmd();
};
t[#t+1] = LoadActor(ddrgame.."songbg")..{
	OnCommand=cmd(x,SCREEN_RIGHT-240;y,SCREEN_CENTER_Y+202;zoom,1.9;draworder,1);
	OffCommand=cmd();
};

--Jacket
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_RIGHT-240;y,SCREEN_CENTER_Y+11;draworder,1);
	Def.Sprite {
		OnCommand=function (self)
			local course = GAMESTATE:GetCurrentCourse();
			if GAMESTATE:IsCourseMode() then
				if course:GetBackgroundPath() then
					self:Load(course:GetBackgroundPath())
					self:setsize(300,300);
				else
					self:Load(THEME:GetPathG("", "Common fallback jacket"));
					self:setsize(300,300);
				end;
			else
			local song = GAMESTATE:GetCurrentSong();
				if song then
					if song:HasJacket() then
						self:LoadBackground(song:GetJacketPath());
						self:setsize(300,300);
					elseif song:HasBanner() then
						self:LoadFromSongBanner(GAMESTATE:GetCurrentSong());
						self:setsize(300,300);
					else
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:setsize(300,300);
					end;
				else
					self:diffusealpha(0);
			end;
		end;
		end;
	OffCommand=cmd(sleep,0.2;bouncebegin,0.175;zoomy,0);
	};
};

--Song Information
t[#t+1] = LoadFont("_arial_black 18px") .. {
	CurrentSongChangedMessageCommand=cmd(playcommand,"Refresh");
	RefreshCommand=function(self)
		local vSong = GAMESTATE:GetCurrentSong();
		local vCourse = GAMESTATE:GetCurrentCourse();
		local sText = ""
		-- if vSong then
			sText = vSong:GetDisplayFullTitle()
		-- end
		-- if vCourse then
		-- 	sText = vSong:GetDisplayFullTitle()
		-- end
		self:zoom(1.1);
		self:settext( sText );
		self:horizalign(center);
		self:playcommand( "On" );
		self:maxwidth(220);
		self:x(SCREEN_RIGHT-240);
		self:y(SCREEN_CENTER_Y+195);
		self:draworder(1);
	end;
}

--Artist Information
t[#t+1] = LoadFont("_arial_black 18px") .. {
	CurrentSongChangedMessageCommand=cmd(playcommand,"Refresh");
	RefreshCommand=function(self)
		local vSong = GAMESTATE:GetCurrentSong();
		local vCourse = GAMESTATE:GetCurrentCourse();
		local sText = ""
		-- if vSong then
			sText = vSong:GetDisplayArtist()
		-- end
		-- if vCourse then
		-- 	sText = vSong:GetDisplayArtist()
		-- end
		self:zoom(0.8);
		self:settext( sText );
		self:horizalign(center);
		self:playcommand( "On" );
		self:maxwidth(220);
		self:x(SCREEN_RIGHT-240);
		self:y(SCREEN_CENTER_Y+215);
		self:draworder(1);
	end;
}

if ReadPrefFromFile("UserPrefGameplayShowFastSlow") ~= nil then
	if GetUserPrefB("UserPrefGameplayShowFastSlow") then
		t[#t+1] = LoadActor("TimingJudgements.lua")..{
			InitCommand=cmd(draworder,1);
		};
	end
end


t[#t+1] = LoadActor("OptionsHack.lua")..{
	InitCommand=cmd(draworder,1);
};

t[#t+1] = Def.ActorFrame{
	Def.Sprite{
		Name="StageFrame",
		Texture="stageframe/"..ddrgame.."stage_frame0000_normal",
		InitCommand=function(s)
			s:xy(_screen.cx,SCREEN_TOP+36):visible(not GAMESTATE:IsDemonstration())
		end,
	};
	
}
if not GAMESTATE:IsDemonstration() then
	t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")
	end

for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = LoadActor("lifeframe",pn);
end

t[#t+1] = StandardDecorationFromFile("ScoreFrame","ScoreFrame");

return t