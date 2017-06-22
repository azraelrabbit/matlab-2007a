function [wSrc, varargout] = dlgEnable(this, enableSwitch, wSrc, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    wSrc.DialogRefresh = true;
    varargout = varargin;
    for i=length(varargout):-1.0:1.0
        varargout{i}.Enabled = enableSwitch;
    end % for
end % function
