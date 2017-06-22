function disablePropOnCondition(this, prop, newvalue, disableset)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    disableset{plus(length(disableset), 1.0)} = RTWConfiguration.deactivatedString;
    % 9 11
    for i=1.0:length(disableset)
        switch class(disableset{i})
        case 'function_handle'
            if eq(feval(disableset{i}, newvalue), 1.0)
                i_deactivate(this, prop);
                % 15 17
                return;
            end % if
        case 'char'
            if eq(strcmp(disableset{i}, newvalue), 1.0)
                i_deactivate(this, prop);
                % 21 23
                return;
            end % if
        end % switch
    end % for
    return;
function i_deactivate(this, prop)
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    try
        eval(horzcat('this.', prop, ' = ''', RTWConfiguration.deactivatedString, ''';'));
        % 36 39
        % 37 39
    end % try
