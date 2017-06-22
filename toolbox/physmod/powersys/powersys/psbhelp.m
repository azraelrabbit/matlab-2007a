function s = psbhelp(option)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    block = gcb;
    if lt(nargin, 1.0)
        option = '';
    end % if
    d = docroot;
    if isempty(d)
        html_file = horzcat(matlabroot, '/toolbox/physmod/powersys/powersys/power_herr.html');
    else
        if not(isempty(option))
            % 22 23
            if isnumeric(option)
                if ishandle(option) && strcmp(get_param(option, 'BlockType'), 'PMIOPort')
                    blkname = 'Connection Port';
                else
                    % 27 28
                    blkname = get_param(getfullname(option), 'MaskType');
                end % if
            else
                blkname = option;
            end % if
        else
            blkname = get_param(block, 'MaskType');
        end % if
        if isempty(blkname)
            % 37 38
            blkname = 'powersys_product_page';
        end % if
        switch blkname
        case 'Detailed Thyristor'
            % 42 43
            blkname = 'Thyristor';
        case 'Discrete DC machine'
            % 45 46
            blkname = 'DC machine';
        case 'Distributed Parameters Line'
            % 48 49
            blkname = 'Distributed Parameter Line';
        case 'PSB option menu block'
            % 51 52
            blkname = 'Powergui';
        case 'Machine measurements'
            % 54 55
            blkname = 'Machine Measurement Demux';
        case 'MultimeterPSB'
            % 57 58
            blkname = 'Multimeter';
        case 'Fourier analyser'
            blkname = 'Fourier';
        case 'abc to dq0 Transformation'
            blkname = 'abc_to_dq0 transformation';
        case 'dq0 to abc Transformation'
            blkname = 'dq0_to_abc transformation';
        case '3-Phase VI Measurement'
            blkname = 'three-phase vi measurement';
        case '3-Phase Sequence analyzer'
            blkname = 'Three-Phase Sequence Analyzer';
        case 'Three-Phase Linear Transformer 12-Terminals'
            blkname = 'Three Phase Transformer 12 Terminals';
        end % switch
        html_file = horzcat(d, '/toolbox/physmod/powersys/ref/', help_name(blkname));
    end % if
    s = horzcat('file:///', html_file);
end % function
function y = help_name(x)
    % 77 78
    if isempty(x)
        x = 'default';
    end % if
    y = lower(x);
    y(not(isvalidchar(y))) = [];
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
