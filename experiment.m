function DATA = experiment(DATA,sub,events,percentages,session)  

for trial = 1:DATA.n_trials %first trial until all events are done
    t0                                = time;
    DATA.start_and_end_trial(trial,1) = t0;
    xi                                = DATA.random_order(trial); %name the event of each trial xi 
    DATA.exp_data(trial,1)            = (trial); % save place in list
    DATA.exp_data(trial,2)            = (xi); % save trial number at its place in the list = order
    event_name                        = events{xi}; %load the name of the xith event of the list
    
    %%%% Now percentages 
        percentage_name               = percentages(xi); %load the percentage of the xith event of the list
        DATA.exp_data(trial,3)        = percentage_name;
 
    %%% BUFFER PREPARATIONS
    % Prepare buffer 1 and write eventname in it
    clearpict( 1 );
    preparestring( event_name, 1,0,0);
    % buffer 2 is fixation cross
    % buffer 3 not used
    % Prepare buffer 4 and 5 for the display the percentage of the respective event
    clearpict( 4 );
    clearpict( 5 );
        
    percentage_string = int2str(percentage_name);  
    preparestring( percentage_string , 4,-20,0);
    preparestring( '%', 4,+20,0); 
    preparestring( event_name, 4,0, +60);
    preparestring( '%', 5,+20,0);
    preparestring( event_name, 5,0, +60);
    preparestring( 'Actual statistics of happening:', 4, 0, +150);
    preparestring( 'Estimation of happening?', 5, 0, +150);
 
    %%%% Now actually start to display
    % Display event with mode from buffer 1 and wait 
    
    DATA.timeofevent(trial) = drawpict( 1 );
    wait(DATA.eventdisplay); 
    
    DATA.timeofresponse_onset(trial) = drawpict(5);% put up background for typewriting and record the time at which this happens
    % External function for typewriting!!!
    myownwriting;
    % Calculate typped number
        numberin = e1*10+e2;
      
    % SAVE TYPED IN 
    DATA.exp_data(trial,4) = numberin;
    
    % Take time after typewriter
    after = time;
    % Calculate after-before 
    calculatedtime = (after - before);
    % CAREFUL Save RT different for session 1 and 2 ???
    DATA.exp_data(trial,5) = calculatedtime;
   
    if session == 1
        % Display first jittered fixation point 
    
        DATA.fixation1(trial) = drawpict(2);
        wait(DATA.firstfix);
    
        % Display percentage
        DATA.percentage_displaystart(trial) = drawpict( 4 );
        wait(DATA.percentagedisplay);
    
        % Display jittered fixation point from buffer 2 
    else % nothing
    end % if session == 1
    
    DATA.fixation2(trial) = drawpict( 2 );
    wait(DATA.secfix);
    
    t1 = time;
    total_time = t1-t0;
    % CAREFUL difference between first and second session
    DATA.exp_data(trial,6) = total_time;
    % Calculate total time and save it
    DATA.start_and_end_trial(trial,2) = t1;
       
end % of trial

end
