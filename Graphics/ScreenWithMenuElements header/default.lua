local t = Def.ActorFrame{};

local screenName = Var "LoadingScreen"

local sStage = GAMESTATE:GetCurrentStage();
local tRemap = {
	Stage_1st		= 0,
	Stage_2nd		= 1,
	Stage_3rd		= 2,
	Stage_4th		= 3,
	Stage_5th		= 4,
	Stage_6th		= 5,
};

if tRemap[sStage] == PREFSMAN:GetPreference("SongsPerPlay") then
  sStage = Stage_Final;
else
	sStage = sStage;
end;


local headerTextImage

if screenName == "ScreenSelectStyle" then
  headerTextImage = "SELECT STYLE.png"
elseif screenName == "ScreenSelectProfile" then
  headerTextImage = "LOGIN.png"
elseif screenName == "ScreenEvaluationNormal" then
  headerTextImage = "Results "..sStage
elseif screenName == "ScreenEvaluationSummary" then
  headerTextImage = "TOTAL RESULT"
elseif screenName == "ScreenDataSaveSummary" then
  headerTextImage = "LOGOUT.png"
end;

t[#t+1] = LoadActor(ddrgame.."base");

if headerTextImage then
  t[#t+1] = LoadActor(ddrgame.."text/"..headerTextImage)..{
    InitCommand=function(self)
      self:y(-5)
    end;
  };
end

return t;
