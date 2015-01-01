(*
 * Hello! Paracraft Maze Generator for Paracraft
 * Copyright (C) 2014 Eric_Lian <https://github.com/ExerciseBook/HPCMG>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * ===========================================================================
 * 上面都是我复制粘贴的，反正最终解释权归我所有啦!
 * All above that is I copied from another place .
 * All in all . Don't do something wrong on my code .
 *)

Procedure Command;
Var
	s:string;
	i,j:longint;
        b:boolean;
        long,wide:longint;
Begin
        fillchar(b,sizeof(b),false);
		s:=ParamStr(1);
        if (upcase(s)<>'-N') and
           (upcase(s)<>'-I') and
           //(upcase(s)<>'-GUI') and
           (upcase(s)<>'-STARTPARACRAFT') and
           (upcase(s)<>'-HELP') and
           (upcase(s)<>'HELP') and
           (upcase(s)<>'?') and
		   (upcase(s)<>'-?') and
		   (upcase(s)<>'/?') and
           (upcase(s)<>'-DELETETEMP') and
           (upcase(s)<>'-RUNDIR') and
           (upcase(s)<>'-OUTDIR') and
           (upcase(s)<>'-OUTNAME') and

           (s<>'?') then begin
                Printtext('G_Command_Wrong',1,1,0,1);
				Printtext('G_paktc',1,1,0,1);
                readkey;
                Printtext('G_Command_Readme',1,1,0,1);
                halt;
	end;

	if (upcase(s)='-N') then begin
                sett.wall:=FormatTheID('92');
                sett.botton:=FormatTheID('62');
	        sett.top:=FormatTheID('0');
                randomize;
                s:=numtochar(randseed);
                randseed:=0;
                randomseed:=s;
                s:=MD5Print(MD5String(s));
                for i:=1 to length(s) do randseed:=randseed+integer(s[i])*i*2333;
	        sett.tall:=3;
	        sett.road:=1;
	        sett.thick:=sett.road;
	        sett.wide:=10;
	        sett.long:=10;
	        sett.hole:=0;
            sett.way:=1;
            sett.outway:=2;


	        i:=2;
	        while paramstr(i)<>'' do begin
                        s:=ParamStr(i);
			if (upcase(s)<>'-W') and (upcase(s)<>'-B') and
                           (upcase(s)<>'-T') and (upcase(s)<>'-R') and
                           (upcase(s)<>'-WT') and (upcase(s)<>'-WW') and
						   (upcase(s)<>'-ML') and (upcase(s)<>'-MW') and
                           (upcase(s)<>'-H') and  (upcase(s)<>'-GENER') and
                           (upcase(s)<>'-OUTPUT') and (upcase(s)<>'-RUNDIR') and
                           (upcase(s)<>'-OUTDIR') and (upcase(s)<>'-OUTNAME') and
						   (upcase(s)<>'-WI') and (upcase(S)<>'-ADD') then
			begin
				Printtext('G_Command_Wrong',1,1,0,1);
                                halt;
			end;

                        if (upcase(s)='-W') and (p[1]=false) then begin
                                p[1]:=true;
                                s:=paramstr(i+1);
                                sett.wall:=FormatTheID(s);
                        end;

                        if (upcase(s)='-B') and (p[2]=false) then begin
                                p[2]:=true;
                                s:=paramstr(i+1);
                                sett.botton:=FormatTheID(s);
                        end;

                        if (upcase(s)='-T') and (p[3]=false) then begin
                                p[3]:=true;
                                s:=paramstr(i+1);
                                sett.top:=FormatTheID(s);
                        end;

                        if (upcase(s)='-R') and (p[4]=false) then begin
                                p[4]:=true;
                                s:=paramstr(i+1);
                                randseed:=0;
                                randomseed:=s;
                                s:=MD5Print(MD5String(s));
                                for i:=1 to length(s) do randseed:=randseed+integer(s[i])*i*2333;
                        end;

                        if (upcase(s)='-WT') and (p[5]=false) then begin
                                p[5]:=true;
                                s:=paramstr(i+1);
                                b:=true;
                                for j:=1 to length(s) do
                                        if (s[j]<'0') or (s[j]>'9') then
                                        begin
                                                sett.tall:=3;
                                                Printtext('CMD_ERR_N_wt',1,1,0,3);
                                                b:=false;
                                        end;
                                if b then
                                begin
                                        val(s,sett.tall);
                                        if (sett.tall>50) or (sett.tall<1) then begin
                                                sett.tall:=3;
                                                Printtext('CMD_ERR_N_wt',1,1,0,3);
                                        end;
                                 end;
                        end;


                        if (upcase(s)='-WW') and (p[6]=false) then begin
                                p[6]:=true;
                                s:=paramstr(i+1);
                                b:=true;
                                for j:=1 to length(s) do
                                        if (s[j]<'0') or (s[j]>'9') then
                                        begin
                                                sett.road:=3;
                                                Printtext('CMD_ERR_N_ww',1,1,0,3);
                                                b:=false;
                                        end;
                                        if b then
                                        begin
                                                val(s,sett.road);
                                                if (sett.road>5) or (sett.road<1) then begin
                                                        sett.road:=1;
                                                        Printtext('CMD_ERR_N_ww',1,1,0,3);
                                                end;
                                        end;
                        end;
						

                        if (upcase(s)='-WI') and (p[12]=false) then begin
                                p[12]:=true;
                                s:=paramstr(i+1);
                                b:=true;
                                for j:=1 to length(s) do
                                        if (s[j]<'0') or (s[j]>'9') then
                                        begin
                                                sett.road:=3;
                                                Printtext('CMD_ERR_N_wi',1,1,0,3);
                                                b:=false;
                                        end;
                                        if b then
                                        begin
                                                val(s,sett.thick);
                                                if (sett.thick>5) or (sett.thick<1) then begin
                                                        sett.thick:=1;
                                                        Printtext('CMD_ERR_N_wi',1,1,0,3);
                                                end;
                                        end;
                        end;

                        if (upcase(s)='-ML') and (p[7]=false) then begin
                                p[7]:=true;
                                s:=paramstr(i+1);
                                b:=true;
                                for j:=1 to length(s) do
                                        if (s[j]<'0') or (s[j]>'9') then
                                                begin
                                                        sett.long:=10;
                                                        Printtext('TMS_Default_Error',1,1,0,3);
                                                        b:=false;
                                                end;
                                        if b then
                                        begin
                                                val(s,sett.long);
                                                if (sett.long>300) or (sett.long<5)  then begin
                                                        sett.long:=10;
                                                        Printtext('TMS_Default_Error',1,1,0,3);
                                                end;
                                        end;
                        end;

                        if (upcase(s)='-MW') and (p[8]=false) then begin
                                p[8]:=true;
                                s:=paramstr(i+1);
                                b:=true;
                                for j:=1 to length(s) do
                                        if (s[j]<'0') or (s[j]>'9') then
                                                begin
                                                        sett.wide:=10;
                                                        Printtext('TMS_Default_Error',1,1,0,3);
                                                        b:=false;
                                                end;
                                        if b then
                                        begin
                                                val(s,sett.wide);
                                                if (sett.wide>300) or (sett.wide<5)  then begin
                                                        sett.wide:=10;
                                                        Printtext('TMS_Default_Error',1,1,0,3);
                                                end;
                                        end;
                        end;



                        if (upcase(s)='-H') and (p[9]=false) then begin
                                p[9]:=true;
                                s:=paramstr(i+1);
                                if length(s)<>0 then begin
			                for j:=1 to length(s) do
				        if ( (s[j]<'0') or (s[j]>'9') ) and (  (s[j]<>'%') and (i<>length(s))  ) then
				        begin
                                                Printtext('CMD_ERR_N_h',1,1,0,3);
				        end;
			                if s[length(s)]='%' then delete(s,length(s),1);
			                if s='' then sett.hole:=0
			                        else sett.hole:=chartonum(s);
		                end
		                else
		                begin
			                Printtext('CMD_ERR_N_h',1,1,0,3);
			                sett.hole:=0;
		                end;
                        end;

                        if (upcase(s)='-GENER') and (p[10]=false) then begin
                                s:=paramstr(i+1);
                                if (upcase(s)='DFS') or (s='1') then
                                begin
                                        sett.way:=1;
                                        p[10]:=true;
                                end;
                                if (upcase(s)='BFS') or (s='2') or (upcase(s)='PRIM') then
                                begin
                                        sett.way:=2;
                                        p[10]:=true;
                                end;


                        end;

                        if (upcase(s)='-OUTPUT') and (p[11]=false) then begin
                                s:=paramstr(i+1);
                                if (upcase(s)='COMMAND') or (s='1') or (upcase(s)='CMD') then
                                begin
                                        sett.outway:=1;
                                        p[11]:=true;
                                end;
                                if (upcase(s)='TEMPLATE') or (s='2') or (upcase(s)='TEMP') then
                                begin
                                        sett.outway:=2;
                                        p[11]:=true;
                                end;
                                if (upcase(s)='LUACODE') or (s='3') or (upcase(s)='LUA') or (upcase(s)='NPL') then
                                begin
                                        sett.outway:=3;
                                        p[11]:=true;
                                end;

                        end;

												
                        i:=i+2;


		end;
				if (sett.add=false) then begin
					if ((p[10]=false) or (p[11]=false))  then begin
                        Printtext('CMD_ERR_N_GOnull',1,1,0,1);
						Printtext('G_paktc',1,1,0,1);
						readkey;
						Printtext('G_Command_Readme',1,1,0,1);
						Printtext('G_pakte',1,1,0,1);
						readkey;
                        halt;
					end;
				end;



	end;

        if (upcase(s)='-I') then begin
                halt;
	end;

        {if (upcase(s)='-GUI') then begin
                sett.wall:=FormatTheID('92');
                sett.botton:=FormatTheID('62');
                sett.top:=FormatTheID('0');
                randomize;
                s:=numtochar(randseed);
                randseed:=0;
                randomseed:=s;
                s:=MD5Print(MD5String(s));
                for i:=1 to length(s) do randseed:=randseed+integer(s[i])*i*2333;
                sett.tall:=3;
                sett.road:=1;
	        sett.thick:=sett.road;
	        sett.wide:=10;
	        sett.long:=10;
	        sett.hole:=0;

                s:=paramstr(2);
                sett.wall:=FormatTheID(s);

                s:=paramstr(3);
                sett.botton:=FormatTheID(s);

                s:=paramstr(4);
                sett.top:=FormatTheID(s);

                s:=paramstr(5);
                randseed:=0;
                randomseed:=s;
                s:=MD5Print(MD5String(s));
                for i:=1 to length(s) do randseed:=randseed+integer(s[i])*i*2333;

                s:=paramstr(6);
                sett.tall:=chartonum(s);

                s:=paramstr(7);
                sett.road:=chartonum(s);

                s:=paramstr(8);
                sett.wide:=chartonum(s);

                s:=paramstr(9);
                sett.long:=chartonum(s);

                s:=paramstr(10);
                sett.hole:=chartonum(s);

                s:=paramstr(11);
                sett.way:=chartonum(s);

                s:=paramstr(12);
                sett.outway:=chartonum(s);


	end;}

        if (s='-STAERPARACRAFT') then begin
                exec('ParaEngineClient.exe',
                     'single="false" mc="true" noupdate="false" isDevEnv="false"')
        end;

        if (upcase(s)='HELP') or (upcase(s)='-HELP') or (s='?') or (s='-?') or (s='/?')then begin
                Printtext('G_Command_Readme',1,1,0,3);
                readkey;
                halt;
        end;
        if (upcase(s)='-DELETETEMP') then begin
                exec('cmd','/k del update.exe & exit');
                halt;
        end;

End;
