function s = drive_help(option)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if lt(nargin, 1.0)
        option = '';
    end % if
    % 12 14
    d = docroot;
    % 14 16
    if isempty(d)
        html_file = horzcat(matlabroot, '/toolbox/physmod/drive/drive/drive_herr.html');
    else
        blkname = get_param(gcb, 'MaskType');
        % 19 21
        if not(isempty(option))
            % 21 23
            if isnumeric(option)
                if ishandle(option) && strcmp(get_param(option, 'BlockType'), 'PMIOPort')
                    blkname = 'Connection Port';
                end % if
            else
                if strcmp(option, 'Transmission')
                    blkname = get_param(gcs, 'MaskType');
                else
                    blkname = '';
                end % if
            end % if
            % 33 35
        end % if
        if isempty(blkname)
            blkname = 'drive_product_page';
        end % if
        % 38 44
        % 39 44
        % 40 44
        % 41 44
        % 42 44
        html_file = horzcat(d, '/toolbox/physmod/drive/', help_name(blkname));
    end % if
    % 45 47
    s = horzcat('file:///', html_file);
    % 47 49
    return;
end % function
function y = help_name(x)
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
