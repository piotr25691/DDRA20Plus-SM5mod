local t = Def.ActorFrame{};

--white
t[#t+1] = Def.ActorFrame {
	
	
	Def.Quad{
		InitCommand=cmd(diffuse,color("White");setsize,SCREEN_WIDTH,SCREEN_HEIGHT;Center;sleep,0.25;linear,0.25;diffusealpha,0;sleep,40.25;linear,1;diffusealpha,1;);
		
	};
	
	
	
	
	LoadActor(THEME:GetPathB("","_Arcade Decorations/default.lua"))..{
	
	};


};



return t
