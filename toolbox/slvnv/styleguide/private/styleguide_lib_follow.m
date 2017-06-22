function status = styleguide_lib_follow(usage)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    switch usage
    case 'check'
        status = 'on';
    case 'fixit'
        status = 'off';
    otherwise
        status = 'off';
    end % switch
end % function
