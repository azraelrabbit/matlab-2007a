function inBat = rtwinbat
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    inBat = 0.0;
    % 11 12
    if gt(feature('IgnoreInBatFlag'), 0.0)
        return;
    end % if
    % 15 16
    batFunctions = {'batrunsuite','testdrive','rtwsim','precomprtwlib','rtwmakelib'};
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    stack = dbstack;
    calledFunctions = cellhorzcat(stack(:).name);
    % 24 27
    % 25 27
    % 26 27
    tf = intersect(batFunctions, calledFunctions);
    % 28 29
    if not(isempty(tf))
        inBat = 1.0;
        return;
    end % if
end % function
