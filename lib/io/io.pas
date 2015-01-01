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

{============================================================================}
{=============================== = Read In = ================================}
{============================================================================}
Procedure ReadIn;
Var
        b:boolean;
        s:string[255];
Begin
        printtext('TAS_TITLE',1,1,0,0);
		
		if (sett.add=true) and (p[1]=false) then begin
        printtext('TAS_Wall',0,1,0,0);
		printtext('TAS_Wall_Def',1,0,5,-1);
		printtext('G_Input',0,1,0,0);
        Readln(s);
        if s='' then s:='92';
        sett.wall:=FormatTheID(s);
		end;
		
		if (sett.add=true) and (p[2]=false) then begin
        printtext('TAS_Botton',0,1,0,0);
		printtext('TAS_Botton_Def',1,0,5,-1);
		printtext('G_Input',0,1,0,0);
        Readln(s);
        if s='' then s:='62';
        sett.botton:=FormatTheID(s);
		end;
		
		if (sett.add=true) and (p[3]=false) then begin
		printtext('TAS_Top',0,1,0,0);
		printtext('TAS_Top_Def',1,0,5,-1);
		printtext('G_Input',0,1,0,0);
        Readln(s);
        if s='' then s:='0';
        sett.top:=FormatTheID(s);
		end;
		
        printtext('G_Line',1,1,0,0);
		
		if (sett.add=true) and (p[4]=false) then begin
        {========================= = Random Seed = ========================}
        printtext('TMS_TITLE',1,1,0,0);
        printtext('TMS_Random',0,1,0,0);
		printtext('TMS_Random_Def',1,0,5,-1);
		printtext('G_Input',0,1,0,0);
        readln(s);
        if length(s)=0 then
        Begin
                randomize;
                s:=numtochar(randseed);
		printtext('TMS_Random_Time',0,1,0,3);
                textcolor(14);
		writeln(' ',randseed);
		textcolor(7);
        End;
        randseed:=0;
        randomseed:=s;
        s:=MD5Print(MD5String(s));
        for i:=1 to length(s) do randseed:=randseed+integer(s[i])*i*2333;
		end;
		
		
		if (sett.add=true) and (p[5]=false) then begin
        printtext('TMS_Wall_Tall',0,1,0,0);
		printtext('TMS_Wall_Tall_Def',1,0,5,-1);
		printtext('G_Input',0,1,0,0);
        readln(s);
        b:=true;
        for i:=1 to length(s) do
                if (s[i]<'0') or (s[i]>'9') then
                begin
                        sett.tall:=3;
                        Printtext('TMS_Default_Error',1,1,0,3);
                        b:=false;
                end;
        if b then
        begin
                val(s,sett.tall);
                if (sett.tall>50) or (sett.tall<1) then begin
                        sett.tall:=3;
                        Printtext('TMS_Default_Error',1,1,0,3);
                end;
        end;
		end;
		
		if (sett.add=true) and (p[6]=false) then begin
        printtext('TMS_Road',0,1,0,0);
		printtext('TMS_Road_Def',1,0,5,-1);
		printtext('G_Input',0,1,0,0);
        readln(s);
        b:=true;
        for i:=1 to length(s) do
                if (s[i]<'0') or (s[i]>'9') then
                begin
                        sett.road:=3;
                        Printtext('TMS_Default_Error',1,1,0,3);
                        b:=false;
                end;
        if b then
        begin
                val(s,sett.road);
                if (sett.road>5) or (sett.road<1) then begin
                        sett.road:=1;
                        Printtext('TMS_Default_Error',1,1,0,3);
                end;
        end;
		end;
		
		if (sett.add=true) and (p[12]=false) then begin
        printtext('TMS_Wall_Thick',0,1,0,0);
		printtext('TMS_Wall_Thick_Def',1,0,5,-1);
		printtext('G_Input',0,1,0,0);
        readln(s);
        b:=true;
        for i:=1 to length(s) do
                if (s[i]<'0') or (s[i]>'9') then
                begin
                        sett.thick:=1;
                        Printtext('TMS_Default_Error',1,1,0,3);
                        b:=false;
                end;
        if b then
        begin
                val(s,sett.thick);
                if (sett.thick>5) or (sett.thick<1) then begin
                        sett.thick:=1;
                        Printtext('TMS_Default_Error',1,1,0,3);
                end;
        end;    
		end;
		
		if (sett.add=true) and (p[7]=false) then begin
        printtext('TMS_Size',0,1,0,0);
		printtext('TMS_Size_Def',1,0,5,-1);
		printtext('TMS_Size_a',0,1,0,0);
        readln(s);
        b:=true;
        for i:=1 to length(s) do
                if (s[i]<'0') or (s[i]>'9') then
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
		
		if (sett.add=true) and (p[8]=false) then begin
		printtext('TMS_Size_b',0,1,0,0);
        readln(s);
        b:=true;
        for i:=1 to length(s) do
                if (s[i]<'0') or (s[i]>'9') then
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

		if (sett.add=true) and (p[9]=false) then begin
        printtext('TMS_Hole',1,1,0,0);
		printtext('TMS_Hole_Def',1,1,0,0);
		printtext('G_Input',0,1,0,0);
        readln(s);
		if length(s)<>0 then begin
			for i:=1 to length(s) do
				if ( (s[i]<'0') or (s[i]>'9') ) and (  (s[i]<>'%') and (i<>length(s))  ) then
				begin
					Printtext('TMS_Default_Error',1,1,0,3);
				end;
			if s[length(s)]='%' then delete(s,length(s),1);
			if s='' then sett.hole:=0
			else sett.hole:=chartonum(s);
		end
		else
		begin
			Printtext('TMS_Default_Error',1,1,0,3);
			sett.hole:=0;
		end
		end;
		
		if (sett.add=true) and (p[10]=false) then begin
        printtext('TMS_Gener',1,1,0,0);
		printtext('TMS_Gener_List',1,1,0,0);
		printtext('G_Input',0,1,0,0);
		repeat
			s:=readkey;
                until (s='1') or (s='2');
                case s[1] of
			'1' : begin
					sett.way:=1;
					printtext('TMS_Gener_List_1',1,0,3,-1);
				  end;
			'2' : begin
					sett.way:=2;
					printtext('TMS_Gener_List_2',1,0,3,-1);
				  end;
		end;
		end;
		
		if (sett.add=true) and (p[11]=false) then begin
        printtext('TMS_Out',1,1,0,0);
		printtext('TMS_Out_List',1,1,0,0);
		printtext('G_Input',0,1,0,0);
		repeat
			s:=readkey;
		until (s='1') or (s='2') or (s='3');
                case s[1] of
			'1' : begin
					sett.outway:=1;
					printtext('TMS_Out_List_1',1,0,3,-1);
				  end;
			'2' : begin
					sett.outway:=2;
					printtext('TMS_Out_List_2',1,0,3,-1);
				  end;
			'3' : begin
					sett.outway:=3;
					printtext('TMS_Out_List_3',1,0,3,-1);
				  end;
		end;
		end;
		
End;
