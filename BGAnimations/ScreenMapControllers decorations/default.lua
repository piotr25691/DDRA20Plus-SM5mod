return Def.ActorFrame {
	LoadActor(ddrgame.."Back") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(zoomx,0;linear,0.25;zoomx,1;draworder,-1;zoomy,1.67);
		OffCommand=cmd(sleep,0.3;linear,0.25;zoomx,0);
	};
	LoadActor("pane") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(zoomx,0;linear,0.25;zoomx,1.85;draworder,-1;zoomy,1.83);
		OffCommand=cmd(sleep,0.3;linear,0.25;zoomx,0);
	};
};
