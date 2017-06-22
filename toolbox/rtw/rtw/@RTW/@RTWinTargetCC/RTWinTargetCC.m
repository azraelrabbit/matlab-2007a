function h = RTWinTargetCC(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if gt(nargin, 0.0)
        h = [];
        DAStudio.error('RTW:configSet:constructorNotFound', 'RTW.RTWinTargetCC');
        % 11 12
    end % if
    % 13 14
    h = RTW.RTWinTargetCC;
    set(h, 'IsERTTarget', 'off');
    set(h, 'IsPILTarget', 'off');
    % 17 18
    registerPropList(h, 'NoDuplicate', 'All', []);
end % function
