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
Function Base64_Encryption(s:string):string;
Var
        st:string;
        i :longint;
Begin
        Base64_Encryption:='';
        st:='';
        for i:=1 to length(s) do begin
                st:=st+Hex_Conversion_10to2( integer(s[i]) );

                while length(st)>=6 do begin
                        Base64_Encryption:=Base64_Encryption + TheBase64Alphabet[
                                           Hex_Conversion_2to10('00'+copy(st,1,6))
                                           +1];
                        delete(st,1,6);
                end;
        end;

        if length(st)=2 then begin
                Base64_Encryption:=Base64_Encryption + TheBase64Alphabet[
                                           Hex_Conversion_2to10('00'+st+'0000')
                                           +1]+'==';
        end;

        if length(st)=4 then begin
                Base64_Encryption:=Base64_Encryption + TheBase64Alphabet[
                                           Hex_Conversion_2to10('00'+st+'00')
                                           +1]+'=';
        end;


End;

Function Base64_Decryption(s:string):string;
Var
        st:string;
        len:longint;
        i :longint;
Begin
        Base64_Decryption:='';
        st:='';
        len:=length(s);
        i:=1;
        while i<=len do begin
                if s[i]<>'=' then begin
                        st:=st+copy(
                             Hex_Conversion_10to2(
                                        pos(s[i],TheBase64Alphabet)-1
                            ),3,8);
                        while length(st)>=8 do begin
                                Base64_Decryption:=Base64_Decryption+
                                                   char(Hex_Conversion_2to10(
                                                   copy(st,1,8)));
                                delete(st,1,8);
                        end;

                end
                else
                begin
                        if i=len then begin
                                Base64_Decryption:=Base64_Decryption+
                                                   char(Hex_Conversion_2to10(
                                                   copy(st,1,6)));
                        end;
                        if i=len-1 then begin
                                Base64_Decryption:=Base64_Decryption+
                                                   char(Hex_Conversion_2to10(
                                                   copy(st,1,4)));
                                i:=i+1;
                        end;
                        if i<len-1 then begin
                                exit('FALSE');
                        end;
                end;

                inc(i);
        end;

End;