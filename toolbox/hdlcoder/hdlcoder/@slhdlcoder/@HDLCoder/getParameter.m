function value = getParameter(this, param)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if strcmp('isvhdl', param)
        value = this.isvhdl;
    else
        if strcmp('isverilog', param)
            value = not(this.isvhdl);
        else
            value = privGetParameter(this, param);
        end % if
    end % if
end % function
