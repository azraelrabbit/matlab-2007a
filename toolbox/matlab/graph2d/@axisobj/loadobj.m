function B = loadobj(A)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if strcmp(class(A), 'axisobj')
        B = A;
    else
        % 11 12
        try
            A = rmfield(A, 'Draggable');
            HGObj = A.scribehgobj;
            A = rmfield(A, 'scribehgobj');
            B = class(A, 'axisobj', HGObj);
        catch
            disp(lasterr)
            warning('MATLAB:loadobj:IncompatibleFileVersion', 'Incompatible version of .fig file');
        end % try
        % 21 22
    end % if
end % function
