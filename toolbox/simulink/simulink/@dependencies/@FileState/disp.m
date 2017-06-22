function disp(obj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    fprintf('FileState %dx%d\n', size(obj));
    for i=1.0:numel(obj)
        fprintf('   %s (%d bytes, last modified: %s)\n', obj(i).FileName, obj(i).Size, obj(i).LastModifiedDate);
        % 12 13
    end % for
end % function
