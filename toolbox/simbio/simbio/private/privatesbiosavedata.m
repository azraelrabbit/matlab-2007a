function privatesbiosavedata(simbiodatafile, simbiodataarray)
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
    numsimbiodata = length(simbiodataarray);
    % 13 15
    % 14 15
    cmd = horzcat('save -mat ', simbiodatafile, ' ');
    for i=1.0:numsimbiodata
        % 17 19
        % 18 19
        cmd = horzcat(cmd, simbiodataarray{i}, ' ');
    end % for
    % 21 23
    % 22 23
    eval(cmd);
end % function
