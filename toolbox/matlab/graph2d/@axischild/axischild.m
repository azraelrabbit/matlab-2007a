function aObj = axischild(HG)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if eq(nargin, 0.0)
        aObj.Class = 'axischild';
        aObj.DragConstraint = [];
        aObj.AutoDragConstraint = [];
        aObj.OldDragConstraint = [];
        aObj.Prefix = [];
        aObj.Suffix = [];
        aObj = class(aObj, 'axischild', scribehgobj);
        return;
    end % if
    % 18 19
    hgObj = scribehgobj(HG);
    % 20 22
    % 21 22
    setappdata(HG, 'ScribeButtonDownFcn', 'doclick');
    % 23 25
    % 24 25
    aObj.Class = 'axischild';
    aObj.DragConstraint = 'nodrag';
    aObj.AutoDragConstraint = 0.0;
    aObj.OldDragConstraint = '';
    aObj.Prefix = {'set','EraseMode','xor'};
    aObj.Suffix = '';
    % 31 32
    fig = ancestor(HG, 'Figure');
    LAddContextMenu(HG, fig);
    % 34 35
    aObj = class(aObj, 'axischild', hgObj);
    % 36 37
    myH = scribehandle(aObj);
end % function
function u = LAddContextMenu(HG, fig)
    % 40 42
    % 41 42
    u = findall(fig, 'Tag', 'ScribeAxischildObjContextMenu');
    % 43 44
    if ishandle(u)
        setscribecontextmenu(HG, u);
    else
        % 47 48
        u = uicontextmenu('Parent', fig, 'Serializable', 'off', 'HandleVisibility', 'off', 'Tag', 'ScribeAxischildObjContextMenu');
        % 49 55
        % 50 55
        % 51 55
        % 52 55
        % 53 55
        % 54 55
        ucut = uimenu('Label', 'Cu&t', 'Callback', 'domymenu cut', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxischildObjCutMenu');
        % 56 61
        % 57 61
        % 58 61
        % 59 61
        % 60 61
        ucopy = uimenu('Label', '&Copy', 'Callback', 'domymenu copy', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxischildObjCopyMenu');
        % 62 67
        % 63 67
        % 64 67
        % 65 67
        % 66 67
        upaste = uimenu('Label', '&Paste', 'Callback', 'domymenu paste', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxischildObjPasteMenu');
        % 68 73
        % 69 73
        % 70 73
        % 71 73
        % 72 73
        uclear = uimenu('Label', 'Clea&r', 'Callback', 'domymenu clear', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxischildObjClearMenu');
        % 74 81
        % 75 81
        % 76 81
        % 77 81
        % 78 81
        % 79 81
        % 80 81
        u4 = uimenu('Label', 'Properties...', 'Callback', 'domymenu more', 'Separator', 'on', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxischildObjMoreMenu');
        % 82 88
        % 83 88
        % 84 88
        % 85 88
        % 86 88
        % 87 88
    end % if
    % 89 90
    setscribecontextmenu(HG, u);
end % function
