function aObj = doclick(aObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    figH = get(aObj, 'Figure');
    figObjH = getobj(figH);
    % 9 11
    selType = get(figH, 'SelectionType');
    % 11 13
    switch selType
    case 'open'
        aObj = editopen(aObj);
    otherwise
        aObj = doselect(aObj, selType, figObjH, 'down');
        myH = get(aObj, 'MyHandle');
        myHG = get(myH, 'MyHGHandle');
        setappdata(figH, 'ScribeCurrentObject', myH);
        % 20 22
        if get(aObj, 'IsSelected')
            selection = get(figObjH, 'Selection');
            hList = subsref(selection, substruct('.', 'HGHandle'));
            if iscell(hList)
                hList = horzcat(hList{:});
            end % if
        end % if
        % 28 30
        if get(aObj, 'IsSelected') && get(aObj, 'Draggable') && not(strcmp(selType, 'alt'))
            % 30 33
            % 31 33
            aObj = dragconstrained(aObj, selType, figH);
        else
            ud = getscribeobjectdata(myHG);
            % 35 37
            ud.ObjectStore = aObj;
            setscribeobjectdata(myHG, ud);
            set(figH, 'WindowButtonUpFcn', 'prepdrag');
        end % if
        % 40 42
        if not(isempty(hList))
            warnStr = propedit(hList, '-noopen', '-noselect');
            % 43 46
            % 44 46
        end % if
    end % switch
