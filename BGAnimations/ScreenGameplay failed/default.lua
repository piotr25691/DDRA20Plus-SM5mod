local dt = 0.5;
return Def.ActorFrame {

--Sound
LoadActor("close") .. {
	OnCommand=cmd(sleep,0.083;queuecommand,"Play");
	PlayCommand=cmd(play);
};

--Sound
LoadActor("../_failed") .. {
	OnCommand=cmd(sleep,0.083;queuecommand,"Play");
	PlayCommand=cmd(play);
};

--Sound
LoadActor("../__swooshDDRA") .. {
	OnCommand=cmd(sleep,0.083;queuecommand,"Play");
	PlayCommand=cmd(play);
};

--Black BG
LoadActor( "_failed_bg" )..{
	OnCommand=cmd(zoom,0;sleep,dt;FullScreen);
	};

--White flash
LoadActor( "../_door/whiteflash" )..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomx,0;sleep,0.3;linear,0.134;zoomx,1;linear,0.199;zoom,4);
};

--Up side
--BG
LoadActor( "../_door/"..ddrgame.."graybg" )..{
	InitCommand=cmd(zoom,1.5;x,SCREEN_CENTER_X;y,SCREEN_TOP-99;linear,0.183;x,SCREEN_CENTER_X;y,SCREEN_TOP+99;);
	OnCommand=cmd();
};
LoadActor( "../_door/grayshdw" )..{
	InitCommand=cmd(zoom,1.5;x,SCREEN_CENTER_X;y,SCREEN_TOP-99;linear,0.183;x,SCREEN_CENTER_X;y,SCREEN_TOP+99;);
	OnCommand=cmd();
};

--Down Side
--BG
LoadActor( "../_door/"..ddrgame.."graybg" )..{
	InitCommand=cmd(zoom,1.5;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM+99;zoomy,-1.5;linear,0.183;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-99;);
	OnCommand=cmd();
};
LoadActor( "../_door/grayshdw" )..{
	InitCommand=cmd(zoom,1.5;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM+99;zoomy,-1.5;linear,0.183;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-99;);
	OnCommand=cmd();
};


LoadActor( "Stage Red BG" )..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,1.5);
	OnCommand=function(self)
	self:diffusealpha(0):zoom(3)
	:linear(0.164):diffusealpha(1):zoom(1.5);
	end;
	};

--Left
LoadActor(ddrgame.."failed" )..{
	InitCommand=cmd(zoom,1.5;x,SCREEN_LEFT-452;y,SCREEN_CENTER_Y;linear,0.134;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;);
	OnCommand=cmd();
};
--Right
LoadActor(ddrgame.."failed" )..{
	InitCommand=cmd(zoom,1.5;x,SCREEN_RIGHT+452;y,SCREEN_CENTER_Y;linear,0.134;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;);
	OnCommand=cmd();
};
--Glow
LoadActor(ddrgame.."failed" )..{
	InitCommand=cmd(zoom,1.5;diffusealpha,0;sleep,0.201;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,1;zoomx,1.14;linear,0.016;zoomy,1.14;zoomx,1;linear,0.017;diffusealpha,0.25;linear,0.199;diffusealpha,0);
	OnCommand=cmd();
};

LoadActor( "glow_failed" )..{
	OnCommand=cmd(zoom,1.4;blend,Blend.Add;diffuseshift;effectperiod,0.55;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,1");
	diffusealpha,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,0;sleep,0.283;linear,0.217;diffusealpha,1;sleep,1;);
};

}