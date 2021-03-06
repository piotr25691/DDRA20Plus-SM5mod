local pn = ...

local yspacing = 32;

local DiffList = Def.ActorFrame{};

local function DrawDiffListItem(diff)
  local DifficultyListItem = Def.ActorFrame{
    InitCommand=function(s)
      s:xy(pn==PLAYER_1 and 6 or -6,(Difficulty:Reverse()[diff] * yspacing)-80)
    end,
    SetCommand=function(self)
      local st=GAMESTATE:GetCurrentStyle():GetStepsType()
      local song=GAMESTATE:GetCurrentSong()
      if song then
        if song:HasStepsTypeAndDifficulty( st, diff ) then
          local steps = song:GetOneSteps( st, diff )
          self:visible(true)
        else
            self:visible(false)
        end
      else
        self:visible(false)
      end;
    end;
    Def.Quad{
      Name="Background";
      InitCommand=function(s) s:setsize(241,25):diffuse(Alpha(Color.Black,0.5)):draworder(0) end,
    };
    Def.BitmapText{
      Font="_dispatrox 32px",
      Name="DiffLabel";
      InitCommand=function(self)
        self:halign(pn=='pnNumber_P2' and 1 or 0):draworder(99):strokecolor(Color.Black):zoomx(0.5):zoomy(0.6):maxwidth(150)
        self:x(-119)
        self:settext(THEME:GetString("CustomDifficulty",ToEnumShortString(diff)))
      end;
    };
    Def.ActorFrame{
      InitCommand=function(s) s:x(pn==pn_2 and 26 or -26) end,
      Def.Quad{
        Name="MeterBG",
        InitCommand=function(s) s:setsize(25,25):diffuse(CustomDifficultyToColor(diff)) end,
      };
      Def.BitmapText{
        Font="_geo 95 20px",
        Name="Meter";
        InitCommand=function(s) s:draworder(99):strokecolor(Color.Black):y(-10):zoom(1.25) end,
        SetCommand=function(self)
          self:settext("")
          local st=GAMESTATE:GetCurrentStyle():GetStepsType()
          local song=GAMESTATE:GetCurrentSong()
          if song then
            if song:HasStepsTypeAndDifficulty( st, diff ) then
              local steps = song:GetOneSteps( st, diff )
              self:settext( steps:GetMeter() )
            end
          end;
        end;
      };
    };
    Def.BitmapText{
      Font="_geo 957 Bold",
      Name="Score";
      InitCommand=function(s) s:draworder(5):xy(74,-1):zoom(1.1):halign(1):maxwidth(75) end,
      SetCommand=function(self)
        self:settext("")

        local st=GAMESTATE:GetCurrentStyle():GetStepsType()
        local song=GAMESTATE:GetCurrentSong()
        if song then
          if song:HasStepsTypeAndDifficulty(st,diff) then
            local steps = song:GetOneSteps(st,diff)

            if PROFILEMAN:IsPersistentProfile(pn) then
              profile = PROFILEMAN:GetProfile(pn)
            else
              profile = PROFILEMAN:GetMachineProfile()
            end;

            scorelist = profile:GetHighScoreList(song,steps)
            local scores = scorelist:GetHighScores()
            local topscore = 0

            if scores[1] then
                topscore = scores[1]:GetScore()
            end;
            self:diffusealpha(1)

            if topscore ~= 0 then
                self:settext(commify(topscore))
            end;
          end;
        end;
      end;
    };
    Def.ActorFrame{
      InitCommand=function(s) s:x(90) end,
      LoadActor(THEME:GetPathG("Player","Badge FullCombo"))..{
        InitCommand=function(s) s:shadowlength(1):zoom(0):draworder(5):x(20):diffusealpha(0.8) end,
        SetCommand=function(self)
          local st=GAMESTATE:GetCurrentStyle():GetStepsType();
          local song=GAMESTATE:GetCurrentSong();
          local course = GAMESTATE:GetCurrentCourse();
          if song then
            if song:HasStepsTypeAndDifficulty(st,diff) then
              local steps = song:GetOneSteps( st, diff );
              if PROFILEMAN:IsPersistentProfile(pn) then
                profile = PROFILEMAN:GetProfile(pn);
              else
                profile = PROFILEMAN:GetMachineProfile();
              end;
              scorelist = profile:GetHighScoreList(song,steps);
              assert(scorelist);
              local scores = scorelist:GetHighScores();
              assert(scores);
              local topscore;
              if scores[1] then
                topscore = scores[1];
                assert(topscore);
                local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
                local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
                local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
                local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
                local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
                local marvelous = topscore:GetTapNoteScore("TapNoteScore_W1")
                if (misses+boos) == 0 and scores[1]:GetScore() > 0 and (marvelous+perfects)>0 then
                  if (greats+perfects) == 0 then
                    self:diffuse(GameColor.Judgment["JudgmentLine_W1"]);
                    self:glowblink();
                    self:effectperiod(0.20);
                  elseif greats == 0 then
                    self:diffuse(GameColor.Judgment["JudgmentLine_W2"]);
                    self:glowshift();
                  elseif (misses+boos+goods) == 0 then
                    self:diffuse(GameColor.Judgment["JudgmentLine_W3"]);
                    self:stopeffect();
                  elseif (misses+boos) == 0 then
                    self:diffuse(GameColor.Judgment["JudgmentLine_W4"]);
                    self:stopeffect();
                  end;
                  self:visible(true)
                  self:zoom(0.25);
                else
                  self:visible(false)
                end;
              else
                self:visible(false)
              end;
            else
              self:visible(false)
            end;
          else
            self:visible(false)
          end;
        end
      };
      Def.Quad{
        Name="Grade";
      InitCommand=function(s) s:draworder(5):visible(false):zoom(0.75) end,
      SetCommand=function(self)
        local st=GAMESTATE:GetCurrentStyle():GetStepsType();
        local song=GAMESTATE:GetCurrentSong();
        if song then
          if song:HasStepsTypeAndDifficulty(st,diff) then
            local steps = song:GetOneSteps(st, diff)
            if PROFILEMAN:IsPersistentProfile(pn) then
              profile = PROFILEMAN:GetProfile(pn)
            else
              profile = PROFILEMAN:GetMachineProfile()
            end
  
            scorelist = profile:GetHighScoreList(song,steps)
            local scores = scorelist:GetHighScores()
  
            local topscore=0
            if scores[1] then
              topscore = scores[1]:GetScore()
            end
  
            local topgrade
            if scores[1] then
              topgrade = scores[1]:GetGrade();
              assert(topgrade)
              local tier = topgrade
              if scores[1]:GetScore()>1  then
                if topgrade == 'Grade_Failed' then
                  self:LoadBackground(THEME:GetPathG("","_grades/GradeDisplayEval Failed"));
				  self:zoom(0.2);
                else
                  self:LoadBackground(THEME:GetPathG("_grades/GradeDisplayEval",ToEnumShortString(tier)));
				  self:zoom(0.2);
                end;
                self:visible(true)
              else
                self:visible(false)
              end;
            else
              self:visible(false)
            end;
          else
            self:visible(false)
          end;
        else
          self:visible(false)
        end;
      end;
      };
    };
  };
  return DifficultyListItem
