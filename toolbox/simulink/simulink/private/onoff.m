function outbool = onoff(input)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if isstr(input)
        % 16 17
        switch input
        case 'on'
            % 19 20
            outbool = 1.0;
        case 'off'
            % 22 23
            outbool = 0.0;
        case 'yes'
            % 25 26
            outbool = 'on';
        case 'no'
            % 28 29
            outbool = 'off';
        otherwise
            % 31 32
            error('Allowable string inputs: ''on'', ''off'', ''yes'', ''no''');
        end % switch
    else
        % 35 37
        % 36 37
        onoffs = {'off','on'};
        outbool = onoffs{plus(input, 1.0)};
        % 39 40
    end % if
end % function
