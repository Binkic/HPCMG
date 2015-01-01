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

 Procedure PrintOutBlock(x,y,z:longint;b:idfm);
Begin
        if sett.outway=1 then
        begin
                write(t,'/setblock ~',x,' ~',y,' ~',z,' ',b.id);
                if b.fj='' then writeln(t) else writeln(t,' ',b.fj);
        end;

        if sett.outway=2 then
        begin
                writeln(t,'        {',x,',',y,',',z,',',b.id,',},');
        end;

        if sett.outway=3 then
        begin
                writeln(t,'                cmd("/setblock ',x,' ',y,' ',z,' ',b.id,' ',b.fj,'",nil,',')');;
        end;


End;

Procedure SetBlock(x,y,z,xx,yy,zz:longint;
                   Bid:ids);
Var
        i,j,k,l:longint;
        fk   :idfm;
        chan:longint;
Begin
        if x>xx then jh(x,xx);
        if y>yy then jh(y,yy);
        if z>zz then jh(z,zz);
        for i:=x to xx do
            for j:=y to yy do
                for k:=z to zz do begin

                        chan:=random(10000);
                        for l:=1 to Bid[0].id do begin
                                chan:=chan-bid[l].ch;
                                if chan<=0 then begin
                                        fk:=bid[l];
                                        break;
                                end;
                        end;

                        if fk.id<>0 then
                        PrintOutBlock(i,j,k,fk);
                end;
End;

Procedure SetUpTheBorad;
Begin
                {SetBlock(1,1,1,
                        (sett.long+1)*sett.thick+sett.long*sett.road,sett.tall,1,
                         sett.wall);
                SetBlock(1,1,(sett.wide+1)*sett.thick+sett.wide*sett.road,
                        (sett.long+1)*sett.thick+sett.long*sett.road,
                        sett.tall,
                        (sett.wide+1)*sett.thick+sett.wide*sett.road,
                        sett.wall);
                SetBlock(1,1,1,
                         1,sett.tall,(sett.wide+1)*sett.thick+sett.wide*sett.road,
                         sett.wall);
                SetBlock((sett.long+1)*sett.thick+sett.long*sett.road,1,1,
                         (sett.long+1)*sett.thick+sett.long*sett.road,
                         sett.tall,
                         (sett.wide+1)*sett.thick+sett.road*sett.wide,
                         sett.wall);   }
                SetBlock(1,0,1,
                         (sett.long+1)*sett.thick+sett.road*sett.long,0,
                         (sett.wide+1)*sett.thick+sett.road*sett.wide,
                          sett.botton);
                SetBlock(1,sett.tall+1,1,
                         (sett.long+1)*sett.thick+sett.road*sett.long,
                         sett.tall+1,
                         (sett.wide+1)*sett.thick+sett.road*sett.wide,
                          sett.top);
End;

Function nowtime:string;
Var
        a,b,c,d,e,f,g,h:word;
        out:string;
Begin
        getdate(a,b,c,d);
        gettime(e,f,g,h);

        out:='';
        out:=out+numtochar(a)+'-';

        if b>10 then out:=out+numtochar(b)+'-' else out:=out+'0'+numtochar(b)+'-';
        if c>10 then out:=out+numtochar(c)+'_' else out:=out+'0'+numtochar(c)+'_';

        if e>10 then out:=out+numtochar(e) else out:=out+'0'+numtochar(e);
        if f>10 then out:=out+numtochar(f) else out:=out+'0'+numtochar(f);
        if f>10 then out:=out+numtochar(f) else out:=out+'0'+numtochar(f);

        exit(out);





End;

Procedure PrintOutMap;
Var
        i,j:longint;
        path:string;
        a,b,c,d,e:word;
