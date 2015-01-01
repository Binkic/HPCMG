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
 
 Procedure AEdfsH(x,y,xx,yy:longint);
        Procedure AEdfsS(x,y,xx,yy:longint);
        Var
                midx,midy:longint;
                holex,holey:longint;
                i:longint;
        Begin
                if yy-y>1 then begin
                        midy:=random(yy-y-2)+y+1;
                       // repeat
                        holex:=random(xx-x-2)+x+1;
                        //until map[holex*2+1,midy*2]=1;
                        //for i:=x to xx*2+1 do map[i,midy*2]:=1;
                        map[holex*2+1,midy*2]:=0;
                        AEdfsH(x,y,xx,midy);
                        AEdfsH(x,midy,xx,yy);
                end
                else
                begin

                        for i:=x*2 to xx*2 do
                                for j:=y*2 to yy*2 do begin
                                        if map[i,j]=1 then begin
                                                map[i,j]:=0;
                                                break;
                                        end;
                                end;

                end;
        End;
Var
        midx,midy:longint;
        holex,holey:longint;
        i:longint;
Begin
        if xx-x>1 then begin
                midx:=random(xx-x-2)+x+1;
                //repeat
                        holey:=random(yy-y-2)+y+1;
               // until (map[midx*2,holey*2+1]=1);
                //for i:=y to yy*2+1 do map[midx*2,i]:=1;
                map[midx*2,holey*2+1]:=0;
                AEdfsS(x,y,midx,yy);
                AEdfsS(midx,y,xx,yy);
        end
        else
        begin
                for i:=x*2 to xx*2 do
                        for j:=y*2 to yy*2 do begin
                                if map[i,j]=1 then begin
                                        map[i,j]:=0;
                                        break;
                                end;
                        end;
        end;
End;

Procedure AEmazeGener;
Var
        i,j:longint;
Begin

        for i:=1 to sett.long*2+1 do
            for j:=1 to sett.wide*2+1 do
              if (i mod 2=1) or (j mod 2=1)// or (i=sett.long*2+1) or (j=sett.wide*2+1)
              then map[i,j]:=1
              else map[i,j]:=0;

        for i:=1 to sett.wide do begin
                                        b[0,i]:=true;
                                        b[sett.long+1,i]:=true;
                                 end;
        for i:=1 to sett.long do begin
                                        b[i,0]:=true;
                                        b[i,sett.wide+1]:=true;
                                  end;

        aEdfsH(1,1,sett.long,sett.wide);
        //DfS(1,1);
End;
