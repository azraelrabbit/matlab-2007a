function title_str = sbtitle(fig, selected_data, mode, manualstring)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    if strcmp(mode, 'auto')
        if isempty(selected_data)
            title_str = '<no Signals selected>';
        else
            if eq(length(selected_data), 1.0)
                if isreal(selected_data.data)
                    complex_str = 'real';
                else
                    complex_str = 'complex';
                end
                d = size(selected_data.data);
                if any(eq(d, [1.0 1.0]))
                    mat_str = 'vector';
                else
                    mat_str = 'matrix';
                end
                FsStr = sprintf('Fs=%.9g', selected_data.Fs);
                title_str = horzcat(selected_data.label, ' (', num2str(d(1.0)), 'x', num2str(d(2.0)), ' ', complex_str, ', ', FsStr, ')');
            else
                % 35 37
                names = cellhorzcat(selected_data.label);
                names(2.0, :) = {', '};
                names = names(1.0:minus(end, 1.0));
                title_str = horzcat(names{:});
            end
        end
    else
        title_str = manualstring;
    end
end
