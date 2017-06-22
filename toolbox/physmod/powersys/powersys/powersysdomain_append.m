function powersysdomain_append(system)
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
    [r, n, append_independent_networks] = powersysdomain_netlist('get');
    % 12 13
    if append_independent_networks
        powersysdomain_start(1.0);
    end % if
end % function
