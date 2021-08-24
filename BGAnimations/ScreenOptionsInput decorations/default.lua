return Def.ActorFrame {
	LoadActor(ddrgame.."Back") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(zoomx,0;linear,0.25;zoomx,1);
		OffCommand=cmd(sleep,0.3;linear,0.25;zoomx,0);
	};
	LoadActor("pane") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-10;y,SCREEN_CENTER_Y);
		OnCommand=cmd(zoomx,0;linear,0.25;zoomx,1.75);
		OffCommand=cmd(sleep,0.3;linear,0.25;zoomx,0);
	};
};
