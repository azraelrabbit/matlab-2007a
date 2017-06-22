function tl = set_target_language(this, tl)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    switch lower(tl)
    case 'vhdl'
        this.isvhdl = true;
        this.isverilog = false;
    case 'verilog'
        this.isvhdl = false;
        this.isverilog = true;
    end % switch
end % function
