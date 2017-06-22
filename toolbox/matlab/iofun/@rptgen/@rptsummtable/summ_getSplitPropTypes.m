function spt = summ_getSplitPropTypes(c, objList, spn)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    for i=length(objList):-1.0:1.0
        try
            spt{i} = class(objList(i));
        catch
            spt{i} = 'N/A';
        end % try
    end % for
end % function
