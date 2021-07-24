local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffusealpha,0;sleep,30;diffuse,color("1,1,1,1"));
	};
};
t[#t+1] = Def.ActorFrame {
  InitCommand=cmd();
	Def.ActorFrame {
		Def.Quad {
			InitCommand=cmd();
			OnCommand=cmd();
		};
		LoadActor("konami") .. {
			OnCommand=cmd(FullScreen;diffusealpha,0;linear,0.5;diffusealpha,1;sleep,5;linear,0.5;diffusealpha,0);
		};
		LoadActor("ScreenCompany music.ogg") .. {
			OnCommand=cmd(play);
		};
         LoadActor("bemani") .. {
			OnCommand=cmd(FullScreen;diffusealpha,0;sleep,6;linear,0.5;diffusealpha,1;sleep,5;linear,0.5;diffusealpha,0);
		};
		LoadActor("e-amusement") .. {
			OnCommand=cmd(FullScreen;diffusealpha,0;sleep,12;linear,0.5;diffusealpha,1;sleep,5;linear,0.5;diffusealpha,0);
		};
		LoadActor("RSA") .. {
			OnCommand=cmd(FullScreen;diffusealpha,0;sleep,18;linear,0.5;diffusealpha,1;sleep,5;linear,0.5;diffusealpha,0);
		};
		LoadActor("licenses1.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,24;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
		};
		LoadActor("licenses2.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,25;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
		};
		LoadActor("licenses3.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,26;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
		};
		LoadActor("licenses4.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,27;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
		};	
		LoadActor("licenses5.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,28;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
		};
		LoadActor("licenses6.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,29;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
		};
		LoadActor("licenses7.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,30;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
		};
		LoadActor("licenses8.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,31;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
		};
		LoadActor("licenses9.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,32;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
		};
		LoadActor("licenses10.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,33;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
		};
		LoadActor("licenses11.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,34;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
		};
		LoadActor("licenses12.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,35;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
		};
		LoadActor("licenses13.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,36;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
		};
		LoadActor("licenses14.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,37;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
		};
		LoadActor("licenses15.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,38;linear,0.25;diffusealpha,1;sleep,1.5;linear,0.25;diffusealpha,0);
		};
		LoadActor("thankyou.png") .. {
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,39;linear,0.25;diffusealpha,1;sleep,5;linear,0.25;diffusealpha,0);
		};		
	};
};

return t


	



