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

Procedure ReLanguageFile;
Var
	t:text;
Begin
                assign(t,rundir+'language\zh_cn.ini');
                rewrite(t);
                writeln(t,'Language_Version=3');
                writeln(t,'');
                writeln(t,'=====Global=====');
                writeln(t,'G_Press=&f�밴�¼���:');
                writeln(t,'G_Input=&f������:');
                writeln(t,'G_Info=&7[��Ϣ] ');
                writeln(t,'G_Error=&c[����] ');
                writeln(t,'G_Waring=&c[����] ');
                writeln(t,'G_Tip=&b[��ʾ] ');
                writeln(t,'G_Line=&c============================================================');
                writeln(t,'G_Welcome={');
                writeln(t,'');
                writeln(t,'&a��ӭʹ��&eHello&a! &bParacraf &7Maze Generator');
                writeln(t,'{NEWLINE}&9            ��');
                writeln(t,'{NEWLINE}&9        ����  ����');
                writeln(t,'{NEWLINE}&9    ����          ����');
                writeln(t,'{NEWLINE}&9  ��  &e��          ��&9  ��');
                writeln(t,'{NEWLINE}&9  ��    &e��      ��&9    ��');
                writeln(t,'{NEWLINE}&9  ��      &e��  ��&9      ��');
                writeln(t,'{NEWLINE}&9  ��        &e��&9        ��');
                writeln(t,'{NEWLINE}&9  ��        &e��&9        ��');
                writeln(t,'{NEWLINE}&9  ��        &e��&9        ��');
                writeln(t,'{NEWLINE}&9    ����    &e��&9    ����');
                writeln(t,'{NEWLINE}&9        ����&e��&9����');
                writeln(t,'{NEWLINE}&9            ��');
                writeln(t,'{NEWLINE}&c�������Ҫ�Ҹ������úõ�Ĭ��ֵ��ֱ�ӻس�����');
                writeln(t,'{NEWLINE}&b���������ʲôbug֮��ģ��鷳�����ǵ���̳������Ϣ');
                writeln(t,'}');
                writeln(t,'G_Gen=&b�������ɵ�ͼ');
                writeln(t,'G_Gen_Load=&d��ͼ���ɽ���');
                writeln(t,'G_OUT=&b���ڵ�����ͼ');
                writeln(t,'G_OUT_Load=&a��ͼ��������');
                writeln(t,'G_OUT_1=������');
                writeln(t,'G_OUT_2=ģ��');
                writeln(t,'G_OUT_3=LUA�ű�');
                writeln(t,'G_OUT_4=ƽ�洿�ı���ͼ');
                writeln(t,'G_Command_Wrong=&d������ô���');
                writeln(t,'');
                writeln(t,'========== = Auto Update = ==========');
                writeln(t,'G_Update_Check={');
                writeln(t,'[�Զ�����]&b���ڼ�����');
                writeln(t,'{NEWLINE}[�Զ�����]&a���������Һܷ��Ļ���������&bsetting.ini&a�а��ҹر�');
                writeln(t,'}');
                writeln(t,'G_Update_Check_YES=[�Զ�����]&c��⵽����');
                writeln(t,'G_Update_Check_NO=[�Զ�����]&bû�м�⵽����');
                writeln(t,'G_Update_DL_Succ=[�Զ�����]&d�������');
                writeln(t,'G_Update_DL_Fail=[�Զ�����]&d����ʧ��');
                writeln(t,'G_Update_Check_Fail=[�Զ�����]&b���ʧ��');
                writeln(t,'G_Update_Now=[�Զ�����]&f��ǰ�汾��');
                writeln(t,'G_Update_Latest=[�Զ�����]&f���°汾��');
                writeln(t,'G_pakte=&a��������˳�');
                writeln(t,'G_paktc=&a�����������');
                writeln(t,'');
                writeln(t,'====The Appearance Setting====');
                writeln(t,'TAS_TITLE={');
                writeln(t,'&b=================== = &a����趨 &b= ===================');
                writeln(t,'{NEWLINE}&b=============== = &c���������뷽��ID &b= ===============');
                writeln(t,'{NEWLINE}&b============= = &a֧��&dWorld Edit&a���ʽ &b=== ===========');
                writeln(t,'}');
                writeln(t,'TAS_Wall=&d�Թ�ǽ�ڵĲ���');
                writeln(t,'TAS_Wall_Def=&c[&eĬ�ϲ���:ӣ��Ҷ&c]');
                writeln(t,'TAS_Botton=&d�Թ������Ĳ���');
                writeln(t,'TAS_Botton_Def=&c[&eĬ�ϲ���:�ݵ�&c]');
                writeln(t,'TAS_Top=&d�Թ������Ĳ���');
                writeln(t,'TAS_Top_Def=&c[&eĬ�ϲ���:����&c]');
                writeln(t,'');
                writeln(t,'====The Map Setting====');
                writeln(t,'TMS_TITLE=&b��ͼ�趨');
                writeln(t,'TMS_Default_Error=&7�Ѿ��������õ�Ĭ��ֵ��');
                writeln(t,'TMS_Random=&d��ͼ����');
                writeln(t,'TMS_Random_Def=&c[&eĬ������:��ǰʱ��&c]');
                writeln(t,'TMS_Random_Time=&b�����ͼ��������:');
                writeln(t,'TMS_Wall_Tall=&d�Թ�ǽ�ڵĸ߶�');
                writeln(t,'TMS_Wall_Tall_Def=&c[&eĬ�ϸ߶�3&c][&e��Χ1..50&c]');
                writeln(t,'TMS_Wall_Thick=&d�Թ�ǽ�ڵĺ��');
                writeln(t,'TMS_Wall_Thick_Def=&c[&eĬ�Ϻ��1&c][&e��Χ1..5&c]');
                writeln(t,'TMS_Road=&d�Թ��ߵ��Ŀ��');
                writeln(t,'TMS_Road_Def=&c[&eĬ�Ͽ��1&c][&e��Χ1..5&c]');
                writeln(t,'TMS_Size=&d�Թ��Ĵ�С');
                writeln(t,'TMS_Size_Def=&c[&eĬ�ϴ�С10*10&c][&e��Χ5..300*5..300&c]');
                writeln(t,'TMS_Size_a=&b��&6�ھ����г��ķ���&b�ж��ٵ�:');
                writeln(t,'TMS_Size_b=&b��&6�ھ����иߵķ���&b�ж��ٵ�:');
                writeln(t,'TMS_Hole=&d�Թ�ǽ�ϴ򶴵ļ���&6[�����򶴿���������Ϸ�Ѷ�]');
                writeln(t,'TMS_Hole_Def=&c[&eĬ�ϼ���0%&c][&e��Χ0%..100%&c]');
                writeln(t,'TMS_Gener=&d����ʹ�����ַ�ʽ������ĵ�ͼ�أ�');
                writeln(t,'TMS_Gener_List={');
                writeln(t,'&a1 : [������� Normal]');
                writeln(t,'{NEWLINE}&a2 : [���prim Hard  ]');
                writeln(t,'}');
                writeln(t,'TMS_Gener_List_1=&7�������');
                writeln(t,'TMS_Gener_List_2=&7���prim');
                writeln(t,'');
                writeln(t,'TMS_Out=&d����ʹ�����ַ�ʽ������ĵ�ͼ�أ�');
                writeln(t,'TMS_Out_List={');
                writeln(t,'&a1 : [ ��Ϸ������ ]');
                writeln(t,'{NEWLINE}&a2 : [   ģ  ��   ]');
                writeln(t,'{NEWLINE}&a3 : [NPL �ű��ļ�]');
                writeln(t,'}');
                writeln(t,'TMS_Out_List_1=��Ϸ������');
                writeln(t,'TMS_Out_List_2=ģ��');
                writeln(t,'TMS_Out_List_3=NPL �ű��ļ�');
                writeln(t,'');
                writeln(t,'======= = WorldEdit = =======');
                writeln(t,'WE_IDR_Error_1=&d: �÷���������ʴ���100% &c[&e�Ѿ�����&c]');
                writeln(t,'WE_IDR_Error_2=&d: �ñ��ʽӵ�зǷ��ַ� &c[&e�Ѿ�����&c]');
                writeln(t,'WE_IDR_Error_100=&d�ܷ���������ʴ���100% &c[&e�Ѿ�����&c]');
                writeln(t,'WE_IDR_Error_101=&d�ܷ����������С��100% &c[&e�Ѿ�����&c]');
                writeln(t,'');
                writeln(t,'');
                writeln(t,'======= = Command = =======');
                writeln(t,'CMD_ERR_N_wt=&dǽ�ڸ߶Ȳ������������Ѿ����û�Ĭ��ֵ��');
                writeln(t,'CMD_ERR_N_ww=&d��·��Ȳ������������Ѿ����û�Ĭ��ֵ��');
                writeln(t,'CMD_ERR_N_wi=&dǽ���Ȳ������������Ѿ����û�Ĭ��ֵ��');
                writeln(t,'CMD_ERR_N_ms=&d�Թ���С�������������Ѿ����û�Ĭ��ֵ��');
                writeln(t,'CMD_ERR_N_h=&d�򶴼��ʲ������������Ѿ����û�Ĭ��ֵ��');
                writeln(t,'CMD_ERR_N_gener=&d������������������');
                writeln(t,'CMD_ERR_N_output=&d��������������');
                writeln(t,'CMD_ERR_N_GOnull=&dû���ҵ��������򵼳���');
                writeln(t,'G_Command_Readme={');
                writeln(t,'&b&a����ʹ�ð���{NEWLINE}');
                writeln(t,'HPCMG [-n]{NEWLINE}');
                writeln(t,'  [-w -b -t -r -wt -ww -ml -mw -h -gener -output]{NEWLINE}');
                writeln(t,'  [-rundir] [-outdir -outname]{NEWLINE}');
                writeln(t,'{NEWLINE}');
                writeln(t,'    -n  ������ڵ�һ��λ�ã����Ǵ�����ͨģʽ����˼{NEWLINE}');
                writeln(t,'    -w  �ַ��� ��Ϊǽ�ڵķ���{NEWLINE}');
                writeln(t,'    -b  �ַ��� ��Ϊ�����ķ���{NEWLINE}');
                writeln(t,'    -t  �ַ��� ��Ϊ�����ķ���{NEWLINE}');
                writeln(t,'    -r  �ַ��� ������ӣ���Ϊ��ͼ����������{NEWLINE}');
                writeln(t,'    -wt ����   ǽ��߶�{NEWLINE}');
                writeln(t,'    -ww ����   ��·���{NEWLINE}');
                writeln(t,'    -wi ����   ǽ����{NEWLINE}');
                writeln(t,'    -ml ����   ��ͼ��С x�����ж�������{NEWLINE}');
                writeln(t,'    -mw ����   ��ͼ��С z�����ж�������{NEWLINE}');
                writeln(t,'    -h  �ٷֱ� �ڵ�ͼ�е�ǽ�������ͨ����ɻ�·{NEWLINE}');
                writeln(t,'               �ʵ���ӿ��������Ѷ�{NEWLINE}');
                writeln(t,'    -gener  ���������� DFS/1 | PRIM/BFS/2{NEWLINE}');
                writeln(t,'    -output �������{NEWLINE}');
                writeln(t,'            command/cmd/1 | template/temp/2 | luacode/lua/npl/3{NEWLINE}');
                writeln(t,'    -rundir ����Ŀ¼�����е��ļ���������Ŀ¼�ж�ȡ{NEWLINE}');
                writeln(t,'    -outdir ���Ŀ¼��������ļ����ᱣ��������{NEWLINE}');
                writeln(t,'            �� -outnameһͬʹ��{NEWLINE}');
                writeln(t,'        -outname ������ļ��������벻������չ����');
                writeln(t,'}');
                writeln(t,'CMD_MapStream_Err=&c��ͼ��Ϣ����ʽ����');
                writeln(t,'');
                close(t);
End;


Procedure LanguageFile;
Var
	t:text;
Begin

                s:=rundir+'language\';
                i:=0;
                while pos('\',s)<>0 do begin
                        s1:=s1+ copy (s,1,pos('\',s));
                        delete(s,1,pos('\',s));
                        assign(t,s1+'ExistTest.txt');
                        reset(t);
                        i:=IOresult;
                        if i=3 then mkdir(s1)
                                else
                                begin
                                        if i=0 then close(t);
                                end;
                end;


        if
           (readstr('language\zh_cn.ini','Language_Version')<>'3') then
        begin
		ReLanguageFile
        end;


        assign(t,rundir+'language\zh_cn.ini');reset(t);
        if IOresult=2 then begin
 		ReLanguageFile
        end
        else
        close(t);
End;
