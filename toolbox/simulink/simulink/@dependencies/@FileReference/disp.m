function disp(obj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    fprintf('FileReference %dx%d\n', size(obj));
    for i=1.0:numel(obj)
        if not(obj(i).Resolved)
            tb = 'no matching files found';
        else
            if not(isempty(obj(i).Toolbox))
                tb = sprintf('%s, version %s', obj(i).Toolbox.Name, obj(i).Toolbox.Version);
            else
                tb = 'not in a toolbox';
            end % if
        end % if
        fprintf('    FileName: %s (%s)\n', obj(i).FileName, tb)
        fprintf('        ReferenceType: %s\n', obj(i).ReferenceType);
        fprintf('        ReferenceLocation: %s\n', strrep(obj(i).ReferenceLocation, sprintf('\n'), ' '));
    end % for
end % function
