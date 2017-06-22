function privateupdatelibrary(libtype)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    if not(ischar(libtype))
        error('SimBiology:PRIVATEUPDATELIBRARY_INVALIDLIBTYPE', 'The name of the library must be specified as ''unit'' or ''unitprefix''. ');
        % 18 21
        % 19 21
    end % if
    % 21 23
    if not(strcmpi(libtype, 'unit')) && not(strcmpi(libtype, 'unitprefix')) && not(strcmpi(libtype, 'kineticlaw'))
        % 23 25
        error('SimBiology:PRIVATEUPDATELIBRARY_INVALIDLIBTYPE', 'The library type must be either ''kineticlaw'', ''unit'' or ''unitprefix''. ');
        % 25 28
        % 26 28
    end % if
    % 28 31
    % 29 31
    if strcmpi(libtype, 'kineticlaw')
        libfile = horzcat(prefdir, filesep, 'SimBiology', filesep, 'userdefkinlaws.sbklib');
    else
        libfile = horzcat(prefdir, filesep, 'SimBiology', filesep, 'userdefunits.sbulib');
    end % if
    % 35 38
    % 36 38
    rootobj = SimBiology.Root.getroot;
    % 38 41
    % 39 41
    switch libtype
    case 'kineticlaw'
        % 42 45
        % 43 45
        mw_aklarray = rootobj.UserDefinedKineticLaws;
        % 45 48
        % 46 48
        if isempty(mw_aklarray)
            mw_aklmanifest = '';
        else
            mw_aklmanifest = evalc('display(mw_aklarray,true)');
        end % if
        % 52 55
        % 53 55
        try
            simbio_ver = ver('simbio');
            cmd = horzcat('save -mat ''', libfile, ''' mw_aklarray mw_aklmanifest simbio_ver;');
            eval(cmd);
        catch
            rethrow(lasterror);
        end % try
    case 'unit'
        % 62 65
        % 63 65
        mw_unitarray = privateunitcall('getregisteredunits', 1.0);
        % 65 68
        % 66 68
        if isempty(mw_unitarray)
            mw_unitmanifest = '';
        else
            mw_unitmanifest = privategetunitmanifest(mw_unitarray, 'File');
        end % if
        % 72 76
        % 73 76
        % 74 76
        try
            simbio_ver = ver('simbio');
            if exist(libfile, 'file')
                cmd = horzcat('save -mat -append ''', libfile, ''' mw_unitarray mw_unitmanifest simbio_ver;');
            else
                cmd = horzcat('save -mat ''', libfile, ''' mw_unitarray mw_unitmanifest simbio_ver;');
            end % if
            eval(cmd);
        catch
            rethrow(lasterror);
        end % try
    case 'unitprefix'
        % 87 90
        % 88 90
        mw_prefixarray = privateunitcall('getregisteredprefixes', 1.0);
        % 90 93
        % 91 93
        if isempty(mw_prefixarray)
            mw_prefixmanifest = '';
        else
            mw_prefixmanifest = privategetprefixmanifest(mw_prefixarray, 'File');
        end % if
        % 97 101
        % 98 101
        % 99 101
        try
            simbio_ver = ver('simbio');
            if exist(libfile, 'file')
                cmd = horzcat('save -mat -append ''', libfile, ''' mw_prefixarray mw_prefixmanifest simbio_ver;');
            else
                cmd = horzcat('save -mat ''', libfile, ''' mw_prefixarray mw_prefixmanifest simbio_ver;');
            end % if
            eval(cmd);
        catch
            rethrow(lasterror);
        end % try
    end % switch
    % 112 114
    return;
