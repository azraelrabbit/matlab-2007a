function funcSet = uSafeSetParam(h, block, varargin)
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
    funcSet = cellhorzcat('uSafeSetParam', h, block, varargin{:});
    % 13 15
    if doUpdate(h)
        try
            set_param(block, varargin{:})
        catch
            errmsg = lasterr;
            DAStudio.warning('Simulink:utility:slupdateSetParamCaught', cleanBlockName(h, block), errmsg);
            % 20 23
            % 21 23
        end % try
    end % if
    % 24 26
end % function
