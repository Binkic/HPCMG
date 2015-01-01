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


Function NumToChar(a:longint):string;
Begin
        str(a,NumToChar);
End;

function CharToNum(a:string):longint;
Var b:longint;
Begin
        if pos('.',a)=0 then
        begin
                val(a,CharToNum);
        end
        else
        begin
                val(copy(a,1,pos('.',a)-1),b);
                b:=b*100;
                a:=copy(a,pos('.',a)+1,length(a));
                while length(a)<2 do a:=a+'0';
                while length(a)>2 do delete(a,length(a),1);
                val( a ,CharToNum   );
                CharToNum:=CharToNum+b;
        end;

End;

Function Hex_Conversion_10to2(s:longint):string;
Begin
        Hex_Conversion_10to2:='';
        while s>0 do begin
                Hex_Conversion_10to2:=numtochar(s mod 2)+
                                      Hex_Conversion_10to2;
                s:=s div 2;
        end;
        while length(Hex_Conversion_10to2)<8 do
                Hex_Conversion_10to2:='0'+Hex_Conversion_10to2;
End;

Function Hex_Conversion_2to10(s:string):longint;
Var
        i:longint;
Begin
        Hex_Conversion_2to10:=0;
        for i:=length(s) downto 1 do begin
                if s[i]='1' then
                Hex_Conversion_2to10:=Hex_Conversion_2to10+
                                      2 **
                                      (length(s)-i)
        end;
End;

Procedure jh(Var a,b:longint);
Begin
        a:=a xor b;
        b:=a xor b;
        a:=a xor b;
End;

Function dateinfo:string;
Var
        hour,min,sec,mins:word;
        s:string;
Begin
        gettime(hour,min,sec,mins);
        s:='[';
        if hour<10 then s:=s+'0'+numtochar(hour)+':'
        else s:=s+numtochar(hour)+':';

        if min<10 then s:=s+'0'+numtochar(min)+':'
        else s:=s+numtochar(min)+':';

        if sec<10 then s:=s+'0'+numtochar(sec)+']'
        else s:=s+numtochar(sec)+']';

        exit(s);
End;


Function readstr(filer,strname:string):ansistring;
Var s,out:ansistring;
    t:text;
Begin
        assign(t,rundir+filer);
        reset(t);

        s:='';
	out:='';

        while (pos(strname,s)<>1) and (eof(t)=false) do begin
                readln(t,s);
        end;

        if pos(strname,s)=1 then delete(s,1,length(strname)+1) else
        begin
                close(t);
                exit('ERROR!EOF');
        end;

        if s='{' then begin
                while s<>'}' do begin
                        readln(t,s);
                        out:=out+char(10)+char(13)+s;
                end;
                s:=out;
                delete(s,1,2);
                delete(s,length(s)-2,3);
        end;
        close(t);
        exit(s);
End;

Procedure Printer(strname:string;ti,info,mode:longint);
Var
        s:ansistring;
	i,skip:longint;
Begin
        skip:=0;
        s:=readstr('language\'+language+'.ini',strname);
        textcolor(7);
        if ti=1 then write(dateinfo);
        if mode=0 then begin
                case info of
	                0: printer('G_Info',0,0,1);
		        1: printer('G_Error',0,0,1);
		        2: printer('G_Waring',0,0,1);
		        3: printer('G_Tip',0,0,1);
	        end;
        end;
        textcolor(7);

        for i:=1 to length(s) do
        begin

                if skip<>0 then begin
                        dec(skip);
                        continue;
                end;

                if s[i]='&' then
                        if pos( upcase(s[i+1]) ,'0123456789ABCDEF')>0 then
                        begin
                                case upcase(s[i+1])of
                                        '0' : textcolor(0);
                                        '1' : textcolor(1);
                                        '2' : textcolor(2);
                                        '3' : textcolor(3);
                                        '4' : textcolor(4);
                                        '5' : textcolor(5);
                                        '6' : textcolor(6);
                                        '7' : textcolor(7);
                                        '8' : textcolor(8);
                                        '9' : textcolor(9);
                                        'A' : textcolor(10);
                                        'B' : textcolor(11);
                                        'C' : textcolor(12);
                                        'D' : textcolor(13);
                                        'E' : textcolor(14);
                                        'F' : textcolor(15);
                                end;
                                skip:=1;
                                continue
                        end;

			if integer(s[i])>=161 then
			begin
			        write(s[i]+s[i+1]);
                                skip:=1;
				continue;
			end;

                        if (integer(s[i])=10) or(integer(s[i])=13)  then
                        begin
                                skip:=1;
                                continue;
                        end;


                        if copy(s,i,9)='{NEWLINE}' then
                        begin
                                skip:=8;
                                writeln;

                                textcolor(7);
                                if ti=1 then write(dateinfo);
                                case info of
	                                0: printer('G_Info',0,0,1);
		                        1: printer('G_Error',0,0,1);
		                        2: printer('G_Waring',0,0,1);
		                        3: printer('G_Tip',0,0,1);
	                        end;
                                textcolor(7);
                                continue;
                        end;

                        write(s[i]);

        end;
End;

Procedure PrintText(strname:string;En,Ti,Space,info:longint{str:ansistring});
Var
		i:longint;
Begin
        textcolor(7);


	for i:=1 to space do write(' ');
	printer(strname,ti,info,0);


	textcolor(7);
	if en=1 then writeln;
End;
