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
{================= = format the ID:Fj&chance from CH%ID:Fj = ================}
{============================================================================}

Function IsTheIDFMillegal(s:string):integer;
Var
        ID,CH,i:longint;
        Fj,a   :string;

Begin
        for i:=1 to length(s) do
                if ((s[i]<'0') or (s[i]>'9')) and
                   (s[i]<>'.') and (s[i]<>':') and (s[i]<>'%')
                   then
                        exit(2);

        if pos('%',s)=0 then CH:=10000
        else
        begin
                a:=copy(s,1,pos('%',s)-1);
                if pos('.',a)=0 then
                begin
                        a:=a+'.00';
                end
                else
                begin
                        while length(copy(a,pos('.',a)+1,length(a))) <2 do a:=a+'0';
                        while length(copy(a,pos('.',a)+1,length(a))) >2 do delete(a,length(a),1);
                end;

                CH:=CharToNum(a);
                s:=copy(s,pos('%',s)+1,length(s));
        end;
        for i:=1 to length(a) do
                if ((a[i]<'0') or (a[i]>'9')) and (a[i]<>'.') then
                        exit(2);
        if CH>10000 then exit(1);


        if pos(':',s)=0 then Fj:=''
        else
        begin
                Fj:=copy(s,pos(':',s)+1,length(s));
                s:=copy(s,1,pos(':',s)-1);
        end;

        for i:=1 to length(s) do
                if (s[i]<'0') or (s[i]>'9') then
                        exit(2);

        ID:=chartonum(s);
        exit(0);

End;

Function FormatCH(s:string):idfm;
Var
        ID,CH:longint;
        Fj,a :string;
Begin
        if pos('%',s)=0 then CH:=10000
        else
        begin
                a:=copy(s,1,pos('%',s)-1);
                if pos('.',a)=0 then
                begin
                        a:=a+'.00';
                end
                else
                begin
                        while length(copy(a,pos('.',a)+1,length(a))) <2 do a:=a+'0';
                        while length(copy(a,pos('.',a)+1,length(a))) >2 do delete(a,length(a),1);
                end;

                CH:=CharToNum(a);
                s:=copy(s,pos('%',s)+1,length(s));
        end;


        if pos(':',s)=0 then Fj:=''
        else
        begin
                Fj:=copy(s,pos(':',s)+1,length(s));
                s:=copy(s,1,pos(':',s)-1);
        end;

        ID:=chartonum(s);

        formatCH.ID:=ID;
        formatCH.CH:=CH;
        formatCH.Fj:=Fj;

End;

{============================================================================}
{===================== = Fotmat the WorldEdit Format = ======================}
{============================================================================}
Function FormatTheID(s:string):ids;
Var
        i:longint;
        c:string;
        t:ids;
        error:integer;
        Ave:boolean;
Begin

        if pos('%',s)=0 then Ave:=true else Ave:=false;
        t[0].id:=0;
        fillchar(t,sizeof(t),0);

        if s[length(s)]<>',' then s:=s+',';
        while pos(',',s)>0 do
        Begin
                i:=pos(',',s);

                c:=copy(s,1,i-1);
                s:=copy(s,i+1,length(s));

                error:=IsTheIDFMillegal(c);
                if (length(c)<>0) and (error=0) then begin
                        inc(t[0].id);
                        t[ t[0].id ]:=FormatCH(c);
                        t[0].CH:=t[ t[0].id ].CH+ t[0].CH;
                end
                else
                begin
                        if error=1 then begin
												printtext('G_Waring',0,1,0,-1);
												textcolor(11);
												write(' ',c,' ');
												textcolor(7);
												printtext('WE_IDR_Error_1',1,0,0,-1);

                                        end;
                        if error=2 then begin
                                                printtext('G_Waring',0,1,0,-1);
												textcolor(11);
												write(' ',c,' ');
												textcolor(7);
												printtext('WE_IDR_Error_2',1,0,0,-1);
                                        end;
                end;
        end;

        if ave and (t[0].ID>1) then begin
                t[0].CH:=10000;
                for i:=1 to t[0].ID-1 do begin
                        t[i].CH:=trunc(10000/t[0].id);
                end;
                t[ t[0].ID ].ch:=10000-t[1].ch* (t[0].id-1)

        end;
        if t[0].CH>10000 then begin
								printtext('WE_IDR_Error_100',0,1,0,2);
								textcolor(11);
								writeln('   ',t[0].ch div 100,'.',t[0].ch mod 100,'%/100%');
								textcolor(7)
						 end;
        if t[0].CH<10000 then begin
								printtext('WE_IDR_Error_101',0,1,0,2);
								textcolor(11);
								writeln('   ',t[0].ch div 100,'.',t[0].ch mod 100,'%/100%');
								textcolor(7)
						 end;
        exit(t);
End;
