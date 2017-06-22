function handle = objectToHandle(obj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if ~(isa(obj, 'double') || isa(obj, 'char'))
        handle = obj.Handle;
    else
        handle = obj;
    end
end
