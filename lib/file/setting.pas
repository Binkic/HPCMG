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
 * ���涼���Ҹ���ճ���ģ��������ս���Ȩ����������!
 * All above that is I copied from another place .
 * All in all . Don't do something wrong on my code .
 *)

Procedure ReWriteSettingFile;
Var
	t:text;
Begin
                assign(t,rundir+'setting.ini');
                rewrite(t);
                writeln(t,'=================');
                writeln(t,'===False�ǹر�===');
                writeln(t,'===True �ǿ���===');
                writeln(t,'=================');
                writeln(t,'');
		writeln(t,'�����ļ��汾 ');
                writeln(t,'Version=2');
                writeln(t,'');
                writeln(t,'�Զ�����');
                writeln(t,'AutoUpdate=True');
                writeln(t,'');
                writeln(t,'��������');
                writeln(t,'Language=zh_cn');
                close(t);
End;


Procedure SettingFile;
Var
	t:text;
Begin

        if
           (readstr('setting.ini','Version')<>'2') then
        begin
		ReWriteSettingFile
        end;


        assign(t,rundir+'setting.ini');reset(t);
        if IOresult=2 then begin
 		ReWriteSettingFile
        end
        else
        close(t);
End;