Begin
        gettime(a,b,c,d);
        e:=c;

        if outdir='' then
        path:=rundir+'out\'+randomseed+'\'+
              readstr('language\'+language+'.ini','G_OUT_'+numtochar(sett.outway) )+
              '_'+randomseed
        else
                path:=outdir+outname;

        if sett.outway=3 then
                path:=path+'.lua';
        if sett.outway=1 then
                path:=path+'.txt';
        if sett.outway=2 then
                path:=path+'.blocks.xml';

        assign(t,path);
        rewrite(t);

                if sett.outway=3 then begin
                        writeln(t,'--  Hello! Paracraft Maze Generator for Paracraft');
                        writeln(t,'--  Copyright (C) 2014 Eric_Lian <https://github.com/ExerciseBook/HPCMG>');
                        writeln(t,'-- ');
                        writeln(t,'--  This program is free software: you can redistribute it and/or modify');
                        writeln(t,'--  it under the terms of the GNU General Public License as published by');
                        writeln(t,'--  the Free Software Foundation, either version 3 of the License, or');
                        writeln(t,'--  (at your option) any later version.');
                        writeln(t,'-- ');
                        writeln(t,'--  This program is distributed in the hope that it will be useful,');
                        writeln(t,'--  but WITHOUT ANY WARRANTY; without even the implied warranty of');
                        writeln(t,'--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the');
                        writeln(t,'--  GNU General Public License for more details.');
                        writeln(t,'-- ');
                        writeln(t,'--  You should have received a copy of the GNU General Public License');
                        writeln(t,'--  along with this program.  If not, see <http://www.gnu.org/licenses/>.');
                        writeln(t,'-- ');
                        writeln(t,'--  ===========================================================================');
                        writeln(t,'--  上面都是我复制粘贴的，反正最终解释权归我所有啦!');
                        writeln(t,'--  All above that is I copied from another place .');
                        writeln(t,'--  All in all . Don''t do something wrong on my code .');
                        writeln(t,'function main(entity)');
                end;

                if sett.outway=2 then begin
                        writeln(t,'<pe:blocktemplate author_nid="0" name="',randomseed,'" creation_date="',nowtime,'">');
                        writeln(t,'        <pe:blocks>{');
                end;

                {Set Up The Borad}
                SetUpTheBorad;

                for i:=1 to sett.long*2+1 do
                    for j:=1 to sett.wide*2+1 do begin
                        if map[i,j]=1 then begin
                                gettime(a,b,c,d);
                                if e<>c then begin
                                        printtext('G_OUT_Load',0,1,0,0);
                                        textcolor(11);
                                        writeln(((i-1) * (sett.wide*2-1) + j) / ((sett.long*2-1)*(sett.wide*2-1)) *100 :7:2,'%');
                                        textcolor(7);
                                        e:=c;
                                end;
                                {setblock((i-1)*sett.thick+1,
                                         1,
                                         (j-1)*sett.thick+1,
                                         (i-1)*sett.thick+sett.thick,
                                         sett.tall,
                                         (j-1)*sett.thick+sett.thick,
                                         sett.wall
                                );}

                                if (i mod 2=1) and (j mod 2=1) then
                                setblock(
                                        (i div 2)*sett.road+((i-1) div 2)*sett.thick+1,
                                        1,
                                        (j div 2)*sett.road+((j-1) div 2)*sett.thick+1,
                                        (i div 2)*sett.road+((i-1) div 2)*sett.thick+sett.thick,
                                        sett.tall,
                                        (j div 2)*sett.road+((j-1) div 2)*sett.thick+sett.thick,
                                        sett.wall
                                        );


                                if (i mod 2=0) and (j mod 2=1) then begin
                                setblock(
                                        (i div 2-1)*sett.road+(i div 2)*sett.thick+1,
                                        1,
                                        (j div 2)*sett.road+((j-1) div 2)*sett.thick+1,
                                        (i div 2-1)*sett.road+(i div 2)*sett.thick+sett.road+1,
                                        sett.tall,
                                        (j div 2)*sett.road+((j-1) div 2)*sett.thick+sett.thick,
                                        sett.wall
                                        );
                                end;

                                if (i mod 2=1) and (j mod 2=0) then
                                setblock(
                                        (i div 2)*sett.road+((i-1) div 2)*sett.thick+1,
                                        1,
                                        (j div 2-1)*sett.road+(j div 2)*sett.thick+1,
                                        (i div 2)*sett.road+((i-1) div 2)*sett.thick+sett.thick,
                                        sett.tall,
                                        (j div 2-1)*sett.road+(j div 2)*sett.thick+sett.road+1,
                                        sett.wall
                                        );


                        end;
                    end;

                if sett.outway=3 then writeln(t,'end');
                if sett.outway=2 then begin
                        writeln(t,'}');
                        writeln(t,'        </pe:blocks>');
                        writeln(t,'</pe:blocktemplate>');
                end;

        close(t);
End;
