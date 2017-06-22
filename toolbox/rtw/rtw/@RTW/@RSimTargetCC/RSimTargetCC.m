function h = RSimTargetCC(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if gt(nargin, 0.0)
        h = [];
        DAStudio.error('RTW:configSet:constructorNotFound', 'RSim.RSimTargetCC');
    end % if
    % 12 13
    h = RTW.RSimTargetCC;
    set(h, 'IsERTTarget', 'off');
    set(h, 'IsPILTarget', 'off');
    set(h, 'ModelReferenceCompliant', 'on');
    set(h, 'MatFileLogging', 'on');
    % 18 19
    registerPropList(h, 'NoDuplicate', 'All', []);
end % function
