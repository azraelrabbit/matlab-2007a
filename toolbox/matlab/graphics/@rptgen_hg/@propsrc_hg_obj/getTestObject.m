function objHandle = getTestObject(h, objType)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if lt(nargin, 2.0)
        objType = 'surface';
    else
        objType = lower(objType);
    end % if
    % 14 16
    axH = getTestObject(rptgen_hg.propsrc_hg_ax);
    figH = get(axH, 'parent');
    % 17 19
    objTag = horzcat('RPTGEN_TEST_', upper(objType));
    objHandle = findall(figH, 'type', objType, 'tag', objTag);
    % 20 22
    if isempty(objHandle)
        switch objType
        case 'uicontrol'
            objHandle = uicontrol('parent', figH, 'String', 'OK', 'tag', objTag);
        case {'uicontextmenu','uimenu'}
            hCtxt = uicontextmenu('parent', figH, 'tag', objTag);
            set(horzcat(figH, axH), 'uicontextmenu', hCtxt);
            % 28 30
            hMenu = uimenu('parent', hCtxt, 'Label', '&Menu item 1', 'tag', objTag);
            % 30 33
            % 31 33
            uimenu('parent', hCtxt, 'label', 'M&enu item 2');
            uimenu('parent', hMenu, 'label', 'Me&nu item 1.1');
            uimenu('parent', hMenu, 'label', 'Men&u item 1.2');
            % 35 37
            if strcmp(objType, 'uimenu')
                objHandle = hMenu;
            else
                objHandle = hCtxt;
            end % if
        otherwise
            objHandle = feval(objType, 'parent', axH, 'tag', objTag);
        end % switch
    else
        objHandle = objHandle(1.0);
    end % if
