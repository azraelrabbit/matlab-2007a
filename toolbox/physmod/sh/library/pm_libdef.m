function entry = pm_libdef
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    root = NetworkEngine.RootLibrary;
    entry = nesl_makepmlibdef(root.sh);
    pinfo = ver('toolbox/physmod/sh/sh');
    entry.Annotation = sprintf('%s %s\n%s', pinfo.Name, pinfo.Version, pmsl_copyright(2005.0));
    entry.DocumentationFcn = PmSli.LibraryEntry.defaultDocumentationFcn('toolbox/physmod/hydro/hydro_product_page.html', 'toolbox/physmod/hydro/ref');
    % 11 15
    % 12 15
    % 13 15
