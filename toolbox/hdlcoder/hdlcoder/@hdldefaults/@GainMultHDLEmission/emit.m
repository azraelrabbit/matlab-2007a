function hdlcode = emit(this, hC)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    [status, hdlcode, params] = this.emitMain(hC);
    % 12 13
    if not(status)
        % 14 15
        [tmpbody, tmpsignals] = hdlmultiply(params.Input, params.Const, params.Output, params.Rounding, params.Overflow);
        % 16 22
        % 17 22
        % 18 22
        % 19 22
        % 20 22
        % 21 22
        hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, tmpbody);
        hdlcode.arch_signals = horzcat(hdlcode.arch_signals, tmpsignals);
        % 24 25
    end % if
end % function
