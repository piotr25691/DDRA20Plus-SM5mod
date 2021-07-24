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

t[#t+1] = LoadActor( THEME:GetPathB("","optionicon_P1") ) .. {
		InitCommand=cmd(player,PLAYER_1;zoomx,1.95;zoomy,1.95;x,SCREEN_CENTER_X-448.5;draworder,1);
		OnCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
				self:y(SCREEN_CENTER_Y-259);
			else
				self:y(SCREEN_CENTER_Y+246);
			end;
		end;
		-- CurrentSongChangedMessageCommand=function(self)
			-- if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
				-- self:y(SCREEN_CENTER_Y-257);
			-- else
				-- self:y(SCREEN_CENTER_Y+252);
			-- end;
		-- end;
	};
t[#t+1] = LoadActor( THEME:GetPathB("","optionicon_P2") ) .. {
		InitCommand=cmd(player,PLAYER_2;zoomx,1.95;zoomy,1.95;x,SCREEN_CENTER_X+473;draworder,1);
		OnCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
				self:y(SCREEN_CENTER_Y-259);
			else
				self:y(SCREEN_CENTER_Y+246);
			end;
		end;
		--CurrentSongChangedMessageCommand=cmd(playcommand,"On");
	};
t[#t+1] = LoadFont("_dispatrox 32px")..{

			InitCommand=function(self)

				local dispnameP1 = PROFILEMAN:GetProfile(PLAYER_1):GetDisplayName();
				local dispnamelengthP1 = string.len(dispnameP1);

				self:player(PLAYER_1);
				self:horizalign(center);
				self:settext(string.upper(dispnameP1));

				local st_allsteps = "";
				--int NoteData::GetNumTapNotes 	(  	int  	iStartIndex = 0,
		--int  	iEndIndex = MAX_NOTE_ROW
	--)  	const


				--self:settext(st_allsteps);


				self:x(SCREEN_CENTER_X-355-30+13);self:y(SCREEN_CENTER_Y+272.5);
				self:draworder(50);
				self:diffuse(color("#feec0a"));
				self:zoomy(0.65);

				if dispnamelengthP1 >= 8 then
					--expand
					self:maxwidth(80);
					self:zoomx(1.64);
				else
					--constant width
					self:zoomx(0.9);
				end;

			end;

			OnCommand=function(self)
				if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
					self:addx(0)
					self:y(SCREEN_CENTER_Y-286);
				end;
				if GAMESTATE:IsDemonstration() then
					self:diffusealpha(1);
				else
					self:diffusealpha(0);
					self:linear(0.5);
					self:diffusealpha(1);
				end;
			end;
	};
t[#t+1] = LoadFont("_dispatrox 32px")..{

	InitCommand=function(self)

		local dispnameP2 = PROFILEMAN:GetProfile(PLAYER_2):GetDisplayName();
		local dispnamelengthP2 = string.len(dispnameP2);

		self:player(PLAYER_2);
		self:horizalign(center);
		self:settext(string.upper(dispnameP2));
		self:x(SCREEN_CENTER_X+356+170.3);self:y(SCREEN_CENTER_Y+272.5);
		self:draworder(50);
		self:diffuse(color("#feec0a"));
		self:zoomy(0.65);

		if dispnamelengthP2 >= 8 then
			--expand
			self:maxwidth(80);
			self:zoomx(1.64);
		else
			--constant width
			self:zoomx(0.9);
		end;

	end;

	OnCommand=function(self)
		if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
			self:addx(0);
			self:y(SCREEN_CENTER_Y-286);
		end;
		if GAMESTATE:IsDemonstration() then
			self:diffusealpha(1);
		else
			self:diffusealpha(0);
			self:linear(0.5);
			self:diffusealpha(1);
		end;
	end;
};

return t