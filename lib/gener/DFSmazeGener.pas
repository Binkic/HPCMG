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

Procedure DFS(x,y:longint);
Var
        i,j:longint;
        ways:integer;
        q,w,e,r:word;
Begin
        gettime(q,w,e,r);
                if c<>e then begin
                        printtext('G_Gen_Load',0,1,0,0);
                        textcolor(11);
                        writeln(genps / (sett.long*sett.wide) *100 :7:2,'%');
                        textcolor(7);
                        c:=e;
                end;

        if bn=sett.long*sett.wide then exit
        else
        begin
                while (b[x-1,y]=false) or (b[x+1,y]=false) or
                      (b[x,y+1]=false) or (b[x,y-1]=false) do
                begin
                        repeat

                                ways:=random(4);
                                if (((x+way[1,1]>=1)  and (x+way[1,1]<=sett.long) and
                                   (y+way[1,2]>=1)  and (y+way[1,2]<=sett.wide) and
                                   (b[x+way[1,1],y+way[1,2]]=false)) = false) and
                                   (((x+way[2,1]>=1)  and (x+way[2,1]<=sett.long) and
                                   (y+way[2,2]>=1)  and (y+way[2,2]<=sett.wide) and
                                   (b[x+way[2,1],y+way[2,2]]=false)) = false) and
                                   (((x+way[3,1]>=1)  and (x+way[3,1]<=sett.long) and
                                   (y+way[3,2]>=1)  and (y+way[3,2]<=sett.wide) and
                                   (b[x+way[3,1],y+way[3,2]]=false)) = false) and
                                   (((x+way[0,1]>=1)  and (x+way[0,1]<=sett.long) and
                                   (y+way[0,2]>=1)  and (y+way[0,2]<=sett.wide) and
                                   (b[x+way[0,1],y+way[0,2]]=false)) = false)
                                   then exit;
                        until (x+way[ways,1]>=1)  and (x+way[ways,1]<=sett.long) and
                              (y+way[ways,2]>=1)  and (y+way[ways,2]<=sett.wide) and
                              (b[x+way[ways,1],y+way[ways,2]]=false);
                                b[x+way[ways,1],y+way[ways,2]]:=true;

                                map[ (x*2 + (x+way[ways,1])*2) div 2,
                                     (y*2 + (y+way[ways,2])*2) div 2
                                   ]:=0;
                                inc(bn);
                                DFS(x+way[ways,1],y+way[ways,2]);

                end;
        end;
End;


Procedure DFSMazeGener;
Var

        i,j:longint;
Begin
        for i:=1 to sett.long*2+1 do
            for j:=1 to sett.wide*2+1 do
              if (i mod 2=1) or (j mod 2=1) then map[i,j]:=1
              else map[i,j]:=0;
        for i:=1 to sett.wide do begin
                                        b[0,i]:=true;
                                        b[sett.long+1,i]:=true;
                                 end;
        for i:=1 to sett.long do begin
                                        b[i,0]:=true;
                                        b[i,sett.wide+1]:=true;
                                  end;

        bn:=1;
        b[1,1]:=true;
        DFS(1,1);

End;
