function powersysdomain_init(mdl)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    [a, b, append_independent_networks] = powersysdomain_netlist('get');
    if eq(append_independent_networks, 2.0)
        % 12 13
        Append = 1.0;
    else
        Append = 0.0;
    end % if
    powersysdomain_netlist('clear', Append);
end % function
