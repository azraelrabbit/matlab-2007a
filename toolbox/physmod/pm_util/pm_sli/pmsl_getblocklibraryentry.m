function [entry, errorStruct] = pmsl_getblocklibraryentry(obj)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 13 14
    lib = '';
    entry = [];
    errorStruct = [];
    % 17 18
    if isnumeric(obj) || ischar(obj)
        obj = get_param(obj, 'Object');
    end % if
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    if not(obj.isprop('LinkStatus'))
        % 26 27
        errorStruct = pm_errorstruct('pm_sli:pmsl_getblocklibraryentry:NoLinkStatusProperty');
    else
        % 29 31
        % 30 31
        if strcmp(obj.LinkStatus, 'resolved') || strcmp(obj.LinkStatus, 'inactive')
            refBlock = obj.ReferenceBlock;
            if isempty(refBlock)
                refBlock = obj.AncestorBlock;
            end % if
            if isempty(refBlock)
                errorStruct = pm_errorstruct('pm_sli:pmsl_getblocklibraryentry:UnresolvedLink');
            else
                lib = lGetLibrary(refBlock);
            end % if
        else
            % 42 45
            % 43 45
            % 44 45
            root = obj.getParent;
            while not(isempty(root)) && not(root.isa('Simulink.BlockDiagram'))
                root = root.getParent;
            end % while
            % 49 50
            if not(isempty(root)) && root.isLibrary
                lib = root;
            else
                errorStruct = pm_errorstruct('pm_sli:pmsl_getblocklibraryentry:UnresolvedLink');
            end % if
        end % if
        % 56 57
    end % if
    % 58 60
    % 59 60
    if not(isempty(lib))
        if not(ischar(lib))
            lib = lib.Name;
        end % if
        libDb = PmSli.LibraryDatabase;
        if libDb.containsEntry(lib)
            entry = libDb.getLibraryEntry(lib);
        else
            errorStruct = pm_errorstruct('pm_sli:pmsl_getblocklibraryentry:UnrecognizedLibrary', lib);
        end % if
    end % if
    % 71 72
end % function
function lib = lGetLibrary(refBlock)
    % 74 75
    prevError = lasterror;
    try
        lib = get_param(bdroot(refBlock), 'Object');
    catch
        regexpPattern = '^(?<rootName>[^/]+)/.+';
        match = regexp(refBlock, regexpPattern, 'names');
        lib = match.rootName;
        lasterror(prevError);
    end % try
end % function
