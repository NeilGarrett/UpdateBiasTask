% Take time before typewriter
    before = time;
% Now typewriter itself
    %clearkeys;
    validkeys = [ 27:34 55 59 71 75:84 90 103 ]; % 27:36 0-9  55,103 Del 59,90 Enter 71 space 75:84 0-9
        [ k, t, n ] = waitkeydown( DATA.ITI, validkeys ); % get a keypress, or possibly keypresses
        if  k == 27
            preparestring( '0', 5, -30, 0);
            drawpict(5);
            e1 = 0;
        elseif  k == 28
            preparestring( '1', 5, -30, 0);
            drawpict(5);     
            e1 = 1;
        elseif  k == 29
            preparestring( '2', 5, -30, 0);
            drawpict(5);     
            e1 = 2;
        elseif  k == 30
            preparestring( '3', 5, -30, 0);
            drawpict(5);     
            e1 = 3;
        elseif  k == 31
            preparestring( '4', 5, -30, 0);
            drawpict(5);     
            e1 = 4;
        elseif  k == 32
            preparestring( '5', 5, -30, 0);
            drawpict(5);     
            e1 = 5;
        elseif  k == 33
            preparestring( '6', 5, -30, 0);
            drawpict(5);     
            e1 = 6;
        elseif  k == 34
            preparestring( '7', 5, -30, 0);
            drawpict(5);     
            e1 = 7;
        elseif  k == 35
            preparestring( '8', 5, -30, 0);
            drawpict(5);     
            e1 = 8;
        elseif  k == 36
            preparestring( '9', 5, -30, 0);
            drawpict(5);     
            e1 = 9;
        else 
            e1 = 999999;
            waituntil(before + DATA.ITI);
        end
        inbetween = time;
        useduptime = inbetween-before;
        resttime = DATA.ITI-useduptime;
        if e1 == 7 
            validkeys = [27:34]
        elseif e1 == 0
            validkeys = [30:36]
        else
            validkeys = [27:36]
        end
        [ k, t, n ] = waitkeydown( resttime, validkeys ); % get a keypress, or possibly keypresses
        if  k == 27
            preparestring( '0', 5, -10, 0);
            drawpict(5);
            e2 = 0;
            wait(DATA.lag_time);
        elseif  k == 28
            preparestring( '1', 5, -10, 0);
            drawpict(5);  
            wait(DATA.lag_time);
            e2 = 1;
        elseif  k == 29
            preparestring( '2', 5, -10, 0);
            drawpict(5);
            e2 = 2;
            wait(DATA.lag_time);
        elseif  k == 30
            preparestring( '3', 5, -10, 0);
            drawpict(5);
            e2 = 3;
            wait(DATA.lag_time);
        elseif  k == 31
            preparestring( '4', 5, -10, 0);
            drawpict(5);
            e2 = 4;
            wait(DATA.lag_time);
        elseif  k == 32
            preparestring( '5', 5, -10, 0);
            drawpict(5);
            e2 = 5;
            wait(DATA.lag_time);
        elseif  k == 33
            preparestring( '6', 5, -10, 0);
            drawpict(5);
            e2 = 6;
            wait(DATA.lag_time);
        elseif  k == 34
            preparestring( '7', 5, -10, 0);
            drawpict(5);
            e2 = 7;
            wait(DATA.lag_time);
        elseif  k == 35
            preparestring( '8', 5, -10, 0);
            drawpict(5);
            e2 = 8;
            wait(DATA.lag_time);
        elseif  k == 36
            preparestring( '9', 5, -10, 0);
            drawpict(5);
            e2 = 9;
            wait(DATA.lag_time);
        else 
            e2 = 999999;
            waituntil(before + DATA.ITI);
        end