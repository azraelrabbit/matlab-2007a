function disp(obj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    fprintf('DirReference %dx%d\n', size(obj));
    for i=1.0:numel(obj)
        fprintf('    DirName: %s\n', obj(i).DirName)
        fprintf('        ReferenceType: %s\n', obj(i).ReferenceType);
        fprintf('        ReferenceLocation: %s\n', obj(i).ReferenceLocation);
    end % for
end % function
