function SetUserDependencies(obj, deps, deplevels)
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
    mdlname = obj.MDLName;
    deps = cellstr(deps);
    % 18 20
    dependencies.ensure_loaded(mdlname);
    mdlfile = get_param(mdlname, 'FileName');
    if isempty(mdlfile)
        error('Simulink:dependencies:NoMDLFile', 'This model has not yet been saved');
    end % if
    % 24 26
    if lt(nargin, 3.0)
        [ignore_deps, deproot, deplevels] = obj.GetUserDependencies();
    else
        deproot = fileparts(mdlfile);
        if not(isnumeric(deplevels)) || ne(numel(deplevels), 1.0) || ne(floor(deplevels), deplevels)
            error('MATLAB:InvalidInput', 'Third input must be a scalar integer');
        end % if
        for i=1.0:deplevels
            deproot = fileparts(deproot);
        end % for
    end % if
    % 36 38
    docNode = com.mathworks.xml.XMLUtils.createDocument('MdlFileDependencies');
    rootNode = docNode.getDocumentElement();
    simulinkVersion = ver('simulink');
    rootNode.setAttribute('version', simulinkVersion.Version);
    dependencies.xmltextnode(docNode, rootNode, 'DependenciesRootLevel', num2str(deplevels));
    % 42 44
    depsNode = docNode.createElement('UserDependencies');
    rootNode.appendChild(depsNode);
    % 45 47
    ldr = numel(deproot);
    if ispc
        matchfn = @strncmpi;
    else
        matchfn = @strncmp;
    end % if
    for i=1.0:numel(deps)
        thisdep = deps{i};
        if not(matchfn(thisdep, deproot, ldr))
            error('Simulink:dependencies:NotInsideRoot', 'User-dependency is not inside the "project root": %s\n', deps{i});
            % 56 58
        end % if
        thisdep = thisdep(plus(ldr, 1.0):end);
        dependencies.xmltextnode(docNode, depsNode, 'UserDependency', thisdep);
    end % for
    % 61 63
    mdldir = fileparts(mdlfile);
    depfile = fullfile(mdldir, horzcat(mdlname, '.dep'));
    xmlwrite(depfile, docNode);
    % 65 68
    % 66 68
    a = obj.GetUserDependencies();
    dependencies.assert(eq(numel(a), numel(deps)), 'Dependencies written correctly');
    dependencies.assert(all(strcmp(a(:), deps(:))), 'Dependencies written correctly');
