function sout = convertstatestruct(h, sin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    sout.mode = sin.order.calc(1.0:7.0);
    sout.order = sin.order.value{1.0};
end % function
