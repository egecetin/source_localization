function [ui]=maincalc(event,handles)
    persistent databuff local xp yp timelabels timeticks oldtimer
    if isempty(databuff) % Sadece ilk çaðýrmada boþ olacak
        % - Init variables
        oldtimer=0;
        databuff=zeros(handles.fs*handles.time*6,3);
        ang=0:0.01:2*pi;
        xp=cos(ang);yp=sin(ang);
        timelabels={num2str(-handles.time*5),num2str(-handles.time*4),num2str(-handles.time*3),num2str(-handles.time*2),num2str(-handles.time),num2str(0)};
        timeticks=[handles.fs*handles.time handles.fs*handles.time*2 handles.fs*handles.time*3 handles.fs*handles.time*4 handles.fs*handles.time*5 handles.fs*handles.time*6];
        
        % - Init GUI
        local.f=uifigure('Name','Sound Localization','Visible','off','Position',[50 50 810 501]);
        ui=local.f;
        local.panel1=uipanel('Parent',local.f,'BorderType','none','Title','Channel 1','Position',[28 336 223 132]);
        local.panel2=uipanel('Parent',local.f,'BorderType','none','Title','Channel 2','Position',[28 186 223 132]);
        local.panel3=uipanel('Parent',local.f,'BorderType','none','Title','Channel 3','Position',[28 36 223 132]);
        local.panel4=uipanel('Parent',local.f,'BorderType','none','Title','Signal Source','Position',[265 39 541 429]);
        local.axes1=uiaxes('Parent',local.panel4,'Units','Pixels','Position',[35 29 485 375],'Color','none');
        local.axes2=uiaxes('Parent',local.panel1,'Units','Pixels','Position',[12 12 201 101],'Color','none');
        local.axes3=uiaxes('Parent',local.panel2,'Units','Pixels','Position',[12 12 201 101],'Color','none');
        local.axes4=uiaxes('Parent',local.panel3,'Units','Pixels','Position',[12 12 201 101],'Color','none');
        local.status=uilabel('Parent',local.f,'Position',[265 0 541 18],'Text','');
        
        % Set GUI visible
        local.f.Visible='on';
        drawnow;
        return;
    end

    %event.Data=randn([25000 3]);
    % - Merge event.Data and Write
    databuff(1:handles.fs*handles.time*5,:)=databuff(handles.fs*handles.time+1:end,:);
    databuff(handles.fs*handles.time*5+1:end,:)=event.Data(:,:);
    if handles.filestat
        fprintf(handles.file,'%f %f %f\n',(event.Data(:,:))');
    end
    
    % - Plot event.Data
    ylimit=ceil(max(max(abs(databuff))));
    plot(local.axes2,databuff(:,1));axis(local.axes2,'tight');
    xticks(local.axes2,timeticks);xticklabels(local.axes2,timelabels);
    ylim(local.axes2,[-ylimit ylimit]);
    plot(local.axes3,databuff(:,2));axis(local.axes3,'tight');
    xticks(local.axes3,timeticks);xticklabels(local.axes3,timelabels);
    ylim(local.axes3,[-ylimit ylimit]);
    plot(local.axes4,databuff(:,3));axis(local.axes4,'tight');
    xticks(local.axes4,timeticks);xticklabels(local.axes4,timelabels);
    ylim(local.axes4,[-ylimit ylimit]);
    
    % - Calculations
    cor12=xcorr(event.Data(:,1),event.Data(:,2));
    cor13=xcorr(event.Data(:,1),event.Data(:,3));
    cor23=xcorr(event.Data(:,2),event.Data(:,3));

    [genlik12,zamanf12]=max(cor12);
    [genlik13,zamanf13]=max(cor13);
    [genlik23,zamanf23]=max(cor23);
    
    afcor12=zamanf12-handles.time*handles.fs;
    afcor13=zamanf13-handles.time*handles.fs;
    afcor23=zamanf23-handles.time*handles.fs;
    afm12=afcor12*handles.speed/handles.fs;
    afm13=afcor13*handles.speed/handles.fs;
    afm23=afcor23*handles.speed/handles.fs;

    if ((afcor12>=0) && (afcor13>=0) && (afcor23>=0))
        a=abs(afm13);
        b=abs(afm23);
        c=0;
    elseif ((afcor12<=0) && (afcor13>=0) && (afcor23>=0))
        a=abs(afm13);    
        b=abs(afm23);     
        c=0;
    elseif ((afcor12>=0) && (afcor13>=0) && (afcor23<=0))
        a=abs(afm12);
        b=0;
        c=abs(afm23); 
    elseif ((afcor12>=0) && (afcor13<=0) && (afcor23<=0))
        a=abs(afm12);
        b=0;
        c=abs(afm23);
    elseif ((afcor12<=0) && (afcor13<=0) && (afcor23>=0))
        a=0;
        b=abs(afm12);
        c=abs(afm13);
    elseif ((afcor12<=0) && (afcor13<=0) && (afcor23<=0))
        a=0;
        b=abs(afm12);
        c=abs(afm13);    
    else
        a=abs(afm12);
        b=abs(afm13);
        c=abs(afm23);     
    end

    % - Iteration

    f = @(x) [x(1)^2 + (x(2)-handles.yo)^2 - (x(3)+a)^2;
              x(1)^2+x(2)^2-(x(3)+b)^2
             (x(1)-handles.xo)^2+x(2)^2-(x(3)+c)^2];
    % The Jacobian matrix:
    J = @(x) [2*x(1)         		2*x(2)-2*handles.yo    	-2*x(3)-2*a
              2*x(1)            	2*x(2)      			-2*x(3)-2*b
              2*x(1)-2*handles.xo   2*x(2)      			-2*x(3)-2*c];

    % Initial guess:
    x = [a; b; c;];
    for n=1:handles.maxiter
       delta = -J(x) \ f(x);
       x = x + delta;
       if norm(delta,inf) < handles.tol
         break
       end
    end

    % - Calculate radius
    r1=sqrt((handles.xo-x(1))^2+x(2)^2);
    r2=sqrt(x(1)^2+x(2)^2);
    r3=sqrt(x(1)^2+(handles.yo-x(2))^2);
    
    % - Plot circles
    cla(local.axes1);hold(local.axes1,'on');
    plot(local.axes1,0+0.2*xp,handles.yo+0.2*yp,'b');
    plot(local.axes1,0+0.2*xp,0+0.2*yp,'y');
    plot(local.axes1,handles.xo+0.2*xp,0+0.2*yp,'r');
    plot(local.axes1,0+r2*xp,0+r2*yp,'y');
    plot(local.axes1,handles.yo+r1*xp,0+r1*yp,'r');
    plot(local.axes1,0+r3*xp,handles.xo+r3*yp,'b');
    plot(local.axes1,(x(1))+5*xp,(x(2))+5*yp,'k');
    plot(local.axes1,(x(1))+3.5*xp,(x(2))+3.5*yp,'k');
    plot(local.axes1,(x(1))+2*xp,(x(2))+2*yp,'k');
    line(local.axes1,[0 x(1)],[0 x(2)],'Color','black','LineStyle','--');
    hold(local.axes1,'off');
    grid(local.axes1,'on');
    xlimit=floor(abs(x(1))/50+1);ylimit=floor(abs(x(2))/50+1);
    xlimit=max([xlimit ylimit]);
    xlim(local.axes1,[-xlimit*50 xlimit*50]);
    ylim(local.axes1,[-xlimit*50 xlimit*50]);
    legend(local.axes1,'Channel 1','Channel 2','Channel 3'); 
    xlabel(local.axes1,['X: ' num2str(x(1)) 'm Y: ' num2str(x(2)) 'm']);
    
    % - Check time
    timer=toc();
    if timer-oldtimer>handles.time+handles.time*0.15
        set(local.status,'Text',['Warning!!! Loop time: ' num2str(timer-oldtimer) ' sec. Data loss may occur.']);
    else
        set(local.status,'Text','');
    end
    oldtimer=timer;
end
