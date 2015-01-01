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

Procedure CheckForUpdate;
Var
        programfilename:string;
Begin

        if Upcase(readstr('setting.ini','AutoUpdate')) <> 'TRUE' then exit;


        printtext('G_Update_Check',1,1,0,0);
        printtext('G_Update_Now',0,1,0,0);
        textcolor(15);
        writeln(' ',NowVersion);
        textcolor(7);
        if FtpGetFile('riotidea.tk','21','HPC\MG\Version.txt','CheckFotUpdate.txt','dl.riotidea.tk|Client','e5L6I4aXiI3IcvpY') then
                begin
                        assign(t,'CheckFotUpdate.txt');reset(t);
                        readln(t,version);
                        close(t);
                        if version>NowVersion then
                        begin
                                printtext('G_Update_Check_YES',1,1,0,0);
                                printtext('G_Update_Latest',0,1,0,0);
                                textcolor(15);
                                writeln(' ',Version);
                                textcolor(7);
                                if FtpGetFile('riotidea.tk','21','HPC\MG\'+numtochar(version)+'.exe','Update.exe','dl.riotidea.tk|Client','e5L6I4aXiI3IcvpY') then
                                begin
                                        printtext('G_Update_DL_Succ',1,1,0,0);
                                        programfilename:=(ParamStr(0));
                                        while pos('\',programfilename)>0 do
                                                delete(programfilename,1,pos('\',programfilename));
                                        exec('cmd','/k taskkill /f /im '+programfilename+' & update.exe & exit');
                                end
                                else
                                begin
                                        printtext('G_Update_DL_Fail',1,1,0,0);
                                end;
                        end
                        else
                        begin
                                printtext('G_Update_Check_NO',1,1,0,0);
                        end;
                end
                else
                begin
                        printtext('G_Update_Check_Fail',1,1,0,0);
                end;

End;
