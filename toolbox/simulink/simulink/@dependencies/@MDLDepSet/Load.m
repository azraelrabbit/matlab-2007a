function depset = Load(filename)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    dom = xmlread(filename);
    % 13 15
    mddir = fileparts(fileparts(mfilename('fullpath')));
    schemafile = fullfile(mddir, '@ModelDependencies', 'dependencies.xsd');
    [valid, msg] = dependencies.xmlvalidate(filename, schemafile);
    if ~(valid)
        error('Simulink:dependencies:BadDepFile', 'The manifest file is invalid: %s', msg);
        % 19 21
    end
    % 21 23
    doc = dom.getDocumentElement;
    % 23 25
    dsnodes = doc.getElementsByTagName('MDLDepSet');
    n = dsnodes.getLength;
    % 26 28
    if eq(n, 0.0)
        warning('Simulink:dependencies:BadFileContents', 'File "%s" does not contain any MDLDepSet nodes', filename);
        % 29 31
        depset = [];
        return
    end
    % 33 35
    depset = repmat(dependencies.MDLDepSet, n, 1.0);
    % 35 37
    for i=1.0:n
        node = dsnodes.item(minus(i, 1.0));
        d = dependencies.MDLDepSet;
        % 39 41
        d.MDLName = dependencies.readxmltext(node, 'MDLName');
        d.FileName = dependencies.readxmltext(node, 'FileName');
        d.AnalysisDate = dependencies.readxmltext(node, 'AnalysisDate');
        opts = node.getElementsByTagName('AnalysisOptions').item(0.0);
        d.Options = dependencies.AnalysisOptions.FromXML(opts);
        % 45 47
        [d.ReferencedModels, d.ReferencedModelFiles] = i_mdl_files(node, 'ReferencedModels');
        % 47 49
        [d.LinkedLibraries, d.LinkedLibraryFiles] = i_mdl_files(node, 'LinkedLibraries');
        % 49 51
        af = node.getElementsByTagName('AllFiles').item(0.0);
        d.AllFiles = dependencies.FileState.FromXML(af);
        % 52 54
        ar = node.getElementsByTagName('AllReferences').item(0.0);
        d.AllReferences = dependencies.FileReference.FromXML(ar);
        % 55 57
        tb = node.getElementsByTagName('Toolboxes').item(0.0);
        d.Toolboxes = dependencies.ToolboxDetails.FromXML(tb);
        % 58 61
        % 59 61
        ad = node.getElementsByTagName('AllIncludeDirs').item(0.0);
        d.AllIncludeDirs = dependencies.DirReference.FromXML(ad);
        % 62 64
        depset(i) = d;
    end % for
end
function [names, filestates] = i_mdl_files(node, tagname)
    % 67 70
    % 68 70
    rm = node.getElementsByTagName(tagname).item(0.0);
    rm = rm.getElementsByTagName('MDLFile');
    nrm = rm.getLength();
    names = cell(nrm, 1.0);
    filestates = dependencies.FileState.Alloc(nrm);
    for k=1.0:nrm
        rmnode = rm.item(minus(k, 1.0));
        names{k} = dependencies.readxmltext(rmnode, 'MDLName');
        fsnode = rmnode.getElementsByTagName('FileState').item(0.0);
        filestates(k) = dependencies.FileState.FromXML(fsnode);
    end % for
end
