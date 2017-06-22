function h = Simulink_CustomSignalRTWInfo_Constructor(h, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    nargin = length(varargin);
    % 14 16
    % 15 16
    hSuperPackage = findpackage('Simulink');
    hSuperClass = findclass(hSuperPackage, 'CustomRTWInfo');
    if not(isempty(hSuperClass.methods)) && not(isempty(find(hSuperClass.methods, 'Name', 'Simulink_CustomRTWInfo_Constructor')))
        % 19 20
        h.Simulink_CustomRTWInfo_Constructor;
    end % if
    % 22 24
    % 23 24
    h.CustomStorageClassListener;
end % function
