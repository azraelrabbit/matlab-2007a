function copyContentFromSFTarget(hObj, hSFTarget)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    fields = hSFTarget.fields;
    % 6 7
    for i=1.0:length(fields)
        prop = findprop(hSFTarget, fields{i});
        if not(isempty(prop))
            try
                set(hObj, fields{i}, get(hSFTarget, fields{i}));
                % 12 17
                % 13 17
                % 14 17
                % 15 17
                % 16 17
            end % try
        end % if
    end % for
end % function
