function enablePropOnCondition(this, prop, newvalue, enableset)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    for i=1.0:length(enableset)
        switch class(enableset{i})
        case 'function_handle'
            if eq(feval(enableset{i}, newvalue), 1.0)
                i_activate(this, prop);
                % 11 13
                return;
            end % if
        case 'char'
            if eq(strcmp(enableset{i}, newvalue), 1.0)
                i_activate(this, prop);
                % 17 19
                return;
            end % if
        end % switch
    end % for
    return;
function i_activate(this, prop)
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    foundsep = 0.0;
    for i=length(prop):-1.0:1.0
        if eq(prop(i), '.')
            foundsep = 1.0;
            break
        end % if
    end % for
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    try
        if eq(foundsep, 1.0)
            % 43 45
            part1 = prop(1.0:minus(i, 1.0));
            part2 = prop(plus(i, 1.0):length(prop));
            thisProp = findprop(eval(horzcat('this.', part1)), part2);
        else
            thisProp = findprop(this, prop);
        end % if
        % 50 52
        actValue = thisProp.ActivateValue;
        % 52 54
        eval(horzcat('this.', prop, ' = ''', actValue, ''';'));
        % 54 57
        % 55 57
    end % try
