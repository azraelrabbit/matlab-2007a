function text = plotElementDataCursorUpdateFCN(aObj, aEvent)
    % 1 35
    % 2 35
    % 3 35
    % 4 35
    % 5 35
    % 6 35
    % 7 35
    % 8 35
    % 9 35
    % 10 35
    % 11 35
    % 12 35
    % 13 35
    % 14 35
    % 15 35
    % 16 35
    % 17 35
    % 18 35
    % 19 35
    % 20 35
    % 21 35
    % 22 35
    % 23 35
    % 24 35
    % 25 35
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    targ = aEvent.Target;
    ud = get(targ, 'UserData');
    % 36 39
    % 37 39
    text = sprintf('%s : %d \n%s : %d\n', ud.xVar, aEvent.Position(1.0), ud.yVar, aEvent.Position(2.0));
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    if isfield(ud, 'IParams')
        for i=1.0:length(fieldnames(ud.IParams))
            fieldName = horzcat('p', num2str(i));
            field = ud.IParams.(fieldName);
            text = sprintf('%s\n%s : %s', text, field.Name, num2str(field.Value));
        end % for
    end
end
