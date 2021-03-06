local t = Def.ActorFrame {

--border bright
	--DefaultBG
 	LoadActor("normal")..{
	InitCommand=cmd(y,-8;zoom,2.5;);
	SetMessageCommand=function(self,params)
			if params.HasFocus then
				self:zoom(3.0);
			else
				self:zoom(2.5);
			end
		end;
	};
	LoadActor("normal")..{
		InitCommand=cmd(y,-8;zoom,2.5;diffusecolor,Color("Yellow");blend,Blend.Add;diffusealpha,0.5;thump;effectclock,'beat';effectmagnitude,1.0,1.05,1.0;effectoffset,0.35;);
		SetMessageCommand=function(self,params)
			if params.HasFocus then
				self:zoom(3.0);
			else
				self:zoom(0);
			end
		end;
		};
LoadActor("bright")..{
		InitCommand=cmd(y,-8;zoom,0);
		SetMessageCommand=function(self,params)
			
			if params.HasFocus then
				self:zoomy(2.7);
				self:zoomx(2.9);
				(cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.5;effectclock,'beatnooffset'))(self);
			else
				self:zoom(0);
			end
		end;
		};
		
	--folder lamp from here(test thingy)
		
	LoadActor("FolderLamp PFC")..{
		InitCommand=cmd(y,-20;zoom,0);
		
		
		SetMessageCommand=function(self,params)
			local effecttime = 0.09;
			local isPFCed = false;
			if (params.Text == 'irraven') then isPFCed = true; end;
			if (params.Text == 'R7-3rdMix -The City-') then isPFCed = true; end;
			if (params.Text == 'R7-4thMix -Phase 2 Phase-') then isPFCed = true; end;
			if (params.Text == 'Beginner\'s Package') then isPFCed = true; end;
			if (params.Text == 'CHIKUTAKU Concert -1st mov-') then isPFCed = true; end;
			if (params.Text == 'CHIKUTAKU Concert -2nd mov-') then isPFCed = true; end;
			if (params.Text == 'CHIKUTAKU Symphonia') then isPFCed = true; end;
			if (params.Text == 'CHIKUTAKU Symphonia f') then isPFCed = true; end;
			
			
			
			
			isPFCed = false;
			
			

			
			if not isPFCed then
				self:zoomy(0);
				self:zoomx(0);
			elseif params.HasFocus then
				self:y(-20);
				self:zoomy(1.2);
				self:zoomx(1.48);
				(cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.70;effectperiod,effecttime))(self);
			else
				self:y(-17);
				self:zoomy(1);
				self:zoomx(1.23);
				(cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.70;effectperiod,effecttime))(self);
			end
		end;
		
		
	};

		LoadActor("FolderLamp GreatFC")..{
		InitCommand=cmd(y,-20;zoom,0);
		
		
		SetMessageCommand=function(self,params)
			local effecttime = 0.09;
			local isGFCed = false;
			if (params.Text == 'R7-2ndMix PLUS') then isGFCed = true; end;
			if (params.Text == '11') then isGFCed = true; end;
			
			
			
			
			
			isGFCed = false;
			
			


			
			if not isGFCed then
				self:zoomy(0);
				self:zoomx(0);
			elseif params.HasFocus then
				self:y(-20);
				self:zoomy(1.2);
				self:zoomx(1.48);
				(cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.70;effectperiod,effecttime))(self);
			else
				self:y(-17);
				self:zoomy(1);
				self:zoomx(1.23);
				(cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.70;effectperiod,effecttime))(self);
			end
		end;
		
		
	};
		
	LoadActor("FolderLamp Failed")..{
	
		InitCommand=cmd(y,-8;zoom,0);
		
		--[[
		SetMessageCommand=function(self,params)
			local effecttime = 0.09;
			
			if params.HasFocus then
				if (params.Text == 'DDR II') then
					self:zoomy(1.5);
					self:zoomx(1.5);
					(cmd(diffuseshift;effectcolor1,1,1,1,0.65;effectcolor2,1,1,1,1;effectperiod,1.1))(self);
				else
					self:zoom(0);
				end;
			else
				if (params.Text == 'DDR II') then
					self:zoomy(1.25);
					self:zoomx(1.25);
					(cmd(diffuseshift;effectcolor1,1,1,1,0.65;effectcolor2,1,1,1,1;effectperiod,1.1))(self);
				else
					self:zoom(0);
				end;
			end;
			
		end;
		]]
		
	};
	
	--folder lamp to here

	
  LoadFont("_dfghsgothic-w9 20px")..{
	InitCommand=cmd(y,10;zoom,1.5;maxwidth,320);
	SetMessageCommand=function(self, params)
		local group = params.Text;
	  	self:settext(SongAttributes.GetGroupName(group));
	  	if params.HasFocus then
			self:zoom(1.8);
			self:y(0);
		else
			self:zoom(1.5);
			self:y(0);
		end
	end;
  };

};
return t;
