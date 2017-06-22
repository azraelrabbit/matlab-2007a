function loop_unrolling = set_loop_unrolling(this, loop_unrolling)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(loop_unrolling)
        loop_unrolling = true;
        warning(hdlerrormsgid('invalidSetting'), 'Setting LoopUnrolling ''off'' is not supported in Verilog mode.');
        % 11 12
    end % if
end % function
