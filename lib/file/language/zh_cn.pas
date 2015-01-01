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

Procedure ReLanguageFile;
Var
	t:text;
Begin
                assign(t,rundir+'language\zh_cn.ini');
                rewrite(t);
                writeln(t,'Language_Version=3');
                writeln(t,'');
                writeln(t,'=====Global=====');
                writeln(t,'G_Press=&f请按下键盘:');
                writeln(t,'G_Input=&f请输入:');
                writeln(t,'G_Info=&7[信息] ');
                writeln(t,'G_Error=&c[错误] ');
                writeln(t,'G_Waring=&c[警告] ');
                writeln(t,'G_Tip=&b[提示] ');
                writeln(t,'G_Line=&c============================================================');
                writeln(t,'G_Welcome={');
                writeln(t,'');
                writeln(t,'&a欢迎使用&eHello&a! &bParacraf &7Maze Generator');
                writeln(t,'{NEWLINE}&9            ■');
                writeln(t,'{NEWLINE}&9        ■■  ■■');
                writeln(t,'{NEWLINE}&9    ■■          ■■');
                writeln(t,'{NEWLINE}&9  ■  &e■          ■&9  ■');
                writeln(t,'{NEWLINE}&9  ■    &e■      ■&9    ■');
                writeln(t,'{NEWLINE}&9  ■      &e■  ■&9      ■');
                writeln(t,'{NEWLINE}&9  ■        &e■&9        ■');
                writeln(t,'{NEWLINE}&9  ■        &e■&9        ■');
                writeln(t,'{NEWLINE}&9  ■        &e■&9        ■');
                writeln(t,'{NEWLINE}&9    ■■    &e■&9    ■■');
                writeln(t,'{NEWLINE}&9        ■■&e■&9■■');
                writeln(t,'{NEWLINE}&9            ■');
                writeln(t,'{NEWLINE}&c如果你需要我给你设置好的默认值请直接回车即可');
                writeln(t,'{NEWLINE}&b如果发现了什么bug之类的，麻烦到我们的论坛反馈信息');
                writeln(t,'}');
                writeln(t,'G_Gen=&b正在生成地图');
                writeln(t,'G_Gen_Load=&d地图生成进度');
                writeln(t,'G_OUT=&b正在导出地图');
                writeln(t,'G_OUT_Load=&a地图导出进度');
                writeln(t,'G_OUT_1=命令行');
                writeln(t,'G_OUT_2=模板');
                writeln(t,'G_OUT_3=LUA脚本');
                writeln(t,'G_OUT_4=平面纯文本地图');
                writeln(t,'G_Command_Wrong=&d命令调用错误');
                writeln(t,'');
                writeln(t,'========== = Auto Update = ==========');
                writeln(t,'G_Update_Check={');
                writeln(t,'[自动更新]&b正在检测更新');
                writeln(t,'{NEWLINE}[自动更新]&a如果你觉得我很烦的话，可以在&bsetting.ini&a中把我关闭');
                writeln(t,'}');
                writeln(t,'G_Update_Check_YES=[自动更新]&c检测到更新');
                writeln(t,'G_Update_Check_NO=[自动更新]&b没有检测到更新');
                writeln(t,'G_Update_DL_Succ=[自动更新]&d下载完毕');
                writeln(t,'G_Update_DL_Fail=[自动更新]&d下载失败');
                writeln(t,'G_Update_Check_Fail=[自动更新]&b检测失败');
                writeln(t,'G_Update_Now=[自动更新]&f当前版本号');
                writeln(t,'G_Update_Latest=[自动更新]&f最新版本号');
                writeln(t,'G_pakte=&a按任意键退出');
                writeln(t,'G_paktc=&a按任意键继续');
                writeln(t,'');
                writeln(t,'====The Appearance Setting====');
                writeln(t,'TAS_TITLE={');
                writeln(t,'&b=================== = &a外观设定 &b= ===================');
                writeln(t,'{NEWLINE}&b=============== = &c材料请输入方块ID &b= ===============');
                writeln(t,'{NEWLINE}&b============= = &a支持&dWorld Edit&a表达式 &b=== ===========');
                writeln(t,'}');
                writeln(t,'TAS_Wall=&d迷宫墙壁的材料');
                writeln(t,'TAS_Wall_Def=&c[&e默认材料:樱花叶&c]');
                writeln(t,'TAS_Botton=&d迷宫底座的材料');
                writeln(t,'TAS_Botton_Def=&c[&e默认材料:草地&c]');
                writeln(t,'TAS_Top=&d迷宫顶部的材料');
                writeln(t,'TAS_Top_Def=&c[&e默认材料:空气&c]');
                writeln(t,'');
                writeln(t,'====The Map Setting====');
                writeln(t,'TMS_TITLE=&b地图设定');
                writeln(t,'TMS_Default_Error=&7已经给您设置到默认值了');
                writeln(t,'TMS_Random=&d地图种子');
                writeln(t,'TMS_Random_Def=&c[&e默认种子:当前时间&c]');
                writeln(t,'TMS_Random_Time=&b这个地图的种子是:');
                writeln(t,'TMS_Wall_Tall=&d迷宫墙壁的高度');
                writeln(t,'TMS_Wall_Tall_Def=&c[&e默认高度3&c][&e范围1..50&c]');
                writeln(t,'TMS_Wall_Thick=&d迷宫墙壁的厚度');
                writeln(t,'TMS_Wall_Thick_Def=&c[&e默认厚度1&c][&e范围1..5&c]');
                writeln(t,'TMS_Road=&d迷宫走道的宽度');
                writeln(t,'TMS_Road_Def=&c[&e默认宽度1&c][&e范围1..5&c]');
                writeln(t,'TMS_Size=&d迷宫的大小');
                writeln(t,'TMS_Size_Def=&c[&e默认大小10*10&c][&e范围5..300*5..300&c]');
                writeln(t,'TMS_Size_a=&b长&6在矩阵中长的方向&b有多少道:');
                writeln(t,'TMS_Size_b=&b宽&6在矩阵中高的方向&b有多少道:');
                writeln(t,'TMS_Hole=&d迷宫墙上打洞的几率&6[适量打洞可以增加游戏难度]');
                writeln(t,'TMS_Hole_Def=&c[&e默认几率0%&c][&e范围0%..100%&c]');
                writeln(t,'TMS_Gener=&d你想使用哪种方式生成你的地图呢？');
                writeln(t,'TMS_Gener_List={');
                writeln(t,'&a1 : [深度优先 Normal]');
                writeln(t,'{NEWLINE}&a2 : [随机prim Hard  ]');
                writeln(t,'}');
                writeln(t,'TMS_Gener_List_1=&7深度优先');
                writeln(t,'TMS_Gener_List_2=&7随机prim');
                writeln(t,'');
                writeln(t,'TMS_Out=&d你想使用哪种方式导出你的地图呢？');
                writeln(t,'TMS_Out_List={');
                writeln(t,'&a1 : [ 游戏命令行 ]');
                writeln(t,'{NEWLINE}&a2 : [   模  板   ]');
                writeln(t,'{NEWLINE}&a3 : [NPL 脚本文件]');
                writeln(t,'}');
                writeln(t,'TMS_Out_List_1=游戏命令行');
                writeln(t,'TMS_Out_List_2=模板');
                writeln(t,'TMS_Out_List_3=NPL 脚本文件');
                writeln(t,'');
                writeln(t,'======= = WorldEdit = =======');
                writeln(t,'WE_IDR_Error_1=&d: 该方块产生几率大于100% &c[&e已经忽略&c]');
                writeln(t,'WE_IDR_Error_2=&d: 该表达式拥有非法字符 &c[&e已经忽略&c]');
                writeln(t,'WE_IDR_Error_100=&d总方块产生几率大于100% &c[&e已经忽略&c]');
                writeln(t,'WE_IDR_Error_101=&d总方块产生几率小于100% &c[&e已经忽略&c]');
                writeln(t,'');
                writeln(t,'');
                writeln(t,'======= = Command = =======');
                writeln(t,'CMD_ERR_N_wt=&d墙壁高度参数输入有误，已经设置回默认值了');
                writeln(t,'CMD_ERR_N_ww=&d道路宽度参数输入有误，已经设置回默认值了');
                writeln(t,'CMD_ERR_N_wi=&d墙体厚度参数输入有误，已经设置回默认值了');
                writeln(t,'CMD_ERR_N_ms=&d迷宫大小参数输入有误，已经设置回默认值了');
                writeln(t,'CMD_ERR_N_h=&d打洞几率参数输入有误，已经设置回默认值了');
                writeln(t,'CMD_ERR_N_gener=&d生成器参数输入有误');
                writeln(t,'CMD_ERR_N_output=&d导出器输入有误');
                writeln(t,'CMD_ERR_N_GOnull=&d没有找到生成器或导出器');
                writeln(t,'G_Command_Readme={');
                writeln(t,'&b&a命令使用帮助{NEWLINE}');
                writeln(t,'HPCMG [-n]{NEWLINE}');
                writeln(t,'  [-w -b -t -r -wt -ww -ml -mw -h -gener -output]{NEWLINE}');
                writeln(t,'  [-rundir] [-outdir -outname]{NEWLINE}');
                writeln(t,'{NEWLINE}');
                writeln(t,'    -n  必须放在第一个位置，这是代表普通模式的意思{NEWLINE}');
                writeln(t,'    -w  字符串 作为墙壁的方块{NEWLINE}');
                writeln(t,'    -b  字符串 作为底座的方块{NEWLINE}');
                writeln(t,'    -t  字符串 作为顶部的方块{NEWLINE}');
                writeln(t,'    -r  字符串 随机种子，作为地图的生成依据{NEWLINE}');
                writeln(t,'    -wt 数字   墙体高度{NEWLINE}');
                writeln(t,'    -ww 数字   道路宽度{NEWLINE}');
                writeln(t,'    -wi 数字   墙体厚度{NEWLINE}');
                writeln(t,'    -ml 数字   地图大小 x轴上有多少条道{NEWLINE}');
                writeln(t,'    -mw 数字   地图大小 z轴上有多少条道{NEWLINE}');
                writeln(t,'    -h  百分比 在地图中的墙里随机打通，造成回路{NEWLINE}');
                writeln(t,'               适当添加可以增加难度{NEWLINE}');
                writeln(t,'    -gener  生成器名字 DFS/1 | PRIM/BFS/2{NEWLINE}');
                writeln(t,'    -output 输出方法{NEWLINE}');
                writeln(t,'            command/cmd/1 | template/temp/2 | luacode/lua/npl/3{NEWLINE}');
                writeln(t,'    -rundir 运行目录，所有的文件将会从这个目录中读取{NEWLINE}');
                writeln(t,'    -outdir 输出目录，输出的文件将会保存在这里{NEWLINE}');
                writeln(t,'            和 -outname一同使用{NEWLINE}');
                writeln(t,'        -outname 输出的文件名，输入不包括扩展名。');
                writeln(t,'}');
                writeln(t,'CMD_MapStream_Err=&c地图信息串格式错误');
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
