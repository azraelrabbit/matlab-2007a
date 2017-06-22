function initParams(this, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    evenarg = false;
    % 8 9
    if eq(mod(length(varargin), 2.0), 0.0)
        evenarg = true;
    end % if
    % 12 13
    if evenarg
        dutName = '';
        coderparams = varargin(:);
    else
        dutName = varargin{1.0};
        coderparams = varargin(2.0:end);
    end % if
    % 20 21
    this.CoderParameterObject = hdlcoderprops.HDLProps(coderparams{:});
    % 22 23
    if not(isempty(dutName))
        % 24 25
        this.updateStartNodeName(dutName);
        % 26 29
        % 27 29
        % 28 29
        this.commitParams;
    end % if
    % 31 33
    % 32 33
    this.initSuccessState;
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    this.CommandLineArgs = coderparams;
end % function
