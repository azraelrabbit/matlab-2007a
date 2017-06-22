function dlg = getInternalMemorySectionDialog(hObj, schemaName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    pageName = 'Memory Sections';
    package = hObj.MemSecPackage;
    packageEnabled = not(strcmp(package, '--- None ---'));
    dlg = [];
    % 10 12
    msPackageName = sprintf('Package:');
    msPackageToolTip = sprintf('Select a package (created by sldataclassdesigner\nand cscdesigner) containing Memory Sections');
    % 13 17
    % 14 17
    % 15 17
    msPackageRefreshName = sprintf('Refresh package list');
    msPackageRefreshToolTip = sprintf('Update the Package list by searching the MATLAB path');
    % 18 20
    msFunctionToolTips = cellhorzcat(sprintf('Insert memory sections for functions such as\nInit, Start, and Terminate'), sprintf('Insert memory sections for functions such as the\nStep functions, Run-time init, Derivative, Enable, and Disable'));
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    msDataToolTips = cellhorzcat(sprintf('Insert memory sections for data structures such as\nConstant parameters, Constant block I/0, and Zero representation'), sprintf('Insert memory sections for data structures such as\nRoot inputs and Root outputs'), sprintf('Insert memory sections for data structures such as\nBlock I/0, D-work vectors, Run-time model, and Zero-crossings'), sprintf('Insert memory sections for parameters'));
    % 27 37
    % 28 37
    % 29 37
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    validToolTip = sprintf('Checks that the currently chosen package is on the path\nand that the selected memory sections exist inside it.');
    % 37 41
    % 38 41
    % 39 41
    pkgGroup_Name = sprintf('Package containing memory sections for model data and functions');
    % 41 43
    fcnGroup_Name = sprintf('Memory sections for model functions and subsystem defaults');
    % 43 45
    dataGroup_Name = sprintf('Memory sections for model data and subsystem defaults');
    % 45 48
    % 46 48
    warnMsgOk = sprintf('Package and memory sections found.');
    % 48 50
    noPkgErr1 = sprintf('Package ''%s'' not found.', package);
    noPkgErr2 = sprintf('Make sure this package is on you MATLAB path or select a different package.');
    noPkgErr3 = sprintf('Code generation will error out if this is not resolved.');
    % 52 54
    msMissingErr1 = sprintf('Memory sections not found in package ''%s'':', package);
    msMissingErr2 = sprintf('Choose memory sections that exist within the selected package or choose a different package.');
    % 55 58
    % 56 58
    pkgNoneErr1 = sprintf('Memory sections cannot be used if a package has not been selected.');
    pkgNoneErr2 = sprintf('Set the memory sections to ''Default'' or choose a valid package.');
    % 59 66
    % 60 66
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    tag = 'Tag_ConfigSet_RTW_ERT_';
    % 66 68
    msList = {};
    packageList = getMemSecPackageList(hObj, package, false);
    try
        if packageEnabled
            msList = transpose(processcsc('GetMemorySectionNames', package));
        else
            % 73 75
            msList = {'Default'};
        end % if
        packageFound = true;
    catch
        msList = {'Default'};
        packageFound = false;
    end % try
    % 81 88
    % 82 88
    % 83 88
    % 84 88
    % 85 88
    % 86 88
    ObjectProperty = 'MemSecPackage';
    widget = [];
    widget.ToolTip = msPackageToolTip;
    widget.Type = 'combobox';
    widget.Entries = transpose(packageList);
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    widget.MultiSelect = false;
    widget.Tag = horzcat(tag, ObjectProperty);
    widget.ObjectProperty = ObjectProperty;
    widget.Value = package;
    widget.Enabled = not(hObj.isReadonlyProperty(widget.ObjectProperty));
    % 99 101
    widgetLbl = [];
    widgetLbl.Name = msPackageName;
    widgetLbl.Type = 'text';
    widgetLbl.Tag = horzcat(tag, ObjectProperty, 'Lbl');
    % 104 106
    MemSecPackageWidget = widget;
    MemSecPackageWidget.RowSpan = [1.0 1.0];
    MemSecPackageWidget.ColSpan = [2.0 2.0];
    MemSecPackageWidgetLbl = widgetLbl;
    MemSecPackageWidgetLbl.RowSpan = [1.0 1.0];
    MemSecPackageWidgetLbl.ColSpan = [1.0 1.0];
    % 111 114
    % 112 114
    ObjectProperty = 'MSLoadPackages';
    widget = [];
    widget.ToolTip = msPackageRefreshToolTip;
    widget.Type = 'pushbutton';
    widget.Name = msPackageRefreshName;
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    widget.Tag = horzcat(tag, ObjectProperty);
    widget.ObjectMethod = 'getMemSecPackageList';
    widget.MethodArgs = cellhorzcat(package, true);
    widget.ArgDataTypes = {'string','bool'};
    widget.Enabled = MemSecPackageWidget.Enabled;
    MSLoadPackagesWidget = widget;
    MSLoadPackagesWidget.RowSpan = [1.0 1.0];
    MSLoadPackagesWidget.ColSpan = [3.0 3.0];
    % 128 130
    warnMSMissing = '';
    % 130 132
    msCategories = hObj.MemSecFuncCategories;
    msPrompts = hObj.MemSecFuncPrompts;
    MemSecFuncWidgets = {};
    for idx=1.0:length(msCategories)
        thisProp = msCategories{idx};
        widget = [];
        widgetLbl = [];
        widgetLbl.Name = msPrompts{idx};
        widget.ToolTip = msFunctionToolTips{idx};
        widget.Type = 'combobox';
        widgetLbl.Type = 'text';
        widget.ObjectProperty = thisProp;
        [widget.Entries, warnMSMissing] = get_ms_entries(msList, hObj, widget.ObjectProperty, widgetLbl.Name, warnMSMissing);
        % 144 150
        % 145 150
        % 146 150
        % 147 150
        % 148 150
        widget.Mode = 1.0;
        widget.MultiSelect = false;
        widget.Tag = horzcat(tag, thisProp);
        widgetLbl.Tag = horzcat(tag, thisProp, 'Lbl');
        widget.DialogRefresh = 1.0;
        widget.Enabled = not(hObj.isReadonlyProperty(widget.ObjectProperty));
        widget.RowSpan = horzcat(idx, idx);
        widget.ColSpan = [2.0 2.0];
        widgetLbl.RowSpan = horzcat(idx, idx);
        widgetLbl.ColSpan = [1.0 1.0];
        MemSecFuncWidgets{plus(end, 1.0)} = widgetLbl;
        MemSecFuncWidgets{plus(end, 1.0)} = widget;
    end % for
    % 162 165
    % 163 165
    msCategories = hObj.MemSecDataCategories;
    msPrompts = hObj.MemSecDataPrompts;
    MemSecDataWidgets = {};
    for idx=1.0:length(msCategories)
        thisProp = msCategories{idx};
        widget = [];
        widgetLbl = [];
        widgetLbl.Name = msPrompts{idx};
        widget.ToolTip = msDataToolTips{idx};
        widget.Type = 'combobox';
        widgetLbl.Type = 'text';
        widget.ObjectProperty = thisProp;
        [widget.Entries, warnMSMissing] = get_ms_entries(msList, hObj, widget.ObjectProperty, widgetLbl.Name, warnMSMissing);
        % 177 183
        % 178 183
        % 179 183
        % 180 183
        % 181 183
        widget.Mode = 1.0;
        widget.MultiSelect = false;
        widget.Tag = horzcat(tag, thisProp);
        widgetLbl.Tag = horzcat(tag, thisProp, 'Lbl');
        widget.DialogRefresh = 1.0;
        widget.Enabled = not(hObj.isReadonlyProperty(widget.ObjectProperty));
        widget.RowSpan = horzcat(idx, idx);
        widget.ColSpan = [2.0 2.0];
        widgetLbl.RowSpan = horzcat(idx, idx);
        widgetLbl.ColSpan = [1.0 1.0];
        MemSecDataWidgets{plus(end, 1.0)} = widgetLbl;
        MemSecDataWidgets{plus(end, 1.0)} = widget;
    end % for
    % 195 197
    if not(packageFound)
        warnMsg = sprintf(horzcat('<font color="red">', '<p>', noPkgErr1, '</p>\n\n', '<p>', noPkgErr2, '<br>', noPkgErr3, '</p>', '</font>'));
    else
        % 199 205
        % 200 205
        % 201 205
        % 202 205
        % 203 205
        if not(isempty(warnMSMissing))
            if packageEnabled
                warnMsg = sprintf(horzcat('<font color="red">', '<p>', msMissingErr1, '</p>\n', '<ul>\n', '%s\n', '</ul>\n', '<p>', msMissingErr2, '\n', '<br>', noPkgErr3, '</p>', '</font>'), warnMSMissing);
            else
                % 208 218
                % 209 218
                % 210 218
                % 211 218
                % 212 218
                % 213 218
                % 214 218
                % 215 218
                % 216 218
                % 217 219
                warnMsg = sprintf(horzcat('<font color="red">', '<p>', pkgNoneErr1, '</p>', '<ul>\n', '%s\n', '</ul>\n', '<p>', pkgNoneErr2, '\n', '<br>', noPkgErr3, '</p>', '</font>'), warnMSMissing);
                % 219 230
                % 220 230
                % 221 230
                % 222 230
                % 223 230
                % 224 230
                % 225 230
                % 226 230
                % 227 230
                % 228 230
            end % if
        else
            warnMsg = warnMsgOk;
        end % if
        % 233 235
    end % if
    validResult.Type = 'textbrowser';
    validResult.Tag = horzcat(tag, 'MemSecValidate');
    validResult.Text = warnMsg;
    validResult.Enabled = true;
    validResult.ToolTip = validToolTip;
    % 240 246
    % 241 246
    % 242 246
    % 243 246
    % 244 246
    group = [];
    group.Type = 'group';
    group.Items = cellhorzcat(MemSecPackageWidgetLbl, MemSecPackageWidget, MSLoadPackagesWidget);
    % 248 252
    % 249 252
    % 250 252
    group.Name = pkgGroup_Name;
    group.LayoutGrid = [1.0 3.0];
    group.RowStretch = 1.0;
    group.ColStretch = [0.0 1.0 0.0];
    packageGroup = group;
    % 256 258
    group = [];
    group.Type = 'group';
    group.Items = MemSecFuncWidgets;
    group.Name = fcnGroup_Name;
    group.LayoutGrid = [2.0 2.0];
    group.RowStretch = [0.0 0.0];
    group.ColStretch = [0.0 1.0];
    functionGroup = group;
    % 265 267
    group = [];
    group.Type = 'group';
    group.Items = MemSecDataWidgets;
    group.Name = dataGroup_Name;
    group.LayoutGrid = [5.0 2.0];
    group.RowStretch = [0.0 0.0 0.0 0.0 0.0];
    group.ColStretch = [0.0 1.0];
    dataGroup = group;
    % 274 276
    group = [];
    group.Type = 'group';
    group.Items = cellhorzcat(validResult);
    group.Name = 'Validation results';
    % 279 281
    group.LayoutGrid = [1.0 1.0];
    group.RowStretch = 1.0;
    group.ColStretch = 1.0;
    validGroup = group;
    % 284 287
    % 285 287
    packageGroup.RowSpan = [1.0 1.0];
    packageGroup.ColSpan = [1.0 1.0];
    functionGroup.RowSpan = [2.0 2.0];
    functionGroup.ColSpan = [1.0 1.0];
    dataGroup.RowSpan = [3.0 3.0];
    dataGroup.ColSpan = [1.0 1.0];
    validGroup.RowSpan = [4.0 4.0];
    validGroup.ColSpan = [1.0 2.0];
    % 294 300
    % 295 300
    % 296 300
    % 297 300
    % 298 300
    dlg.Name = pageName;
    dlg.Items = cellhorzcat(packageGroup, functionGroup, dataGroup, validGroup);
    dlg.LayoutGrid = [4.0 1.0];
    dlg.RowStretch = [0.0 0.0 0.0 1.0];
    dlg.ColStretch = 1.0;
    % 304 306
function [msEntries, warntxt] = get_ms_entries(packMSEntries, block, property, widgetName, warntxt)
    % 306 310
    % 307 310
    % 308 310
    value = block.get(property);
    msEntries = packMSEntries;
    if not(any(ismember(packMSEntries, value)))
        warntxt = horzcat(warntxt, sprintf('<li>%s ''%s''</li>\n', widgetName, value));
        % 313 315
        msEntries = horzcat(value, msEntries);
    end % if
