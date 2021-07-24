local t = Def.ActorFrame{
    LoadActor(ddrgame.."backwing")..{
    InitCommand=cmd(x,SCREEN_CENTER_X-2;y,SCREEN_CENTER_Y-33;zoom,2);
  };
  LoadActor("_ddr") .. {
	OnCommand=cmd(sleep,0;queuecommand,"Play");
	PlayCommand=cmd(play);
};
	LoadActor(ddrgame.."ddra20plus" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X-2;y,SCREEN_CENTER_Y-23;zoom,1);
	};
  LoadActor("copy")..{
    InitCommand=cmd(x,SCREEN_CENTER_X-5;y,SCREEN_CENTER_Y+210;zoom,1.5);
  };
  Def.BitmapText{
    Font="_futura pt medium 30px";
    InitCommand=cmd(settext,"MDX:A:A:A:2021061500";halign,0;xy,SCREEN_LEFT+8,SCREEN_TOP+15;zoomx,0.62;zoomy,0.6;strokecolor,color("0,0,0,0.5"));
  };
	LoadActor(THEME:GetPathB("_Arcade","decorations"));
	
	Def.Sprite{
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
		  s:Load(THEME:GetPathB("","_insert coin"))
		end
	  end
	end
  };
   Def.Sprite{
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
};
return t;
