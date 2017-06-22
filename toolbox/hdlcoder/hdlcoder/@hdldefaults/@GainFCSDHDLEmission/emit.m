function hdlcode = emit(this, hC)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    [status, hdlcode, params] = this.emitMain(hC);
    % 13 14
    if not(status)
        % 15 16
        if ne(params.Outsize, 0.0)
            % 17 18
            [tmpbody, tmpsignals] = hdlmultiplyfactoredcsd(params.Input, params.ConstVal, params.Const, params.Output, params.Rounding, params.Overflow);
            % 19 26
            % 20 26
            % 21 26
            % 22 26
            % 23 26
            % 24 26
            % 25 26
            hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, tmpbody);
            hdlcode.arch_signals = horzcat(hdlcode.arch_signals, tmpsignals);
        else
            % 29 31
            % 30 31
            [tmpbody, tmpsignals] = hdlmultiply(params.Input, params.Const, params.Output, params.Rounding, params.Overflow);
            % 32 38
            % 33 38
            % 34 38
            % 35 38
            % 36 38
            % 37 38
            hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, tmpbody);
            hdlcode.arch_signals = horzcat(hdlcode.arch_signals, tmpsignals);
            % 40 41
        end % if
        % 42 43
    end % if
end % function
