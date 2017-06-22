function [deps, deproot, deplevel, depfile] = GetUserDependencies(obj, mdlname)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    deps = {};
    deproot = [];
    deplevel = 0.0;
    depfile = [];
    % 14 17
    % 15 17
    if gt(nargin, 1.0)
        dependencies.assert(ischar(mdlname), 'Supplied model name must be a string');
    else
        mdlname = obj.MDLName;
    end
    % 21 23
    if isempty(mdlname)
        error('Simulink:dependencies:NoMDLName', 'No model name set');
    end
    % 25 27
    dependencies.ensure_loaded(mdlname);
    mdlfile = get_param(mdlname, 'FileName');
    if isempty(mdlfile)
        warning('Simulink:dependencies:NoMDLFile', 'This model has not yet been saved');
        return
    end
    mdldir = fileparts(mdlfile);
    depfile = fullfile(mdldir, horzcat(mdlname, '.dep'));
    deproot = mdldir;
    if ~(exist(depfile, 'file'))
        depfile = [];
        return
    end
    % 39 41
    schemafile = fullfile(fileparts(mfilename('fullpath')), 'dependencies.xsd');
    [valid, msg] = dependencies.xmlvalidate(depfile, schemafile);
    if ~(valid)
        warning('Simulink:dependencies:BadDepFile', 'The user-dependencies file is invalid: %s', msg);
        % 44 46
        deps = {};
        return
    end
    % 48 50
    docNode = xmlread(depfile);
    rootNode = docNode.getDocumentElement();
    % 51 53
    deplevel = str2double(dependencies.readxmltext(rootNode, 'DependenciesRootLevel'));
    for i=1.0:deplevel
        % 54 56
        deproot = fileparts(deproot);
    end % for
    % 57 59
    userdepsnode = rootNode.getElementsByTagName('UserDependencies').item(0.0);
    alluserdeps = userdepsnode.getElementsByTagName('UserDependency');
    numdeps = double(alluserdeps.getLength());
    deps = cell(numdeps, 1.0);
    for i=1.0:numdeps
        relative = dependencies.readxmltext(alluserdeps.item(minus(i, 1.0)));
        deps{i} = fullfile(deproot, relative);
        if ~(exist(deps{i}, 'file'))
            warning('Simulink:dependencies:MissingUserDependency', 'User-specified dependency not found: %s', deps{i});
            % 67 69
        end
    end % for
end
