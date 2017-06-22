function disp(hObj)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if gt(length(hObj), 1.0)
        for indx=1.0:length(hObj)
            disp(class(hObj(indx)));
        end % for
        fprintf(1.0, '\n');
    else
        disp(get(hObj))
    end % if
end % function
