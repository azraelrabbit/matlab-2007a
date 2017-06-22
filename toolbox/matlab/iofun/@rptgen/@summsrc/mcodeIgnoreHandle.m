function tf = mcodeIgnoreHandle(this, h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    tf = true;
    if isa(h, 'rptgen.rpt_looper') && strcmpi(this.Type, this.up.LoopType)
        % 10 11
        tf = false;
    end % if
end % function
