function disp(obj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    fprintf('ToolboxDetails %dx%d\n', size(obj));
    for i=1.0:numel(obj)
        fprintf('   %s version %s (%s)\n', obj(i).Name, obj(i).Version, obj(i).DirectoryName);
        % 12 13
    end % for
end % function
