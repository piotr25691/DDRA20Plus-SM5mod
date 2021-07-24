local t = Def.ActorFrame {};
local lang = "en";
if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd();
	Def.ActorFrame {
	
	LoadActor(ddrgame..lang.."_HOW_TO_PLAY_video" )..{
		InitCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	};
	LoadActor(lang.."_HOW_TO_PLAY_music" )..{
		OnCommand=cmd(play);
		OffCommand=cmd(stop);
	};
	
     };
};
return t

	
	
	

