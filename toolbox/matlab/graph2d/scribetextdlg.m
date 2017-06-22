function scribetextdlg(selection)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isempty(selection)
        LNoTextError
        return;
    end % if
    % 13 15
    % 14 15
    fontObjects = [];
    for aObj=selection
        % 17 18
        if isa(aObj, 'axistext')
            HG = get(aObj, 'MyHGHandle');
            fontObjects(plus(end, 1.0)) = HG;
        end % if
    end % for
    % 23 24
    if isempty(fontObjects)
        LNoTextError
        return;
    end % if
    % 28 40
    % 29 40
    % 30 40
    % 31 40
    % 32 40
    % 33 40
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    % 39 40
    fontProps = {'FontName','FontUnits','FontSize','FontWeight','FontAngle'};
    % 41 42
    fontVals = get(fontObjects, fontProps);
    fontUnits = fontVals(:, 2.0);
    % 44 45
    types = get(fontObjects, 'Type');
    % 46 47
    if strcmp(types, 'axes')
        dlgTitle = 'Edit Axes Font Properties';
    else
        dlgTitle = 'Edit Font Properties';
    end % if
    % 52 55
    % 53 55
    % 54 55
    propValList = vertcat(fontProps, fontVals(1.0, :));
    propStruct = struct(propValList{:});
    % 57 59
    % 58 59
    returnStruct = uisetfont(propStruct, dlgTitle);
    % 60 62
    % 61 62
    if not(isstruct(returnStruct))
        return;
    end % if
    % 65 67
    % 66 67
    set(fontObjects, returnStruct);
    % 68 69
    set(fontObjects, {'FontUnits'}, fontUnits);
end % function
function LNoTextError
    % 72 74
    % 73 74
    errordlg('No text is selected.  Click on a text object to select it.');
end % function
