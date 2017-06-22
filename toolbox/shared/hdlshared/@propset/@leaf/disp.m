function disp(h)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    disp(class(h))
    % 6 8
    names = char(h.prop_set_names);
    nameLen = size(names, 2.0);
    col2 = max(10.0, plus(nameLen, 1.0));
    col2_title_diff = minus(col2, 8.0);
    col2_title_align = blanks(col2_title_diff);
    col2_entry_diff = plus(minus(col2, nameLen), 3.0);
    col2_entry_align = blanks(col2_entry_diff);
    % 14 16
    s = horzcat('PropName', col2_title_align, 'Enabled Total');
    fprintf('%s\n', s);
    fprintf(horzcat(repmat('-', 1.0, numel(s)), '\n'));
    for i=1.0:numel(h.prop_sets)
        name = names(i, :);
        if h.prop_set_enables(i)
            ena = 'X';
        else
            ena = ' ';
        end % if
        thisPropSet = h.getPropSet(h.prop_set_names{i});
        Ntot = numel(fieldnames(thisPropSet));
        fprintf('%s%s%s     %d\n', name, col2_entry_align, ena, Ntot);
    end % for
    fprintf('\n');
end % function
