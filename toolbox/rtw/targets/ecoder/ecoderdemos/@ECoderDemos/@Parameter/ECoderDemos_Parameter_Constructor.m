function h = ECoderDemos_Parameter_Constructor(h, varargin)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    nargin = length(varargin);
    % 18 21
    % 19 21
    hSuperPackage = findpackage('Simulink');
    hSuperClass = findclass(hSuperPackage, 'Parameter');
    if not(isempty(hSuperClass.methods)) && not(isempty(find(hSuperClass.methods, 'Name', 'Simulink_Parameter_Constructor')))
        % 23 25
        h.Simulink_Parameter_Constructor;
    end % if
    % 26 29
    % 27 29
    h.replaceRTWInfo(ECoderDemos.CustomRTWInfo_Parameter);
    % 29 33
    % 30 33
    % 31 33
    h.RTWInfo.StorageClass = 'Custom';
    % 33 36
    % 34 36
    switch nargin
    case 0.0
    case 1.0
        h.Value = varargin{1.0};
    otherwise
        warning('Invalid number of input arguments');
    end % switch
end % function
