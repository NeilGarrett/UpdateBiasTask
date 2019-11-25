function [DATA] = POST_ANA(DATA,sub,events,percentages,dir_base)

%%                       Post-scan ratings memory                  %%

%%% Instructions
DATA.random_order2 = randperm(DATA.n_trials);

clearpict(3);
settextstyle( 'Arial', 38);
      
    %preparestring('End of part two of the experiment.',3,0,200);
    preparestring('Next you will complete a memory test.',3,0,150);
    preparestring('You will be presented with all events again.',3,0,100);
    preparestring('Please recall the ACTUAL probability of each event to happen',3,0,50);
    preparestring('to an average person in the developed world,',3,0,0);
    preparestring('as presented earlier in the experiment.',3,0,-50);
    preparestring('You have as much time as you need to type in the answer.',3,0,-100);
    preparestring('When you are ready to start the training please tell the experimenter.',3,0,-150);
    drawpict(3);
    waitkeydown(inf,[27]); %wait for space bar to be pressed
        
postscan = zeros(DATA.n_trials,8); %Creating matrix for answers

    for trial2 = 1:DATA.n_trials % loop over all events
         xi2                                = DATA.random_order2(trial2); %name the event of each trial xi     
         event_name2                        = events{xi2};
         postscan(trial2,1)                 = trial2;
         postscan(trial2,2)                 = xi2;
         
        clearpict(3); 
        settextstyle( 'Arial', 38);
             
        preparestring('Please recall the actual probability of this event happening', 3,0, +200);
        preparestring('to an average person in the developed world,', 3,0, +150);
        preparestring('as presented previously.', 3,0, +100);
        
        settextstyle( 'Arial', 38);
        preparestring( event_name2, 3,0,0);
        preparestring( 'Your answer:', 3,-30, -120);
        preparestring( '%', 3, +123, -120);
        drawpict(3);
                
        clearkeys;
        validkeys = [ 27:36 ]; % 27:36 0-9  55,103 Del 59,90 Enter 71 space 75:84 0-9
        
        [ k, t, n ] = waitkeydown( inf, validkeys ); % get a keypress, or possibly keypresses
        if  k == 27
            preparestring( '0', 3, +80, -120);
            drawpict(3);
            e1 = 0;
        elseif  k == 28
            preparestring( '1', 3,  +80, -120);
            drawpict(3);     
            e1 = 1;
        elseif  k == 29
            preparestring( '2', 3,  +80, -120);
            drawpict(3);     
            e1 = 2;
        elseif  k == 30
            preparestring( '3', 3,  +80, -120);
            drawpict(3);     
            e1 = 3;
        elseif  k == 31
            preparestring( '4', 3,  +80, -120);
            drawpict(3);     
            e1 = 4;
        elseif  k == 32
            preparestring( '5', 3,  +80, -120);
            drawpict(3);     
            e1 = 5;
        elseif  k == 33
            preparestring( '6', 3,  +80, -120);
            drawpict(3);     
            e1 = 6;
        elseif  k == 34
            preparestring( '7', 3, +80, -120);
            drawpict(3);     
            e1 = 7;
        elseif  k == 35
            preparestring( '8', 3, +80, -120);
            drawpict(3);     
            e1 = 8;
        elseif  k == 36
            preparestring( '9', 3, +80, -120);
            drawpict(3);     
            e1 = 9;
        end % if key
        
        if e1 == 7 
            validkeys = [27:34]
        elseif e1 == 0
            validkeys = [30:36]
        else
            validkeys = [27:36]
        end
        
        [ k, t, n ] = waitkeydown( inf, validkeys ); % get a keypress, or possibly keypresses
        if  k == 27
            preparestring( '0', 3, +100, -120);
            drawpict(3);
            e2 = 0;
        elseif  k == 28
            preparestring( '1', 3, +100, -120);
            drawpict(3);     
            e2 = 1;
        elseif  k == 29
            preparestring( '2', 3, +100, -120);
            drawpict(3);     
            e2 = 2;
        elseif  k == 30
            preparestring( '3', 3, +100, -120);
            drawpict(3);     
            e2 = 3;
        elseif  k == 31
            preparestring( '4', 3, +100, -120);
            drawpict(3);     
            e2 = 4;
        elseif  k == 32
            preparestring( '5', 3, +100, -120);
            drawpict(3);     
            e2 = 5;
        elseif  k == 33
            preparestring( '6', 3, +100, -120);
            drawpict(3);     
            e2 = 6;
        elseif  k == 34
            preparestring( '7', 3, +100, -120);
            drawpict(3);     
            e2 = 7;
        elseif  k == 35
            preparestring( '8', 3, +100, -120);
            drawpict(3);     
            e2 = 8;
        elseif  k == 36
            preparestring( '9', 3, +100, -120);
            drawpict(3);     
            e2 = 9;
        end % if key
        
        wait(DATA.lag_time); % wait so that subjects can see their answer
        
         % save answers in matrix
        postscan(trial2,3) = e1*10 + e2;
    end %all events
       
    % Save
    filenamepotscanmemory = (['sub_' num2str(sub) '_POST_ANA_memory']);
    cd ([DATA.params.dir_base DATA.params.fs DATA.params.fpath]);
    save(filenamepotscanmemory, 'postscan');
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                       Post-scan ratings scales                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

