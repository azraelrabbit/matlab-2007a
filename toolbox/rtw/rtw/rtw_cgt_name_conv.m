function outName = rtw_cgt_name_conv(inName, direction)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    [path, file, ext] = fileparts(inName);
    % 19 21
    if isequal(direction, 'cgt2tlc')
        if isequal(ext, '.cgt')
            outName = fullfile(path, horzcat(file, '_cgt.tlc'));
        else
            outName = inName;
        end % if
    else
        if isequal(direction, 'tlc2cgt')
            if isequal(ext, '.tlc')
                file = regexprep(file, '_cgt$', '');
                outName = fullfile(path, horzcat(file, '.cgt'));
            else
                outName = inName;
            end % if
        else
            DAStudio.error('RTW:utility:invalidInputArgs', direction);
        end % if
    end % if
end % function
