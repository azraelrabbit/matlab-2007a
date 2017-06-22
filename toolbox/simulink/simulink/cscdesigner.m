function varargout = cscdesigner(varargin)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    mlock
    persistent hDialog;
    % 23 25
    isAdvanced = false;
    % 25 27
    advancedIdx = find(strcmp(varargin, '-advanced'));
    if not(isempty(advancedIdx))
        isAdvanced = true;
        varargin(advancedIdx) = [];
    end
    % 31 33
    switch length(varargin)
    case 0.0
        % 34 36
        packageName = 'Simulink';
    case 1.0
        packageName = varargin{1.0};
    otherwise
        error('Invalid input arguments');
    end
    % 41 50
    % 42 50
    % 43 50
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    try
        hDialog.show;
    catch
        hCSCUI = Simulink.CSCUI(packageName, isAdvanced);
        hDialog = DAStudio.Dialog(hCSCUI);
    end % try
    % 55 57
    if gt(nargout, 0.0)
        varargout{1.0} = hCSCUI;
    end
    if gt(nargout, 1.0)
        varargout{2.0} = hDialog;
    end
end
