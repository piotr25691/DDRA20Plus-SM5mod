return Def.ActorFrame {
	InitCommand=function(self)
		self:x(-10);
		self:y(-20);
		--self:visible(PREFSMAN:GetPreference("MenuTimer"));
	end;
	LoadActor(ddrgame.."timerbg" )..{
		OnCommand=cmd(zoom,1.9;addy,-7);
		OffCommand=cmd(linear,0.167;zoom,0);
	};
	LoadActor(ddrgame.."timer_ov")..{
		OnCommand=cmd(addy,-7;playcommand,"Tick");
		TickCommand=cmd(diffusealpha,1;zoom,1.9;linear,0.4;diffusealpha,0;sleep,0.6;queuecommand,"Tick");
		OffCommand=cmd(stoptweening;linear,0.167;diffusealpha,0);
	};
	LoadActor(ddrgame.."timer_ov")..{
		OnCommand=cmd(addy,-7;playcommand,"Tick");
		TickCommand=cmd(diffusealpha,1;zoom,1.9;linear,0.4;zoom,1.7;diffusealpha,0;sleep,0.6;queuecommand,"Tick");
		OffCommand=cmd(stoptweening;linear,0.167;diffusealpha,0);
	};
}