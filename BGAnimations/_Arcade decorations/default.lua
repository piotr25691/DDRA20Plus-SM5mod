local t = Def.ActorFrame {};

--Frame BG
	t[#t+1] = Def.ActorFrame {
		LoadActor(ddrgame.."bg")..{
			OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-64;zoomx,2;zoomy,1.9);
		};
	};

--Messages
t[#t+1] = Def.Sprite{
	InitCommand=function(s) s:xy(_screen.cx,_screen.cy+295):diffuseshift():zoom(0.6):effectcolor1(Color.White):effectcolor2(color("#B4FF01")):effectperiod(2) end,
	OnCommand=function(s) s:diffusealpha(0):playcommand("Animate") end,
	AnimateCommand=function(s) s:sleep(0.01):diffusealpha(1):sleep(2):zoom(0):sleep(2):zoom(0.6):diffusealpha(0):queuecommand("Animate") end,
	BeginCommand=function(s) s:queuecommand("Set") end,
	CoinInsertedMessageCommand=function(s) s:queuecommand("Set") end,
	SetCommand=function(s)
	    if coinmode == 'CoinMode_Free' then
		s:Load(THEME:GetPathB("","_press start"))
	  else
		if GAMESTATE:EnoughCreditsToJoin() == true then
		  s:Load(THEME:GetPathB("","_press start"))
		else
		  s:Load(THEME:GetPathB("","insert coin"))
		end
	  end
	end
  };
t[#t+1] = Def.Sprite{
	InitCommand=function(s) s:xy(_screen.cx,_screen.cy+295):diffuseshift():zoom(0.8):effectcolor1(Color.White):effectcolor2(color("#B4FF01")):effectperiod(2) end,
	OnCommand=function(s) s:diffusealpha(0):playcommand("Animate") end,
	AnimateCommand=function(s) s:sleep(2.01):diffusealpha(1):sleep(2):diffusealpha(0):queuecommand("Animate") end,
	BeginCommand=function(s) s:queuecommand("Set") end,
	CoinInsertedMessageCommand=function(s) s:queuecommand("Set") end,
	SetCommand=function(s)
	    if coinmode == 'CoinMode_Free' then
		s:Load(THEME:GetPathB("","_press start"))
		s:Load(THEME:GetPathB("","_Arcade decorations/_scan-eamuse"))
	  else
		if GAMESTATE:EnoughCreditsToJoin() == true then
		  s:Load(THEME:GetPathB("","_press start"))
		  s:Load(THEME:GetPathB("","_Arcade decorations/_scan-eamuse"))
		else
		  s:Load(THEME:GetPathB("","_insert coin"))
		  s:Load(THEME:GetPathB("","_Arcade decorations/_scan-eamuse"))
		end
	  end
	end
  };
	
return t