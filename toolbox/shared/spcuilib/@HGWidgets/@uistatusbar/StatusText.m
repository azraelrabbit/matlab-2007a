function StatusText(obj, str)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    set(obj.hStatusText, 'string', str);
    ResizeFcn(obj);
end % function
