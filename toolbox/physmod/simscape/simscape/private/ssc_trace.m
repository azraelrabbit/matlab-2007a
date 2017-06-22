function ssc_trace(prfx, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    offset = 2.0;
    % 8 9
    [stack, where] = dbstack;
    where = plus(where, offset);
    indicator = char(mtimes('|', ones(horzcat(1.0, minus(length(stack), offset)))));
    fprintf(1.0, '  %s+-[%s%s:%i]>', indicator, prfx, stack(where).file, stack(where).line);
    % 13 14
    num = length(varargin);
    for j=1.0:num
        thisParameter = inputname(j);
        if not(isempty(thisParameter))
            fprintf(1.0, '  %s: ', thisParameter);
        end % if
        theValue = varargin{j};
        if any(strcmp(class(theValue), {'double','logical'}))
            theValue = num2str(theValue);
        else
            theValue = char(theValue);
        end % if
        fprintf(1.0, '%s ', theValue);
    end % for
    fprintf(1.0, '\n');
end % function
