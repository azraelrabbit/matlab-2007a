function [out1, out2] = pDialogEdit(obj, action, arg1, arg2)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    switch action
    case 'create'
        out1 = i_create(obj);
        out2 = 'ignore this';
    case 'callback'
        i_callback(obj, arg1, arg2);
        out1 = 'ignore this';
        out2 = 'ignore this too';
    case 'apply'
        [out1, out2] = i_apply(obj, arg1);
    case 'get'
        out2 = 'ignore this';
        if lt(nargin, 3.0)
            arg1 = false;
        end
        if lt(nargin, 4.0)
            arg2 = [];
        end
        out1 = i_get(obj, arg1, arg2);
    end
end
function dlg = i_get(obj, arg1, arg2)
    % 40 44
    % 41 44
    % 42 44
    existing_dlgs = DAStudio.ToolRoot.getOpenDialogs;
    tag = i_tag(obj);
    for i=1.0:numel(existing_dlgs)
        if strmatch(existing_dlgs(i).DialogTag, tag)
            dlg = existing_dlgs(i);
            return
        end
    end % for
    if not(islogical(arg1))
        % 52 54
        dependencies.assert(isa(arg1, 'dependencies.MDLDepSet'), 'Instance of MDLDepSet required');
        % 54 56
        dependencies.assert(isa(arg2, 'char'), 'File name must be a string');
        % 56 58
        dlgdata = i_create_dialog_data(obj, arg1, arg2);
        i_dialog_data([], dlgdata);
        dlg = DAStudio.Dialog(obj, 'edit', 'DLG_STANDALONE');
    else
        if arg1
            dlg = DAStudio.Dialog(obj, 'edit', 'DLG_STANDALONE');
        else
            dlg = [];
        end
    end
end
function dlgdata = i_create_dialog_data(obj, depset, filename)
    % 69 72
    % 70 72
    dlgdata = struct('DepSet', depset, 'FileName', filename, 'ContentsList', []);
    % 72 76
    % 73 76
    % 74 76
    fs = getAllFiles(depset);
    if not(isempty(fs))
        dlgdata.ContentsList = unique(cellstr(get(fs, 'FileName')));
    else
        dlgdata.ContentsList = {};
    end
end
function tag = i_tag(obj)
    % 83 86
    % 84 86
    tag = horzcat('Tag_EditManifest_', obj.MDLName);
end
function title = i_title(obj)
    % 88 91
    % 89 91
    title = sprintf('Edit Manifest Contents: %s', obj.MDLName);
