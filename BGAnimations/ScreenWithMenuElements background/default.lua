return Def.ActorFrame {
	LoadActor(ddrgame.."backgroundplus")..{
		InitCommand=function(s) s:FullScreen() end,
	};
}
