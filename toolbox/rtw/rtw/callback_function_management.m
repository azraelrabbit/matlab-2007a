function callback_function_management(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if eq(nargin, 0.0)
        dialogFig = get(gcbo, 'Parent');
    else
        dialogFig = varargin{1.0};
    end % if
    % 11 13
    functionSplit = 'Function split threshold';
    fileSplit = 'File split threshold';
    dialogUserData = get(dialogFig, 'UserData');
    hModel = dialogUserData.model;
    % 16 18
    loDefault = get_param(hModel, 'OptimizeBlockIOStorage');
    % 18 20
    val_to_string{1.0} = 'off';
    val_to_string{2.0} = 'on';
    % 21 25
    % 22 25
    % 23 25
    o = findobj(dialogFig, 'Tag', 'Function management_PopupFieldTag');
    val = get(o, 'Value');
    switch val
    case 1.0
        obj = findobj(dialogFig, 'Tag', horzcat(functionSplit, '_EditLabelTag'));
        set(obj, 'Enable', 'off');
        obj = findobj(dialogFig, 'Tag', horzcat(functionSplit, '_EditFieldTag'));
        set(obj, 'Enable', 'off');
        % 32 34
        obj = findobj(dialogFig, 'Tag', horzcat(fileSplit, '_EditLabelTag'));
        set(obj, 'Enable', 'off');
        obj = findobj(dialogFig, 'Tag', horzcat(fileSplit, '_EditFieldTag'));
        set(obj, 'Enable', 'off');
        % 37 39
        obj = findobj(dialogFig, 'Tag', 'Show eliminated statements_CheckboxTag');
        set(obj, 'Enable', 'on');
        % 40 42
        obj = findobj(dialogFig, 'Tag', 'Local block outputs_CheckboxTag');
        set(obj, 'Enable', loDefault);
        % 44 46
    case 2.0
        % 45 47
        obj = findobj(dialogFig, 'Tag', horzcat(functionSplit, '_EditLabelTag'));
        set(obj, 'Enable', 'on');
        obj = findobj(dialogFig, 'Tag', horzcat(functionSplit, '_EditFieldTag'));
        set(obj, 'Enable', 'on');
        % 50 52
        obj = findobj(dialogFig, 'Tag', horzcat(fileSplit, '_EditLabelTag'));
        set(obj, 'Enable', 'off');
        obj = findobj(dialogFig, 'Tag', horzcat(fileSplit, '_EditFieldTag'));
        set(obj, 'Enable', 'off');
        % 55 57
        obj = findobj(dialogFig, 'Tag', 'Show eliminated statements_CheckboxTag');
        set(obj, 'Enable', 'on');
        % 58 60
        obj = findobj(dialogFig, 'Tag', 'Local block outputs_CheckboxTag');
        set(obj, 'Enable', 'off');
    case 3.0
        % 62 64
        obj = findobj(dialogFig, 'Tag', horzcat(functionSplit, '_EditLabelTag'));
        set(obj, 'Enable', 'off');
        obj = findobj(dialogFig, 'Tag', horzcat(functionSplit, '_EditFieldTag'));
        set(obj, 'Enable', 'off');
        % 67 69
        obj = findobj(dialogFig, 'Tag', horzcat(fileSplit, '_EditLabelTag'));
        set(obj, 'Enable', 'on');
        obj = findobj(dialogFig, 'Tag', horzcat(fileSplit, '_EditFieldTag'));
        set(obj, 'Enable', 'on');
        % 72 75
        % 73 75
        obj = findobj(dialogFig, 'Tag', 'Show eliminated statements_CheckboxTag');
        set(obj, 'Enable', 'off');
        % 76 78
        obj = findobj(dialogFig, 'Tag', 'Local block outputs_CheckboxTag');
        set(obj, 'Enable', loDefault);
    case 4.0
        % 80 82
        obj = findobj(dialogFig, 'Tag', horzcat(functionSplit, '_EditLabelTag'));
        set(obj, 'Enable', 'on');
        obj = findobj(dialogFig, 'Tag', horzcat(functionSplit, '_EditFieldTag'));
        set(obj, 'Enable', 'on');
        % 85 87
        obj = findobj(dialogFig, 'Tag', horzcat(fileSplit, '_EditLabelTag'));
        set(obj, 'Enable', 'on');
        obj = findobj(dialogFig, 'Tag', horzcat(fileSplit, '_EditFieldTag'));
        set(obj, 'Enable', 'on');
        % 90 93
        % 91 93
        obj = findobj(dialogFig, 'Tag', 'Show eliminated statements_CheckboxTag');
        set(obj, 'Enable', 'off');
        % 94 96
        obj = findobj(dialogFig, 'Tag', 'Local block outputs_CheckboxTag');
        set(obj, 'Enable', 'off');
        % 97 99
    end % switch
