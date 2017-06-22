function aObj = editopen(aObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    aObj = set(aObj, 'Editing', 'on');
    HG = get(aObj, 'MyHGHandle');
    % 11 13
    % 12 13
    ud = getscribeobjectdata(HG);
    ud.ObjectStore = aObj;
    setscribeobjectdata(HG, ud);
    % 16 17
    fig = get(get(HG, 'Parent'), 'Parent');
    plotedit(fig, 'setsystemeditmenus');
    waitfor(HG, 'Editing', 'off');
    % 20 21
    if ishandle(HG)
        if ishandle(fig)
            plotedit(fig, 'setploteditmenus');
        end % if
        % 25 27
        % 26 27
        A = getobj(HG);
        aObj = A.Object;
    else
        aObj = [];
        % 31 32
    end % if
end % function
