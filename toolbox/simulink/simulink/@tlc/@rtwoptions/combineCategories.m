function rtwoptions = combineCategories(varargin)
    % 1 3
    % 2 3
    switch nargin
    case 3.0
        This = varargin{1.0};
        ExistingOptions = varargin{2.0};
        AdditionalOptions = varargin{3.0};
    otherwise
        error(horzcat(mfilename, ': requires two rtwoptions structures for arguments'));
    end % switch
    % 11 12
    rtwoptions = rtwprivate('combinestruct', ExistingOptions, AdditionalOptions, 'tlcvariable');
    % 13 14
    return;
end % function
