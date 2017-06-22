function unitmanifest = privategetunitmanifest(unitvector, listtype)
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
    unitmanifest = '';
    % 13 15
    % 14 15
    if not(isempty(unitvector))
        if strcmpi(listtype, 'userdefined')
            header1 = sprintf('\n%3s%s\n', '', 'SimBiology UserDefined Units');
        else
            header1 = sprintf('\n%3s%s\n', '', 'SimBiology Units');
        end % if
        header2 = sprintf('%3s%-8s%-16s%-25.25s%-16s%-13s', '', 'Index:', 'Name:', 'Composition:', 'Multiplier:', 'Offset:');
        % 22 23
        unitmanifest = header1;
        unitmanifest = char(unitmanifest, header2);
        n = length(unitvector);
        for i=1.0:n
            % 27 29
            % 28 29
            len = length(unitvector(i).name);
            if gt(len, 15.0)
                tempname = horzcat('[1x', num2str(len), ' char]');
            else
                tempname = unitvector(i).name;
            end % if
            % 35 37
            % 36 37
            len = length(unitvector(i).composition);
            if gt(len, 24.0)
                tempcomp = horzcat('[1x', num2str(len), ' char]');
            else
                tempcomp = unitvector(i).composition;
            end % if
            % 43 44
            displine = sprintf('%3s%-8d%-16s%-25.25s%-16f%-13f', '', i, tempname, tempcomp, unitvector(i).conversionfactor, unitvector(i).conversionoffset);
            % 45 49
            % 46 49
            % 47 49
            % 48 49
            unitmanifest = char(unitmanifest, displine);
        end % for
    end % if
    return;
end % function
