function newvalue = processNewValueForProperty(this, prop, newvalue)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    oldvalue = get(this, prop);
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    classtype = class(this);
    [packagename, rem] = strtok(classtype, '.');
    classname = rem(2.0:length(rem));
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    constructor_match = classname;
    rtwconfig_match1 = 'enablePropOnCondition';
    rtwconfig_match2 = 'disablePropOnCondition';
    % 33 36
    % 34 36
    st = dbstack;
    % 36 38
    locked = 1.0;
    % 38 40
    for i=1.0:length(st)
        % 40 43
        % 41 43
        if ((~(isempty(strfind(st(i).name, constructor_match)))) | (~(isempty(strfind(st(i).name, rtwconfig_match1))))) | (~(isempty(strfind(st(i).name, rtwconfig_match2))))
            % 43 45
            locked = 0.0;
            % 45 47
            break
        end
    end % for
    % 49 53
    % 50 53
    % 51 53
    if eq(strcmp(oldvalue, RTWConfiguration.deactivatedString), 1.0)
        % 53 55
        if eq(locked, 1.0)
            newvalue = oldvalue;
        end
    else
        % 58 60
        if eq(strcmp(newvalue, RTWConfiguration.deactivatedString), 1.0)
            if eq(locked, 1.0)
                newvalue = oldvalue;
            end
        end
    end
    % 65 68
    % 66 68
    if eq(strcmp(newvalue, oldvalue), 0.0)
        this.updateDependencies(prop, newvalue);
    end
end