end
function dlgStruct = i_create(obj)
    % 93 96
    % 94 96
    dlgdata = i_dialog_data([]);
    if isempty(dlgdata)
        error('No dialog data stored');
    end
    % 99 101
    dlgStruct.DialogTitle = i_title(obj);
    dlgStruct.DialogTag = i_tag(obj);
    dlgStruct.PreApplyMethod = 'dlgCallback';
    dlgStruct.PreApplyArgs = {'edit','%dialog'};
    dlgStruct.PreApplyArgsDT = {'string','handle'};
    dlgStruct.HelpMethod = 'helpview';
    dlgStruct.HelpArgs = cellhorzcat(horzcat(docroot, '/mapfiles/simulink.map'), 'dependency_editmanifest');
    % 107 111
    % 108 111
    % 109 111
    headerText.Type = 'text';
    headerText.Name = xlate('Edit the list of files in the manifest.');
    headerText.Tag = 'headertext';
    headerText.WordWrap = true;
    headerText.ColSpan = [1.0 4.0];
    headerText.RowSpan = [1.0 1.0];
    % 116 118
    contentsList.Type = 'listbox';
    contentsList.MinimumSize = [400.0 400.0];
    contentsList.Tag = 'contentslist';
    contentsList.ColSpan = [1.0 4.0];
    contentsList.RowSpan = [2.0 2.0];
    contentsList.Entries = dlgdata.ContentsList;
    contentsList = i_control_callback(contentsList, 'contentslist');
    % 124 126
    removeButton.Type = 'pushbutton';
    removeButton.Name = xlate('Remove');
    removeButton.Tag = 'removebutton';
    removeButton.ColSpan = [3.0 3.0];
    removeButton.RowSpan = [3.0 3.0];
    removeButton.MaximumSize = [75.0 25.0];
    removeButton.Enabled = false;
    removeButton = i_control_callback(removeButton, 'remove');
    % 133 135
    addButton.Type = 'pushbutton';
    addButton.Name = xlate('Add...');
    addButton.Tag = 'addbutton';
    addButton.ColSpan = [4.0 4.0];
    addButton.RowSpan = [3.0 3.0];
    addButton.MaximumSize = [65.0 25.0];
    addButton = i_control_callback(addButton, 'add');
    % 141 143
    reportButton.Type = 'pushbutton';
    reportButton.Name = xlate('Show Report');
    reportButton.ToolTip = xlate('Display an HTML report showing the current contents of this manifest');
    % 145 147
    reportButton.ColSpan = [2.0 2.0];
    reportButton.RowSpan = [3.0 3.0];
    reportButton.MaximumSize = [115.0 25.0];
    reportButton = i_control_callback(reportButton, 'report');
    % 150 152
    headerText.UserData = dlgdata;
    % 152 154
    dlgStruct.LayoutGrid = [3.0 4.0];
    dlgStruct.Items = cellhorzcat(headerText, contentsList, removeButton, addButton, reportButton);
    % 155 157
    dlgStruct.StandaloneButtonSet = {'OK','Cancel','Help'};
end
function c = i_control_callback(c, str)
    % 159 163
    % 160 163
    % 161 163
    c.ObjectMethod = 'controlCallback';
    c.MethodArgs = cellhorzcat(horzcat('edit:', str), '%dialog');
    c.ArgDataTypes = {'string','handle'};
end
function i_callback(obj, cbaction, dlg)
    % 167 171
    % 168 171
    % 169 171
    switch cbaction
    case 'contentslist'
        i_listclick(obj, dlg);
    case 'remove'
        i_remove(obj, dlg);
    case 'add'
        i_add(obj, dlg);
    case 'report'
        i_report(obj, dlg);
    otherwise
        error('Unexpected callback action: %s', cbaction);
    end
end
function i_add(obj, dlg)
    % 184 187
    % 185 187
    dlgdata = i_dialog_data(dlg);
    % 187 189
    [f, p] = uigetfile({'*.*','All Files (*.*)'}, xlate('Add File to Manifest'), 'Multiselect', 'on');
    % 189 192
    % 190 192
    if isequal(f, 0.0)
        return
    end
    % 194 196
    f = cellstr(f);
    % 196 198
    for i=1.0:numel(f)
        f{i} = fullfile(p, f{i});
    end % for
    dlgdata.ContentsList = unique(dependencies.cellcat(dlgdata.ContentsList, f));
    % 201 203
    i_dialog_data(dlg, dlgdata);
    dlg.restoreFromSchema();
end
function i_remove(obj, dlg)
    % 206 210
    % 207 210
    % 208 210
    dlgdata = i_dialog_data(dlg);
    sel = dlg.getWidgetValue('contentslist');
    if isempty(sel)
        return
    end
    sel = plus(sel, 1.0);
    % 215 218
    % 216 218
    dlgdata.ContentsList(sel) = [];
    % 218 220
    i_dialog_data(dlg, dlgdata);
    dlg.restoreFromSchema();
end
function i_report(obj, dlg)
    % 223 226
    % 224 226
    newdepset = i_get_result(obj, dlg);
    reportfile = horzcat(tempname, '.html');
    newdepset.Report(reportfile, 'matlabhtml');
    web(reportfile);
end
function i_listclick(obj, dlg)
    % 231 235
    % 232 235
    % 233 235
    sel = dlg.getWidgetValue('contentslist');
    dlg.setEnabled('removebutton', not(isempty(sel)));
