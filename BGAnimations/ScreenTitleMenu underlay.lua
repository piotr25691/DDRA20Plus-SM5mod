local t = Def.ActorFrame{};

--Logo
t[#t+1] = Def.ActorFrame {
	LoadActor( "ScreenLogo decorations/backlight" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X+9;y,SCREEN_CENTER_Y+20;zoomx,3.85;zoomy,1);
	};
	LoadActor( "ScreenLogo decorations/"..ddrgame.."backwing" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X+9;y,SCREEN_CENTER_Y-10;zoom,2);
	};
	LoadActor( "ScreenLogo decorations/"..ddrgame.."ddra20plus" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X-2;y,SCREEN_CENTER_Y-23;zoom,1);
	};
	LoadActor( "ScreenLogo decorations/copy" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X-5;y,SCREEN_CENTER_Y+210;zoom,1.4);
	};
	LoadActor(THEME:GetPathB("","_Arcade Decorations/"..ddrgame.."bg"))..{
		InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y+160+122;zoomx,1.84;zoomy,1.8);
	};
};

return t
