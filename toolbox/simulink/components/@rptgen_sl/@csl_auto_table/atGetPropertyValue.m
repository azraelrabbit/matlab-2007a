function [propValue, propName] = atGetPropertyValue(this, propSrc, obj, objType, propName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if strcmpi(objType, 'block')
        % 9 11
        % 10 11
        propValue = rptgen.safeGet(obj, propName, 'get_param');
        % 12 14
        % 13 14
        if this.ShowNamePrompt
            propName = getPromptName(obj, propName);
        end % if
    else
        [propValue, propName] = getPropValue(propSrc, obj, propName);
    end % if
end % function
function propName = getPromptName(obj, propName)
    % 22 25
    % 23 25
    % 24 25
    maskNames = get_param(obj, 'MaskNames');
    maskNamesIdx = find(strcmp(maskNames, propName));
    if isempty(maskNamesIdx)
        dParam = get_param(obj, 'dialogparameters');
        if isfield(dParam, propName)
            propName = getfield(getfield(dParam, propName), 'Prompt');
            propName = strrep(propName, ':', '');
        else
            propName = rptgen.prettifyName(propName);
        end % if
    else
        maskPrompts = get_param(obj, 'MaskPrompts');
        propName = maskPrompts{maskNamesIdx(1.0)};
        propName = strrep(propName, ':', '');
    end % if
end % function
