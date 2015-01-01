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
 
 Procedure WallDigging;
Var
        i,j:longint;
        r : longint;
Begin
        for i:=2 to sett.long*2 do
                for j:=2 to sett.wide*2 do
                begin
                        r:=random(10000);
                        if r-sett.hole*100<0 then
                                map[i,j]:=0;
                end;
End;
