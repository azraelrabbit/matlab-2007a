function prefixmanifest = privategetprefixmanifest(prefixvector, listtype)
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
    prefixmanifest = '';
    % 17 19
    % 18 19
    if not(isempty(prefixvector))
        if strcmpi(listtype, 'userdefined')
            header1 = sprintf('\n%3s%s\n', '', 'SimBiology UserDefined Unit Prefixes');
        else
            header1 = sprintf('\n%3s%s\n', '', 'SimBiology Unit Prefixes');
        end % if
        header2 = sprintf('%3s%-8s%-16s%-25s', '', 'Index:', 'Name:', 'Multiplier:');
        % 26 27
        prefixmanifest = header1;
        prefixmanifest = char(prefixmanifest, header2);
        n = length(prefixvector);
        for i=1.0:n
            % 31 32
            len = length(prefixvector(i).name);
            if gt(len, 15.0)
                tempname = horzcat('[1x', num2str(len), ' char]');
            else
                tempname = prefixvector(i).name;
            end % if
            displine = sprintf('%3s%-8d%-16s%-25d', '', i, tempname, prefixvector(i).multiplier);
            % 39 41
            % 40 41
            prefixmanifest = char(prefixmanifest, displine);
        end % for
    end % if
    % 44 45
    return;
end % function
