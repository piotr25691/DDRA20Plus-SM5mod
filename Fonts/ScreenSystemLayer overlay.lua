local function CreditsText()
	local text = LoadFont("_xolonium 20px") .. {
		InitCommand=cmd(draworder,99;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-14.5;zoom,1.2;strokecolor,color("0.3,0.3,0.3,1");maxwidth,200;playcommand,"Refresh");
		RefreshCommand=function(self)
			if GAMESTATE:GetCoinMode()=='CoinMode_Pay' then
				self:visible(true)
				self:playcommand("UpdateVisible")
			else
				self:visible(false)
			end;
			local coins=GAMESTATE:GetCoins()
			local coinsPerCredit=PREFSMAN:GetPreference('CoinsPerCredit')
			local credits=math.floor(coins/coinsPerCredit)
			local remainder=math.mod(coins,coinsPerCredit)
			self:settext('CREDIT(S) '..credits..'  [ '..remainder..' / '..coinsPerCredit..' ]')
		end;
		UpdateVisibleCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local bShow = true;
			if screen then
				local sClass = screen:GetName();
				bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
			end;

			self:visible( bShow );
		end;
		CoinInsertedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		RefreshCreditTextMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		PlayerJoinedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		ScreenChangedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
	};
	return text;
end;

local function FreeText()
	local text = LoadFont("_xolonium white 20px") .. {
		InitCommand=cmd(draworder,99;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-14.5;strokecolor,color("0.3,0.3,0.3,1");zoom,1.3;playcommand,"Refresh";visible,false);
		RefreshCommand=function(self)
			if GAMESTATE:IsEventMode() then self:settext('EVENT'):x(SCREEN_CENTER_X):playcommand("UpdateVisible") return end
			if GAMESTATE:GetCoinMode()=='CoinMode_Free' then self:settext('FREE PLAY'):x(SCREEN_CENTER_X):playcommand("UpdateVisible") return end
			if GAMESTATE:GetCoinMode()=='CoinMode_Home' then self:settext('FREE PLAY'):x(SCREEN_CENTER_X):playcommand("UpdateVisible") return end
			if GAMESTATE:GetCoinMode()=='CoinMode_Pay' then self:settext(''):x(SCREEN_CENTER_X):playcommand("UpdateVisible") return end
			self:settext('')
		end;
		UpdateVisibleCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local bShow = true;
			if screen then
				local sClass = screen:GetName();
				bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
			end;

			self:visible( bShow );
		end;
		CoinInsertedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		RefreshCreditTextMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		PlayerJoinedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
		ScreenChangedMessageCommand=cmd(stoptweening;playcommand,"Refresh");
	};
	return text;
end;

return Def.ActorFrame {
	CreditsText();
	FreeText();
};