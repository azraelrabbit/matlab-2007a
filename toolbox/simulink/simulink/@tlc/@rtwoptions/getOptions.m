function varargout = getOptions(varargin)
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
    This = varargin{1.0};
    % 14 15
    TargetFileOptions = rtwprivate('getSTFInfo', [], 'SystemTargetFile', This.tlcFile);
    % 16 18
    % 17 18
    varargout = cellhorzcat(TargetFileOptions);
end % function
