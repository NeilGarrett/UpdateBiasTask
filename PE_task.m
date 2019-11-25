    %   Tali Sharot's PE paradigm
    %   Neil Garrett edit for mclean study 13/08/2013
    %   Original script by Chris Korn

close all;
clear all;
clc;

% switch these to 1 if you want to run
% switch to 0 if you want to stop

part_three = 1 %training
part_four = 1 %experiment
part_five = 1 %POST_ANA

rand('seed',sum(100*clock));
fs  = filesep;

%dir_base ='\Users\Ashlee\Desktop\rMDD\Matlab_scripts_Mcclean';
%dir_base ='\Documents and Settings\DAPLAB\Desktop\rMDD\Matlab_scripts_Mcclean';
dir_base ='\Users\Ashlee\Desktop\rMDD\Matlab_scripts_Mcclean';


cd(dir_base);

sub   = input('please enter the SUBJECT number: ');
list = 1;
sure = input('Sure? Continue 0, Abort 1: ' );

if sure == 1
    disp('Check variables again! aborting...')
    clear all; return; 
elseif sure ==0;
end

list_save = list;

frame  = 1;
%fpath = ['sub' num2str(sub) '_' num2str(DOB)];
fpath = ['sub' num2str(sub)];

list = 'eventsA.dat';

DATA.params.list = list;
fpath = ['sub' num2str(sub)];

%make dir if not there
if exist(fpath,'dir') ~= 7
        mkdir(fpath);
else
end

%config_display(0, 4, [0 0 0], [1 1 1], 'Arial', 25, 5 ); %window
config_display(1, 3, [0 0 0], [1 1 1], 'Arial', 25, 5 ); %full screen

config_keyboard(1,5,'nonexclusive');

%%%%%% Specify trial number, timing, jittering
DATA.params.subNo = sub;
DATA.params.fpath = fpath;
DATA.params.dir_base = dir_base;
DATA.params.fs = fs;

DATA.n_trials                = 40; %change up to 40
DATA.exp_data                = zeros(DATA.n_trials,6);            % initialize data array
DATA.exp_data_columns        = {'order','placeinlist','real','response','reactiontime','totaltime'};  
DATA.subject                 = sub;
DATA.when_start              = datestr(now,30);% when was the script started?
% Timing of trials
DATA.eventdisplay            = 4000; % Time event is shown (ms)
DATA.ITI                     = 8000; % Possible time to react (ms)
DATA.lag_time                = 300; % Lag time so that subject can see last number you typed in (ms)
DATA.firstfix                = 1000;
DATA.secfix                  = 1000;
DATA.percentagedisplay       = 2000; % duration of real percentage display

%%%%%%%%%%%%%%%%%%% START
start_cogent;
 
%welcome to experiment
expla = 6;
cd(dir_base);
clearpict(1) % empty buffer 1
settextstyle( 'Arial', 38);
chooseexplanations(expla) % external function
drawpict(1);
waitkeydown(inf,[71]);

clearpict(1); % empty buffer 1
settextstyle( 'Arial', 38);

% Prepare fixation point in display buffer 2
settextstyle( 'Arial', 38 );
preparestring( '+', 2 );

cd(dir_base);


if part_three %training
expla = 1;
    for instructions=1:3
    clearpict(1); % empty buffer 1
    settextstyle( 'Arial', 38);
    chooseexplanations(expla)
    drawpict(1);
    waitkeydown(inf,[71]);
    expla = expla+1
    end
settextstyle( 'Arial', 38);
[events, percentages] = textread('train_list.dat', '%s%d','delimiter', ',');
DATA.n_trials_training = length(events);
DATA.random_order = randperm(DATA.n_trials_training);
training(DATA,sub,events,percentages);
else
end

cd(dir_base);

if part_four
    expla = 4;
    for session = 1:2
    [events, percentages] = textread(list, '%s%d','delimiter', ',');
    DATA.random_order = randperm(DATA.n_trials);  % Create a randomized vector specifying the order of stimuli
    clearpict(1) % empty buffer 1
    settextstyle( 'Arial', 38);
    chooseexplanations(expla); % external function
    drawpict(1);
    if expla==4
    waitkeydown(inf,[71]); 
    else
    waitkeydown(inf,[27]);
    end
    settextstyle( 'Arial', 38);
    [DATA] = experiment(DATA,sub,events,percentages,session);
    % Save DATA as file in created folder
    cd([dir_base fs fpath]);
    filename = (['sub' num2str(sub) 'ses' num2str(session) '_list' num2str(list_save)]);
    filenameworkspace = (['subWORKSPACE' num2str(sub) 'ses' num2str(session) '_list' num2str(list_save)]);
    save(filename, 'DATA');
    save(filenameworkspace);
    expla = 5;
    cd(dir_base);
    end
end

cd(dir_base);

if part_five
[events, percentages] = textread(list, '%s%d','delimiter', ',');
[DATA] = POST_ANA(DATA,sub,events,percentages,dir_base);
end

cd(dir_base)

expla = 11;
cd(dir_base);
clearpict(1); % empty buffer 1
settextstyle( 'Arial', 38);
chooseexplanations(expla) % external function
drawpict(1);
waitkeydown(inf,[27]);

stop_cogent;

DATA.when_end             = datestr(now,30);% when was the script ended?