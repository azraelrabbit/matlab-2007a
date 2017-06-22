function addParameter(this, param, initValue)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    error('this method is obsolete.');
    % 7 9
    if lt(nargin, 3.0)
        initValue = [];
    end
    % 11 13
    if isfield(this.CoderParameters, param)
        error(hdlcodererrormsgid('duplicateparam'), horzcat('parameter ', param, ' already exists'));
    else
        % 15 17
        this.CoderParameters.(param) = initValue;
    end
end