end

for diff in ivalues(Difficulty) do
  DiffList[#DiffList+1] = DrawDiffListItem(diff)
end

return Def.ActorFrame{
  CurrentSongChangedMessageCommand=function(s) s:finishtweening():queuecommand("Set") end,
    ["CurrentSteps" .. ToEnumShortString(pn) .. "ChangedMessageCommand"]=function(s) s:finishtweening():queuecommand("Set") end,
    Def.Sprite{
      Texture=THEME:GetPathB("ScreenSelectMusic","underlay/deco/back/"..ddrgame.."00di_x_dufficulty_wnidow_base"),
      InitCommand=function(s) s:xy(pn==PLAYER_1 and 46 or -46,-10):rotationy(pn==PLAYER_2 and 180 or 0) end,
    };
    Def.ActorFrame{
        Def.ActorFrame{
            InitCommand=function(s) s:y(-60) end,
            Def.Sprite{
                Texture=ddrgame.."scms_diff_window_tab",
                InitCommand=function(s) s:rotationy(pn==PLAYER_1 and 0 or 180) end,
                OnCommand=function(s) s:diffusealpha(0):sleep(0.4):diffusealpha(1) end,
            };
            Def.Sprite{
                Texture=ddrgame..lang.."_semufr_difficulty_change",
                InitCommand=function(s) s:xy(pn==PLAYER_1 and 12 or -12,-46) end,
                OnCommand=function(s) s:diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1) end,
            };
        }
    };
    DiffList..{
      OnCommand=function(s) s:diffusealpha(0):sleep(0.4):linear(0.05):diffusealpha(0.75):linear(0.1):diffusealpha(0.25):linear(0.1):diffusealpha(1) end,
    };
    Def.ActorFrame{
      InitCommand=function(s) s:diffuseramp():effectcolor1(color("1,1,1,0"))
				:effectcolor2(color("1,1,1,0.75")):effectperiod(0.6)
			end,
      Def.Quad{
        InitCommand=function(s) s:setsize(241,25):diffuse(color("#82fefe")):thump(1):effectmagnitude(1.02,1,0):effectperiod(0.6):visible(false) end,
        OnCommand=function(s) s:diffusealpha(0):sleep(0.8):diffusealpha(1) end,
        Texture="cursorglow",
        SetCommand=function(s)
          local song=GAMESTATE:GetCurrentSong()
          if song then
            s:visible(true)
            local steps = GAMESTATE:GetCurrentSteps(pn)
            if steps then
              local diff = steps:GetDifficulty();
              local st=GAMESTATE:GetCurrentStyle():GetStepsType();
              s:xy(pn==PLAYER_1 and 6 or -6,(Difficulty:Reverse()[diff] * yspacing)-80)
            end;
          else
            s:visible(false)
          end;
        end,
      };
    }
    
}