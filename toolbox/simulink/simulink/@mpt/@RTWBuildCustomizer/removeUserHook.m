function removeUserHook(hThisObj, hook)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    warnID = 'Simulink:mpt:RTWBuildCustomizer:removeUserHook';
    % 7 9
    if ~(eq(exist('make_rtw.m', 'file'), 2.0) || eq(exist('make_rtw.p', 'file'), 6.0))
        persistent diswarn;
        if isempty(diswarn)
            warning(warnID, 'removeUserHook requires Real-Time Workshop installed.');
            diswarn = 1.0;
        end
        return
    end
    % 16 18
    if ~(ischar(hook))
        warning(warnID, 'Invalid input argument for removeUserHook.');
        return
    end
    % 21 23
    hook = strtrim(hook);
    if ~(isvarname(hook))
        warning(warnID, 'Invalid input argument for removeUserHook.');
        return
    end
    % 27 30
    % 28 30
    UDDprop = get_rtw_hook_prop(hook);
    % 30 32
    if isprop(hThisObj, UDDprop)
        hThisObj.(UDDprop) = '';
    else
        warning(warnID, sprintf('Invalid hook ''%s'' for removeUserHook.', hook));
    end
end
function UDDprop = get_rtw_hook_prop(hook)
    % 38 42
    % 39 42
    % 40 42
    switch hook
    case 'entry'
        UDDprop = 'CodeGenEntry';
    case 'before_tlc'
        UDDprop = 'CodeGenBeforeTLC';
    case 'after_tlc'
        UDDprop = 'CodeGenAfterTLC';
    case 'before_make'
        UDDprop = 'CodeGenBeforeMake';
    case 'after_make'
        UDDprop = 'CodeGenAfterMake';
    case 'exit'
        UDDprop = 'CodeGenExit';
    otherwise
        UDDprop = '';
    end
end