expla = 9
cd(dir_base);
clearpict(1) % empty buffer 1
settextstyle( 'Arial', 38);
chooseexplanations(expla) % external function
drawpict(1);
waitkeydown(inf,[27])


for scale = 1:3 % loop over all scales
    
    clearpict(3);
    settextstyle( 'Arial', 38);
    
    if scale == 1  %past experience
        preparestring('In the following trials you will be asked:',3,0,200);
        preparestring('Has this event happened to you before?',3,0,150);
    elseif scale ==2
        preparestring('In the following trials you will be asked:',3,0,200);
        preparestring('How negative is this event for you?',3,0,150);      
   elseif scale == 3 
        preparestring('In the following trials you will be asked',3,0,200);
        preparestring('How vividly can you imagine this event?',3,0,150);
    end %choose scale
     
     preparestring('Please evaluate all events one at a time on the scales presented.',3,0,50);
     preparestring('The range of each scale will be from 1 to 6.',3,0,0);
     preparestring('You have as much time as you need to answer the questions.',3,0,-50);
     preparestring('When ready to continue please tell the experimenter.',3,0,-100);
    drawpict(3);

    kk = waitkeydown(inf,[27]); %wait for space bar to be pressed or 0
    
for trial2 = 1:DATA.n_trials % loop over all events
         xi2                                = DATA.random_order2(trial2); %name the event of each trial xi     
         event_name2                        = events{xi2};          
        clearpict(3); 
        settextstyle( 'Arial', 38);
        if scale == 1
            preparestring('Has this event happened to you before?', 3,0, +200);
            preparestring('6 = very often', 3,0, +150);
            preparestring('1 = never', 3,0, +120);
        elseif scale == 2
            preparestring('How negative would this event be/is this event for you?', 3,0, +200);
            preparestring('6 = extremely negative', 3,0, +150);      
            preparestring('1 = not at all negative', 3,0, +120);
         elseif scale == 3
             preparestring('How vividly can you imagine this event?', 3,0, +200);
             preparestring('6 = very vividly', 3,0, +150);
             preparestring('1 = not vivdly at all', 3,0, +120);    
        end % different
                
        settextstyle( 'Arial', 38);
        preparestring( event_name2, 3,0,0);
        preparestring( 'Your answer:', 3,-30, -60);
        drawpict(3);
        
        clearkeys;
        validkeys = [ 28:33 ]; % 27:36 0-9  55,103 Del 59,90 Enter 71 space 75:84 0-9
        [ k, t, n ] = waitkeydown( inf, validkeys ); % get a keypress, or possibly keypresses
        
        if  k == 28
            preparestring( '1', 3, +80, -60);
            e1 = 1;
        elseif  k == 29
            preparestring( '2', 3, +80, -60);  
            e1 = 2;
        elseif  k == 30
            preparestring( '3', 3, +80, -60);   
            e1 = 3;
        elseif  k == 31
            preparestring( '4', 3, +80, -60);    
            e1 = 4;
        elseif  k == 32
            preparestring( '5', 3, +80, -60);
            e1 = 5;
         elseif  k == 33
            preparestring( '6', 3, +80, -60);
            e1 = 6;
        end % if key
        drawpict(3);
        wait(DATA.lag_time); % wait so that subjects can see their answer
        
        postscan(trial2,scale+3) = e1;
end % loop over all events

end % loop over all scales


    % Save Whatever is there
    filenamepotscanall = (['sub' num2str(sub)  '_POST_ANA_all']);
    filenameworkspace = (['sub' num2str(sub)  '_POST_ANA_other']);
    cd([DATA.params.dir_base DATA.params.fs DATA.params.fpath DATA.params.fs]);
    save(filenamepotscanall, 'postscan');
    save(filenameworkspace);

 end