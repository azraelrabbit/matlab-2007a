function id = getNewInstanceId
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    persistent instanceCtr;
    % 7 9
    if isempty(instanceCtr)
        instanceCtr = 0.0;
    else
        instanceCtr = plus(instanceCtr, 1.0);
    end
    % 13 16
    % 14 16
    id = horzcat('#', num2str(instanceCtr));
end
