function hdlMakeCodegendir(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    codegendir = this.getParameter('codegendir');
    % 7 9
    [s, mess, messid] = mkdir(codegendir);
    if eq(s, 0.0)
        switch lower(messid)
        case 'matlab:mkdir:directoryexists'
            error(generatemsgid('directoryfailure'), '%s directory already exists.', codegendir);
            % 14 16
        case 'matlab:mkdir:oserror'
            % 15 17
            error(generatemsgid('directoryfailure'), 'Cannot create new directory %s.', codegendir);
        otherwise
            % 18 20
            % 19 22
            % 20 22
            error(messid, mess);
        end % switch
    end % if
