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

procedure Up_Updata(s:longint);
begin
       while s shr 1>0 do
        if f[s shr 1][1]>f[s][1] then begin
            f[0]:=f[s shr 1];
            f[s shr 1]:=f[s];
            f[s]:=f[0];
            s:=s shr 1;
        end else exit;
end;

procedure Down_Updata(p:longint);
Var s:longint;
begin
      s:=2;
      while s<=lb do begin
            if (s<lb) and (f[s+1][1]<f[s][1]) then inc(s);
            if f[p][1]>f[s][1] then begin
                f[0]:=f[p];
                f[p]:=f[s];
                f[s]:=f[0];
                p:=s; s:=s shl 1;
            end else exit;
     end;
end;




Procedure PRIMmazeGener;
Var
        i,j:longint;
        x,y:longint;
        lastb:longint;
        q,w,e,r,c:word;
Begin
        for i:=1 to sett.long*2+1 do
            for j:=1 to sett.wide*2+1 do
              if (i mod 2=1) or (j mod 2=1) then map[i,j]:=1
              else map[i,j]:=2;

        for i:=1 to sett.long do begin
                                        b[0,i]:=true;
                                        b[sett.wide+1,i]:=true;
                                 end;
        for i:=1 to sett.wide do begin
                                        b[i,0]:=true;
                                        b[i,sett.long+1]:=true;
                                  end;

        i:=1;
        j:=1;
        map[2,2]:=0;
        f[1,1]:=2;
        f[1,2]:=3;

        f[2,1]:=3;
        f[2,2]:=2;
        lb:=2;

        up_updata(2);

        while lb>0 do begin
                gettime(q,w,e,r);
                if e<>c then begin
                        printtext('G_Gen_Load',0,1,0,0);
                        textcolor(11);
                        writeln(genps / (sett.long*sett.wide) *100 :7:2,'%');
                        textcolor(7);
                        c:=e;
                end;

                i:=random(lb)+1;
                x:=f[i,1];
                y:=f[i,2];

                if(x-1>1)and (x+1<sett.long*2+1) and
                  (map[x-1,y]<>1) and (map[x+1,y]<>1) and
                  (map[x,y]=1) then begin

                        if (map[x-1,y]=2) and (map[x+1,y]=0) then begin
                                map[x,y]:=0;
                                map[x-1,y]:=0;
                                inc(genps);

                                if (x-1>1) and (y-1>1) and (map[x-1,y-1]=1) then begin
                                        inc(lb);
                                        f[lb,1]:=x-1;
                                        f[lb,2]:=y-1;
                                        up_updata(lb);
                                end;

                                if (x-1>1) and (y+1<sett.wide*2+1) and (map[x-1,y+1]=1) then begin
                                        inc(lb);
                                        f[lb,1]:=x-1;
                                        f[lb,2]:=y+1;
                                        up_updata(lb);
                                end;

                                if (x-2>1) and (map[x-2,y]=1) then begin
                                        inc(lb);
                                        f[lb,1]:=x-2;
                                        f[lb,2]:=y;
                                        up_updata(lb);
                                end;
                        end;

                        if (map[x-1,y]=0) and (map[x+1,y]=2) then begin
                                map[x,y]:=0;
                                map[x+1,y]:=0;
                                inc(genps);

                                if (x+1<sett.long*2+1) and (y-1>1) and (map[x+1,y-1]=1) then begin
                                        inc(lb);
                                        f[lb,1]:=x+1;
                                        f[lb,2]:=y-1;
                                        up_updata(lb);
                                end;

                                if (x+1<sett.long*2+1) and (y+1<sett.wide*2+1) and (map[x+1,y+1]=1) then begin
                                        inc(lb);
                                        f[lb,1]:=x+1;
                                        f[lb,2]:=y+1;
                                        up_updata(lb);
                                end;

                                if (x+2<sett.long*2+1) and (map[x+2,y]=1) then begin
                                        inc(lb);
                                        f[lb,1]:=x+2;
                                        f[lb,2]:=y;
                                        up_updata(lb);
                                end;
                        end;
                        {else
                           begin
                                        f[i]:=f[lb];
		                        dec(lb);
		                        down_updata(i);
                           end;}


                end
                else
                begin
                       if (y-1>1) and (y+1<sett.wide*2+1) and
                           (map[x,y-1]<>1) and (map[x,y+1]<>1) and
                           (map[x,y]=1) then
                           begin
                                if (map[x,y-1]=2) and (map[x,y+1]=0) then begin
                                        map[x,y]:=0;
                                        map[x,y-1]:=0;
                                        inc(genps);

                                        if (x-1>1) and (y-1>1) and (map[x-1,y-1]=1) then begin
                                                inc(lb);
                                                f[lb,1]:=x-1;
                                                f[lb,2]:=y-1;
                                                up_updata(lb);
                                        end;

                                        if (x+1<sett.long*2+1) and (y-1>1) and (map[x+1,y-1]=1) then begin
                                                inc(lb);
                                                f[lb,1]:=x+1;
                                                f[lb,2]:=y-1;
                                                up_updata(lb);
                                        end;

                                        if (y-2>1) and (map[x,y-2]=1) then begin
                                                inc(lb);
                                                f[lb,1]:=x;
                                                f[lb,2]:=y-2;
                                                up_updata(lb);
                                        end;
                                end;
                                if (map[x,y-1]=0) and (map[x,y+1]=2) then begin
                                        map[x,y]:=0;
                                        map[x,y+1]:=0;
                                        inc(genps);

                                        if (x-1>1) and (y+1<sett.wide*2+1) and (map[x-1,y+1]=1) then begin
                                                inc(lb);
                                                f[lb,1]:=x-1;
                                                f[lb,2]:=y+1;
                                                up_updata(lb);
                                        end;

                                        if (x+1<sett.long*2+1) and (y+1<sett.wide*2+1) and (map[x+1,y+1]=1) then begin
                                                inc(lb);
                                                f[lb,1]:=x+1;
                                                f[lb,2]:=y+1;
                                                up_updata(lb);
                                        end;

                                        if  (y+2<sett.wide*2+1) and (map[x,y+2]=1) then begin
                                                inc(lb);
                                                f[lb,1]:=x;
                                                f[lb,2]:=y+2;
                                                up_updata(lb);
                                        end;
                                end;

                           end;
                           {else
                           begin
                                f[i]:=f[lb];
		                        dec(lb);
		                        down_updata(i);
                           end;}
                end;
								f[i]:=f[lb];
		                        dec(lb);
		                        down_updata(i);

                {if lb = lastb then begin
                        lb:=0;
                        for i:=2 to sett.long*2 do
                            for j:=2 to sett.wide*2 do begin
                                if (map[i,j]=1) and
                                    (((map[i-1,j]=2) or (map[i+1,j]=2) or
                                    (map[i,j-1]=2) or (map[i,j+1]=2))) and
                                    (((map[i-1,j]=0) or (map[i+1,j]=0) or
                                    (map[i,j-1]=0) or (map[i,j+1]=0)))

                                    then begin
                                        inc(lb);
                                        f[lb,1]:=i;
                                        f[lb,2]:=j;
                                        up_updata(lb);
                                end;
                            end;
                end;
                lastb:=lb;}


        end;

End;
