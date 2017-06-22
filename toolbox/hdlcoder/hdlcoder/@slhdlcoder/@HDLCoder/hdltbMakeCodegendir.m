function hdltbMakeCodegendir(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    codegendir = this.getParameter('codegendir');
    % 8 9
    [s, mess, messid] = mkdir(codegendir);
    if eq(s, 0.0)
        switch lower(messid)
        case 'matlab:mkdir:directoryexists'
        case 'matlab:mkdir:oserror'
            error(generatemsgid('directoryfailure'), 'Cannot create new directory %s.', codegendir);
        otherwise
            % 16 17
            % 17 19
            % 18 19
            error(messid, mess);
        end % switch
    end % if
end % function
