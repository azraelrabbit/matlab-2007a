function location_out = url_unescape(location)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    location_out = location;
    % 17 18
    if isempty(location)
        return;
    end % if
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    ind = findstr(location, '%');
    if isempty(ind)
        return;
    end % if
    % 29 31
    % 30 31
    seqlength = 3.0;
    % 32 33
    start_ind = ind(1.0);
    % 34 35
    end_ind = minus(start_ind, 1.0);
    % 36 37
    last_raw = [];
    last_conv = [];
        while lt(start_ind, length(location))
        % 40 41
        end_ind_cand = plus(end_ind, seqlength);
        % 42 43
        if gt(end_ind_cand, length(location))
            % 44 45
            bCONVERT = true;
        else
            % 47 48
            last_raw_cand = location(start_ind:end_ind_cand);
            [last_conv_cand, ok] = i_convert_hex(last_raw_cand);
            % 50 51
            if ok
                % 52 54
                % 53 54
                end_ind = end_ind_cand;
                last_raw = last_raw_cand;
                last_conv = last_conv_cand;
                bCONVERT = false;
            else
                % 59 60
                bCONVERT = true;
            end % if
        end % if
        % 63 64
        if bCONVERT
            % 65 66
            if not(isempty(last_conv))
                location_out = strrep(location_out, last_raw, last_conv);
                last_raw = [];
                last_conv = [];
            end % if
            % 71 73
            % 72 73
            start_ind_array = ind(gt(ind, max(start_ind, end_ind)));
            if isempty(start_ind_array)
                break
            else
                start_ind = start_ind_array(1.0);
                end_ind = minus(start_ind, 1.0);
                % 79 81
                % 80 81
            end % if
            % 82 84
            % 83 84
            if isempty(findstr(location_out, '%'))
                break
            end % if
        end % if
    end % while
    % 89 90
end % function
function [out, ok] = i_convert_hex(in)
    % 92 96
    % 93 96
    % 94 96
    % 95 96
    ok = false;
    out = in;
    % 98 99
    if isempty(in)
        return;
    end % if
    % 102 103
    hex_cand = textscan(in, '%s', 'delimiter', '%');
    if isempty(hex_cand) || not(iscell(hex_cand))
        % 105 106
        return;
    end % if
    % 108 109
    hex_cand = hex_cand{1.0};
    if isempty(hex_cand)
        return;
    end % if
    % 113 114
    if isempty(hex_cand{1.0})
        hex_cand(1.0) = [];
    end % if
    % 117 119
    % 118 119
    if any(ne(cellfun('length', hex_cand), 2.0)) || isempty(hex_cand)
        % 120 121
        return;
    end % if
    % 123 125
    % 124 125
    [aa, bb] = lasterr;
    try
        dec_cand = hex2dec(hex_cand);
        out = native2unicode(dec_cand, 'UTF-8');
        out = reshape(out, 1.0, length(out));
        ok = true;
    catch
        % 132 133
        lasterr(aa, bb);
    end % try
    % 135 136
end % function
