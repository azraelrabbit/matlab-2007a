function varargout = privcheckhdl(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(builtin('license', 'checkout', 'Simulink_HDL_Coder')) || not(hdlcoderui.isslhdlcinstalled)
        % 9 11
        % 10 11
        error(hdlcodererrormsgid('nolicenseavailable'), 'Unable to check out a license for the Simulink HDL Coder.');
        % 12 13
    end % if
    % 14 15
    hc = hdlcoderargs(varargin{:});
    % 16 17
    if gt(nargout, 0.0)
        varargout{1.0} = hc.checkhdl;
    else
        hc.checkhdl;
    end % if
end % function
