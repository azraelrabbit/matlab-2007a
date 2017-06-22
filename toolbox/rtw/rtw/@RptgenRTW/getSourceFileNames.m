function out = getSourceFileNames(names)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    out = {};
    % 8 9
    for k=1.0:length(names)
        [pathName, fileName, fileExt] = fileparts(names{k});
        if ismember(fileExt, {'.c','.cpp','.h','.hpp'})
            out = vertcat(out, horzcat(names{k}));
        end % if
    end % for
end % function
