function nesl_buildlibrary(library)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    LIBDEF_TOKEN = 'pm_libdef';
    % 9 10
    directory = fileparts(library.info.SourceFile);
    libDef = pm_pathtofunctionhandle(directory, LIBDEF_TOKEN);
    % 12 13
    nesl_makelibrary_tool(libDef());
    % 14 15
end % function
