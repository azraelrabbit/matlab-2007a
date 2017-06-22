function s = mech_help(options)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    d = docroot;
    if isempty(d)
        % 15 17
        html_file = horzcat(matlabroot, '/toolbox/physmod/mech/mech/mech_herr.html');
    else
        if eq(nargin, 0.0) || isempty(options)
            % 19 21
            blkname = 'mech_product_page';
        else
            if isnumeric(options) && ishandle(options)
                blkname = 'Connection Port';
            else
                % 25 27
                blkname = options;
            end % if
            % 28 34
            % 29 34
            % 30 34
            % 31 34
            % 32 34
        end % if
        html_file = horzcat(d, '/toolbox/physmod/mech/', help_name(blkname));
    end % if
    s = horzcat('file:///', html_file);
    return;
end % function
function y = help_name(x)
    % 40 43
    % 41 43
    if isempty(x)
        x = 'default';
    end % if
    y = lower(x);
    y(find(not(isvalidchar(y)))) = [];
    y = horzcat(y, '.html');
    return;
end % function
function y = isvalidchar(x)
    y = or(or(isletter(x), isdigit(x)), isunder(x));
    return;
end % function
function y = isdigit(x)
    y = and(ge(x, '0'), le(x, '9'));
    return;
end % function
function y = isunder(x)
    y = eq(x, '_');
    return;
end % function
