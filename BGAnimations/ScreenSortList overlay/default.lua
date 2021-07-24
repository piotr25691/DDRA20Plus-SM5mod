local steps = GAMESTATE:GetCurrentSteps(GAMESTATE:GetMasterPlayerNumber())
local timer = SCREENMAN:GetTopScreen():GetChild("Timer"):GetSeconds()

local lang = "en";
if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;

local sortorders = {
	"Title",
	"Genre",
	"Group",
	"BPM",
	"Artist",
	"Recent",
	"EasyMeter",
	"TopGrades",
	"Length",
}
local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
local curIndex = 1;
-- this handles user input
local function input(event, param)
	if not event.PlayerNumber or not event.button then
		return false
	end

	if event.type ~= "InputEventType_Release" then
		local overlay = SCREENMAN:GetTopScreen():GetChild("Overlay")
		if event.GameButton == "Start" then
			overlay:GetChild("start_sound"):play()
			MESSAGEMAN:Broadcast("MusicWheelSort")
			if sortorders[curIndex] == "EasyMeter" then
				mw:ChangeSort("SortOrder_"..ToEnumShortString(steps:GetDifficulty()).."Meter")
			else
				mw:ChangeSort("SortOrder_"..sortorders[curIndex])
			end
			SCREENMAN:GetTopScreen():StartTransitioningScreen("SM_GoToNextScreen")
		elseif event.GameButton == "Back" then
			SCREENMAN:GetTopScreen():StartTransitioningScreen("SM_GoToNextScreen")
		elseif event.GameButton == "MenuRight" then
			if curIndex >= #sortorders then
				curIndex = 1
			else
				curIndex = curIndex+1
			end
			overlay:GetChild("change_sound"):play()
		elseif event.GameButton == "MenuUp" then
			if curIndex == 1 then
				curIndex = #sortorders-1
			elseif curIndex == 2 then
				curIndex = #sortorders
			else
				curIndex = curIndex - 2
			end
			overlay:GetChild("change_sound"):play()
		elseif event.GameButton == "MenuDown" then
			if curIndex >= #sortorders then
				curIndex = 2
			elseif curIndex >= #sortorders-1 then
				curIndex = 1
			else
				curIndex = curIndex + 2
			end
			overlay:GetChild("change_sound"):play()
		elseif event.GameButton == "MenuLeft" then
			if curIndex == 1 then
				curIndex = #sortorders
			else
				curIndex = curIndex-1
			end
			overlay:GetChild("change_sound"):play()
		end
		MESSAGEMAN:Broadcast("MoveScroller");
	end

	return false
end

local function MakeItem(sortorders, idx)
	return
end

local ItemList = {};
for i=1,#sortorders do
	ItemList[#ItemList+1] = MakeItem(sortorders[i],i)
end;

local t = Def.ActorFrame{
	InitCommand=function(s) s:Center():queuecommand("Capture") end,
	CaptureCommand=function(s) 
		SCREENMAN:GetTopScreen():AddInputCallback(input)
		--SOUND:PlayOnce(THEME:GetPathS("_PHOTwON","back"))
	end,
	Def.ActorScroller{
		SecondsPerItem=0;
		NumItemsToDraw=20;
		TransformFunction=function(self,offsetFromCenter,itemIndex,numItems)
			self:y((offsetFromCenter * 32)-170);
			self:draworder( math.abs(offsetFromCenter)*10 );
			if itemIndex%2==0 then
			  self:x(-84)
			else
			  self:x(78)
			end;
		end,
		children=ItemList;
	}
};

t[#t+1] = LoadActor( THEME:GetPathS("", "MusicWheel change") )..{ Name="change_sound", SupportPan = false }
t[#t+1] = LoadActor( THEME:GetPathS("", "player mine") )..{ Name="change_invalid", SupportPan = false }
t[#t+1] = LoadActor( THEME:GetPathS("common", "start") )..{ Name="start_sound", SupportPan = false }
t[#t+1] = Def.ActorFrame {LoadActor(ddrgame.."sort.lua");
InitCommand=function(s) s:xy(-640,-400) end,
};

return t