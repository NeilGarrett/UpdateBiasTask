function chooseexplanations(expla)
% Chooses the right explanations

if expla == 1
    preparestring('This is a short training session.',1,0,200);
    preparestring('A description of a possible life event will be presented on screen.',1,0,150);
    preparestring('Imagine this event happening to you.',1,0,100);
    
elseif expla ==2
    preparestring('When the words “Estimation of happening?” appear,',1,0,200);
    preparestring('estimate how likely this event is to occur to you.',1,0,150);
    preparestring('Type in the likelihood from 03%-77% ',1,0,100);
    preparestring('(e.g. type 05 for 5% and 74 for 74%).',1,0,50);
    preparestring('Try to give your estimation as fast as possible.',1,0,0);
    preparestring('You cannot change your answer.', 1,0,-50);
    preparestring('After 8 seconds the program will continue automatically.', 1,0,-100);
    
    
elseif expla ==3
    preparestring('After your response, the statistics of the ACTUAL average likelihood',1,0,200);
    preparestring('of this event happening to someone like you will appear on the screen.',1,0,150);
    preparestring('When you are ready to start the training please tell the experimenter.',1,0,0);
   
    
elseif expla ==4
    preparestring('END OF TRAINING',1,0,200);
    preparestring('You will now undertake the experiment for real.',1,0,150);
    preparestring('When you are ready to proceed please tell the experimenter.',1,0,100);
    
    
 elseif expla == 5 
    %preparestring('End of part one of the experiment.',1,0,200);
    preparestring('You will now do the same task again.',1,0,150);        
    preparestring('Some of the events you will have seen before,',1,0,100);
    preparestring('but just put in how likely you think each event is to happen to you now,',1,0,50);
    preparestring('regardless of what you put before.',1,0,0);
    preparestring('Also note that this time,',1,0,-50);    
    preparestring('you will not be presented with the actual average likelihood',1,0,-100);    
    preparestring('of each event occurring.',1,0,-150);
    preparestring('When you are ready to proceed please tell the experimenter.',1,0,-200);


elseif expla ==6    
    preparestring('Welcome to this experiment!',1,0,200)
    preparestring('Please press the space bar when you are ready.',1,0,150);
    
elseif expla == 7        
    preparestring('You have finished the experiment!',1,0,180)
    
elseif expla == 8        
    preparestring('End of this questionaire.',1,0,200)
    preparestring('When you are ready to continue to the second questionaire,',1,0,150);
    preparestring('please tell the experimenter.'.',1,0,100);

elseif expla == 9        
    preparestring('You will now be asked a series of questions',1,0,150)
    preparestring('about the events you have just seen.',1,0,100)
    preparestring('When you are ready to proceed please tell the experimenter.',1,0,50);

elseif expla == 10        
    preparestring('End of this section.',1,0,200)
    preparestring('Please tell the experimenter that you have finshed this part.',1,0,150);
    
elseif expla == 11
    preparestring('End of this experiment.',1,0,200)
    preparestring('Please tell the experimenter that you have finshed.',1,0,150);

end
   