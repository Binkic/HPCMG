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

uses md5,dos,crt,math,
     blcksock,ftpsend,httpsend,
     synacode,synafpc,synaip,synautil,synsock;
{$I-}
{$h+}

type
        idfm=record
                ID    :longint;
                Fj    :string;       //ID:Fj
                CH    :Longint;      //Chance 10000 set to 100%
             end;
        ids=array[0..4096]of idfm;   //[0].ID , [0].CH is the totel
        //aeraa=array[0..10000,0..110,0..10000]of idfm;

Var
        way:array[0..3,1..2] of integer = ((-1,0),(1,0),(0,1),(0,-1));
        bn :longint;
        map:array[0..601,0..601]of integer;
        b  :array[0..301,0..301]of boolean;
        f  :array[0..1000000,1..2]of longint;
        lb :longint;

        sett : record                //the setting of the gener
                wall,botton,top : ids;
                tall,road,long,wide,thick,hole,way,outway : longint;
                add:boolean;
               end;

        i:longint;
        language: string;
        t    : text;
        randomseed:string;
        version,nowversion:longint;
        TheBase64Alphabet : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
                                     'abcdefghijklmnopqrstuvwxyz'+
                                     '0123456789' + '+/';
        rundir,outdir,s,s1,outname:string;
        slient:boolean;
        genps:longint;
        c:word;

        p:array [1..13]of boolean;

{$INCLUDE lib/tools.pas}
{$INCLUDE lib/worldedit.pas}
{$INCLUDE lib/base64.pas}
{$INCLUDE lib/Command.pas}
{$INCLUDE lib/CheckForUpdate.pas}

{$INCLUDE lib/file/setting.pas}
{$INCLUDE lib/file/language/zh_cn.pas}

{$INCLUDE lib/gener/DFSmazeGener.pas}
{$INCLUDE lib/gener/PRIMmazeGener.pas}
//{$INCLUDE lib/gener/AEmazeGener.pas}
{$INCLUDE lib/gener/WallDigging.pas}

{$INCLUDE lib/io/PrintOutTextMap.pas}
{$INCLUDE lib/io/io.pas}
{$INCLUDE lib/io/PrintOutMap.pas}



Procedure test;
Var
        i,j:longint;
        programfilename:string;
        t:text;
Begin
End;

{============================================================================}
{================================ = Main = ==================================}
{============================================================================}
Begin
        NowVersion:=25;
        sett.add:=true;
        i:=1;
        rundir:='';
        outdir:='';
        slient:=false;
        while ParamStr(i)<>'' do begin
                if (upcase(ParamStr(i))<>'-RUNDIR') and
                   (upcase(ParamStr(i))<>'-OUTDIR')  and
                   (upcase(ParamStr(i))<>'-OUTNAME') then slient:=true;


                if upcase(ParamStr(i))='-RUNDIR' then begin
                        rundir:=paramstr(i+1);
                        while pos('/',rundir)<>0 do rundir[pos('/',rundir)]:='\';
                        if rundir[length(rundir)]<>'\' then rundir:=rundir+'\';
                        inc(i);
                end;
                if upcase(ParamStr(i))='-OUTDIR' then begin
                        outdir:=paramstr(i+1);
                        while pos('/',outdir)<>0 do outdir[pos('/',outdir)]:='\';
                        if outdir[length(outdir)]<>'\' then outdir:=outdir+'\';
                        inc(i);
                end;
                if upcase(ParamStr(i))='-OUTNAME' then begin
                        outname:=paramstr(i+1);
                        if outname[length(outname)]<>'\' then outname:=outname;
                        inc(i);
                end;
                if upcase(ParamStr(i))='-ADD' then begin
                        sett.add:=true;
                end;

                inc(i)
        end;

        settingfile;
        languagefile;


        language:=readstr('setting.ini','Language') ;
        textcolor(7);
        test;

        if upcase(ParamStr(1))<>'-DELETETEMP' then
        printtext('G_Welcome',1,1,0,0);

        if paramstr(1)<>'' then command;

        if (slient=false) or (sett.add=true) then
        begin
                CheckForUpdate;
                ReadIn;
        end
        else
        begin
                Command;
        end;



        printtext('G_Gen',1,1,0,0);
        case sett.way of
                1: DFSmazeGener;
                2: PRIMmazeGener;
        end;
        WallDigging;

        printtext('G_OUT',1,1,0,0);

        {Is OUTPUT Foder Exist?}
        if outdir='' then begin
				CreateDir(rundir+'out\'+Randomseed+'\');
        end
        else
        begin
				CreateDir(outdir);
        end;


        PrintOutMap;
        if outdir='' then PrintOutTextMap;
        if outdir='' then begin
                exec('explorer',rundir+'out\'+randomseed);
                printtext('G_pakte',1,1,0,0);
                if ParamStr(1)='' then readkey;
        end;
End.
