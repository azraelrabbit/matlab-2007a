function src = DialogSource(block, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    block = get_param(block, 'Handle');
    src = MECH.DialogSource(block);
    cls = get_param(block, 'DialogTemplateClass');
    % 15 16
    src.BlockHandle = block;
    src.PropertyList = MECH.DialogPropertyList(cls);
    % 18 19
    updatefunction = regexprep(cls, '^.*\.', 'update');
    if any(strcmp(methods(src), updatefunction))
        src.UpdateCallback = str2func(updatefunction);
    else
        src.UpdateCallback = @updateDefault;
    end % if
end % function
function [enabled, disabled] = updateDefault(src, tag, value)
    enabled = {};
    disabled = {};
end % function
