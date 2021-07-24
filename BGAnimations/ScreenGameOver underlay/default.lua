local t = Def.ActorFrame{}

t[#t+1] = LoadActor("gameover") .. {
	OnCommand=function(self)
			self:play();
	end;
};

t[#t+1] = Def.ActorFrame {

	LoadActor(ddrgame.."vfx" )..{
		InitCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomy,1.1);
	};
	
	

	
	LoadActor( "white" )..{
		InitCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,1;linear,0.1;diffusealpha,0;sleep,6;linear,0.5;diffusealpha,1);
	};



	
};




return t;