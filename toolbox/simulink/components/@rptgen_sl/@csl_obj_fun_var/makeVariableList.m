function vList = makeVariableList(c, wList)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    if isempty(wList)
        vList = cell(0.0, 5.0);
        return
    end
    % 17 19
    valueList = {};
    valueIndex = [];
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    oldState = rptgen.changeDebugState(logical(0));
    for i=1.0:size(wList, 1.0)
        try
            valueList{plus(end, 1.0), 1.0} = slResolve(wList{i, 1.0}, wList{i, 4.0}{1.0});
            valueIndex(plus(end, 1.0), 1.0) = i;
        catch
            if not(isempty(evalin('base', sprintf('whos(''%s'');', wList{i, 1.0}))))
                try
                    valueList{plus(end, 1.0), 1.0} = evalin('base', wList{i, 1.0});
                    valueIndex(plus(end, 1.0), 1.0) = i;
                end % try
            end
        end % try
    end % for
    rptgen.changeDebugState(oldState);
    % 39 41
    if isempty(valueIndex)
        % 41 43
        vList = cell(0.0, 5.0);
    else
        vList = horzcat(wList(valueIndex, :), valueList);
    end
end