end
function newdepset = i_get_result(obj, dlg)
    % 238 241
    % 239 241
    dlgdata = i_dialog_data(dlg);
    depset = dlgdata.DepSet;
    filelist = dlgdata.ContentsList;
    used = false(size(filelist));
    newdepset = repmat(dependencies.MDLDepSet, numel(depset), 1.0);
    for i=1.0:numel(depset)
        % 246 248
        newdepset(i) = dependencies.MDLDepSet;
        % 248 250
        newdepset(i).FileName = depset(i).FileName;
        newdepset(i).Options = depset(i).Options;
        newdepset(i).AnalysisDate = depset(i).AnalysisDate;
        newdepset(i).Toolboxes = depset(i).Toolboxes;
        newdepset(i).AllIncludeDirs = depset(i).AllIncludeDirs;
        newdepset(i).ExcludedDirs = depset(i).ExcludedDirs;
        newdepset(i).ExcludedFiles = depset(i).ExcludedFiles;
        [newdepset(i).AllFiles, used_here] = i_filter_files(depset(i).AllFiles, filelist);
        % 257 259
        newdepset(i).AllReferences = depset(i).AllReferences;
        % 259 261
        newdepset(i).MDLName = depset(i).MDLName;
        newdepset(i).IsModel = depset(i).IsModel;
        % 262 266
        % 263 266
        % 264 266
        newdepset(i).ReferencedModels = depset(i).ReferencedModels;
        newdepset(i).ReferencedModelFiles = depset(i).ReferencedModelFiles;
        newdepset(i).LinkedLibraries = depset(i).LinkedLibraries;
        newdepset(i).LinkedLibraryFiles = depset(i).LinkedLibraryFiles;
        used = or(used, used_here);
    end % for
    % 271 273
    if any(not(used))
        % 273 276
        % 274 276
        unusedlist = filelist(not(used));
        unusedrefs = dependencies.FileReference.Alloc(numel(unusedlist));
        for i=1.0:numel(unusedlist)
            unusedrefs(i) = dependencies.FileReference(unusedlist{i}, 'Added Manually', '');
            % 279 281
        end % for
        unusedlist = dependencies.FileState.Init(unusedlist);
        newdepset(1.0).AllFiles = vertcat(horzcat(newdepset(1.0).AllFiles), unusedlist);
        newdepset(1.0).AllReferences = vertcat(horzcat(newdepset(1.0).AllReferences), unusedrefs);
    end
    % 285 287
    for i=1.0:numel(newdepset)
        newdepset(i).SetReady();
    end % for
end
function [filtered, used] = i_filter_files(oldlist, keeplist)
    % 291 299
    % 292 299
    % 293 299
    % 294 299
    % 295 299
    % 296 299
    % 297 299
    if isempty(oldlist)
        filtered = [];
        used = zeros(size(keeplist));
        return
    end
    oldnames = cellstr(get(oldlist, 'FileName'));
    if ispc
        oldnames = lower(oldnames);
        keeplist = lower(keeplist);
    end
    keep = ismember(oldnames, keeplist);
    used = ismember(keeplist, oldnames);
    filtered = oldlist(keep);
end
function [success, msg] = i_apply(obj, dlg)
    % 313 317
    % 314 317
    % 315 317
    success = false;
    msg = '';
    % 318 320
    dlgdata = i_dialog_data(dlg);
    % 320 322
    result = i_get_result(obj, dlg);
    result.Report(dlgdata.FileName);
    fprintf('Manifest file "%s" written\n', dlgdata.FileName);
    % 324 326
    success = true;
end
function x = i_dialog_data(dlg, x)
    % 328 331
    % 329 331
    persistent p;
    % 331 333
    if gt(nargin, 1.0)
        dependencies.assert(isstruct(x), 'Structure required');
        if not(isempty(dlg))
            dlg.setUserData('headertext', x);
        end
        p = x;
    end
    % 339 341
    if nargout
        if not(isempty(dlg))
            x = dlg.getUserData('headertext');
        else
            x = p;
        end
    end
end
