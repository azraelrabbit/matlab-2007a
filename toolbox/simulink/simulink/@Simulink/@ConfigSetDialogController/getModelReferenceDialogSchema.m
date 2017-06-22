function dlgstruct = getModelReferenceDialogSchema(h, schemaName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    dlgstruct = i_CreateBasicStructure(schemaName, h);
end
function dlg = i_CreateBasicStructure(name, h)
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    persistent fArtAlgLoop;
    if isempty(fArtAlgLoop)
        fArtAlgLoop = slfeature('ArtificialAlgebraicLoop');
    end
    % 22 24
    persistent fmdlrefBuildButtons;
    if isempty(fmdlrefBuildButtons)
        fmdlrefBuildButtons = slfeature('ModelReferenceBuildButtons');
    end
    % 27 29
    tag = 'Tag_ConfigSet_ModelReferencing_';
    widgetId = 'Simulink.ModelReferenceCC.';
    % 30 32
    hSrc = h.getSourceObject;
    % 32 43
    % 33 43
    % 34 43
    % 35 43
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    updateModelRefLbl.Name = 'Rebuild options:';
    updateModelRefToolTip = sprintf('Specify options for rebuilding models referenced by this model.');
    % 44 47
    % 45 47
    modelRefWarnLbl.Name = 'Never rebuild targets diagnostic:';
    modelRefWarnToolTip = sprintf('Detect out of date models when ''Rebuild Options''\nis set to ''Never rebuild targets''.');
    % 48 52
    % 49 52
    % 50 52
    modelRefNumInstLbl.Name = 'Total number of instances allowed per top model:';
    modelRefNumInstToolTip = sprintf('Specify the number of times this model can be referenced directly or\nindirectly by another model. Allowing multiple references decreases\nthe efficiency of code generated from this model.');
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    mdlDeps.Name = 'Model dependencies:';
    mdlDeps.ToolTip = sprintf('Specify other files on which this model depends (e.g., MAT-files).  Changes\nin these dependencies can trigger rebuilding of this model.');
    % 59 63
    % 60 63
    % 61 63
    modelRefPassByRef.Name = 'Pass scalar root inputs by value';
    modelRefPassByRef.ToolTip = sprintf('Control whether scalar root inputs are passed by value\nor reference to the referenced model''s target.  Selecting\nthis option increases the efficiency of code generated\nfrom this model.');
    % 64 70
    % 65 70
    % 66 70
    % 67 70
    % 68 70
    modelRefMinAlgLoopOccurrences.Name = 'Minimize algebraic loop occurrences';
    modelRefMinAlgLoopOccurrences.ToolTip = sprintf('Attempt to eliminate algebraic loops involving references to this model.\nSelecting this option decreases the efficiency of code generated\nfrom this model.');
    % 71 77
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    modelRefUpdate.Name = 'Build Simulation Target';
    modelRefUpdate.ToolTip = sprintf('Build a Simulation target for this model if the existing\nSimulation target is out of date or it does not exist.');
    % 78 82
    % 79 82
    % 80 82
    modelRefRTWUpdate.Name = 'Build Real-Time Workshop Target';
    modelRefRTWUpdate.ToolTip = sprintf('Build an Real-Time Workshop target for this model if the existing\nReal-Time Workshop target is out of date or it does not exist.');
    % 83 87
    % 84 87
    % 85 87
    modelRefNumInst_Entries = {'Zero','One','Multiple'};
    % 87 89
    updateModelRef.Entries = {'Always','If any changes detected','If any changes in known dependencies detected','Never'};
    % 89 94
    % 90 94
    % 91 94
    % 92 94
    pageName = 'Model Referencing';
    % 94 101
    % 95 101
    % 96 101
    % 97 101
    % 98 101
    % 99 101
    updateModelRef.Name = '';
    updateModelRef.Type = 'combobox';
    updateModelRef.Values = [0.0 1.0 2.0 3.0];
    updateModelRef.RowSpan = [1.0 1.0];
    updateModelRef.ColSpan = [2.0 2.0];
    updateModelRef.DialogRefresh = 1.0;
    updateModelRef.Mode = 1.0;
    updateModelRef.ObjectProperty = 'UpdateModelReferenceTargets';
    updateModelRef.Enabled = double(not(hSrc.isReadonlyProperty(updateModelRef.ObjectProperty)));
    updateModelRef.Tag = horzcat(tag, updateModelRef.ObjectProperty);
    updateModelRef.WidgetId = horzcat(widgetId, updateModelRef.ObjectProperty);
    updateModelRef.ToolTip = updateModelRefToolTip;
    % 112 114
    if isstudent
        updateModelRef.Enabled = 0.0;
    end
    % 116 118
    updateModelRefLbl.Type = 'text';
    updateModelRefLbl.RowSpan = [1.0 1.0];
    updateModelRefLbl.ColSpan = [1.0 1.0];
    updateModelRefLbl.ToolTip = updateModelRefToolTip;
    updateModelRefLbl.Tag = horzcat(tag, updateModelRefLbl.Name);
    updateModelRefLbl.WidgetId = updateModelRef.WidgetId;
    updateModelRefLbl.Buddy = updateModelRef.Tag;
    % 124 129
    % 125 129
    % 126 129
    % 127 129
    modelRefWarn.Name = '';
    modelRefWarn.Type = 'combobox';
    modelRefWarn.Entries = {'None','Warn if targets require rebuild','Error if targets require rebuild'};
    % 131 134
    % 132 134
    modelRefWarn.Values = [0.0 1.0 2.0];
    modelRefWarn.RowSpan = [2.0 2.0];
    modelRefWarn.ColSpan = [2.0 2.0];
    modelRefWarn.ObjectProperty = 'CheckModelReferenceTargetMessage';
    modelRefWarn.Visible = strcmpi(hSrc.UpdateModelReferenceTarget, 'AssumeUpToDate');
    modelRefWarn.Enabled = not(hSrc.isReadonlyProperty(modelRefWarn.ObjectProperty));
    modelRefWarn.Tag = horzcat(tag, modelRefWarn.ObjectProperty);
    modelRefWarn.WidgetId = horzcat(widgetId, modelRefWarn.ObjectProperty);
    modelRefWarn.ToolTip = modelRefWarnToolTip;
    modelRefWarn.Mode = 1.0;
    if isstudent
        modelRefWarn.Enabled = 0.0;
    end
    % 146 148
    modelRefWarnLbl.Type = 'text';
    modelRefWarnLbl.RowSpan = [2.0 2.0];
    modelRefWarnLbl.ColSpan = [1.0 1.0];
    modelRefWarnLbl.ToolTip = modelRefWarnToolTip;
    modelRefWarnLbl.Visible = strcmpi(hSrc.UpdateModelReferenceTarget, 'AssumeUpToDate');
    modelRefWarnLbl.Tag = horzcat(tag, modelRefWarnLbl.Name);
    modelRefWarnLbl.WidgetId = modelRefWarn.WidgetId;
    modelRefWarnLbl.Buddy = modelRefWarn.Tag;
    % 155 161
    % 156 161
    % 157 161
    % 158 161
    % 159 161
    imp.Name = 'Rebuild options for all referenced models';
    imp.Type = 'group';
    imp.RowSpan = [1.0 1.0];
    imp.ColSpan = [1.0 1.0];
    imp.Items = cellhorzcat(updateModelRefLbl, updateModelRef, modelRefWarnLbl, modelRefWarn);
    imp.LayoutGrid = [2.0 2.0];
    % 166 175
    % 167 175
    % 168 175
    % 169 175
    % 170 175
    % 171 175
    % 172 175
    % 173 175
    modelRefNumInst.Name = '';
    modelRefNumInst.Type = 'combobox';
    modelRefNumInst.Entries = modelRefNumInst_Entries;
    modelRefNumInst.RowSpan = [1.0 1.0];
    modelRefNumInst.ColSpan = [2.0 2.0];
    modelRefNumInst.ObjectProperty = 'ModelReferenceNumInstancesAllowed';
    modelRefNumInst.Enabled = double(not(hSrc.isReadonlyProperty(modelRefNumInst.ObjectProperty)));
    % 181 183
    modelRefNumInst.Values = [0.0 1.0 -2.0];
    modelRefNumInst.DialogRefresh = 1.0;
    modelRefNumInst.Mode = 1.0;
    modelRefNumInst.Tag = horzcat(tag, modelRefNumInst.ObjectProperty);
    modelRefNumInst.WidgetId = horzcat(widgetId, modelRefNumInst.ObjectProperty);
    modelRefNumInst.ToolTip = modelRefNumInstToolTip;
    if isstudent
        modelRefNumInst.Enabled = 0.0;
    end
    % 191 193
    modelRefNumInstLbl.Type = 'text';
    modelRefNumInstLbl.RowSpan = [1.0 1.0];
    modelRefNumInstLbl.ColSpan = [1.0 1.0];
    modelRefNumInstLbl.ToolTip = modelRefNumInstToolTip;
    modelRefNumInstLbl.Tag = horzcat(tag, modelRefNumInstLbl.Name);
    modelRefNumInstLbl.WidgetId = modelRefNumInst.WidgetId;
    modelRefNumInstLbl.Buddy = modelRefNumInst.Tag;
    % 199 203
    % 200 203
    % 201 203
    ObjectProperty = 'ModelDependencies';
    mdlDeps.Type = 'editarea';
    mdlDeps.RowSpan = [2.0 2.0];
    mdlDeps.ColSpan = [1.0 2.0];
    mdlDeps.MinimumSize = [100.0 200.0];
    mdlDeps.Tag = horzcat(tag, ObjectProperty);
    mdlDeps.WidgetId = horzcat(widgetId, ObjectProperty);
    mdlDeps.Value = slprivate('mdlRefDepsComment', h, false, mdlDeps.Tag, '');
    if strcmpi(hSrc.ModelReferenceNumInstances, 'Zero')
        mdlDeps.Enabled = 0.0;
    else
        mdlDeps.Enabled = not(hSrc.isReadonlyProperty(ObjectProperty));
    end
    if isstudent
        mdlDeps.Enabled = 0.0;
    end
    mdlDeps.Mode = 1.0;
    % 219 222
    % 220 222
    ObjectProperty = 'ModelReferencePassRootInputsByReference';
    modelRefPassByRef.Type = 'checkbox';
    modelRefPassByRef.Value = double(strcmp(get(hSrc, ObjectProperty), 'off'));
    modelRefPassByRef.RowSpan = [3.0 3.0];
    modelRefPassByRef.ColSpan = [1.0 1.0];
    modelRefPassByRef.Source = h;
    modelRefPassByRef.ObjectMethod = 'dialogCallback';
    modelRefPassByRef.Tag = horzcat(tag, ObjectProperty);
    modelRefPassByRef.WidgetId = horzcat(widgetId, ObjectProperty);
    modelRefPassByRef.MethodArgs = cellhorzcat('%dialog', modelRefPassByRef.Tag, '');
    modelRefPassByRef.ArgDataTypes = {'handle','string','string'};
    if strcmpi(hSrc.ModelReferenceNumInstances, 'Zero')
        modelRefPassByRef.Enabled = 0.0;
    else
        modelRefPassByRef.Enabled = not(hSrc.isReadonlyProperty(ObjectProperty));
    end
    if isstudent
        modelRefPassByRef.Enabled = 0.0;
    end
    modelRefPassByRef.UserData.ObjectProperty = ObjectProperty;
    modelRefPassByRef.Mode = 1.0;
    % 242 245
    % 243 245
    ObjectProperty = 'ModelReferenceMinAlgLoopOccurrences';
    modelRefMinAlgLoopOccurrences.Type = 'checkbox';
    modelRefMinAlgLoopOccurrences.ObjectProperty = ObjectProperty;
    modelRefMinAlgLoopOccurrences.Tag = horzcat(tag, ObjectProperty);
    modelRefMinAlgLoopOccurrences.WidgetId = horzcat(widgetId, ObjectProperty);
    modelRefMinAlgLoopOccurrences.RowSpan = [5.0 5.0];
    modelRefMinAlgLoopOccurrences.ColSpan = [1.0 1.0];
    if strcmpi(hSrc.ModelReferenceNumInstances, 'Zero') || eq(fArtAlgLoop, 2.0)
        % 252 254
        modelRefMinAlgLoopOccurrences.Enabled = 0.0;
    else
        modelRefMinAlgLoopOccurrences.Enabled = not(hSrc.isReadonlyProperty(ObjectProperty));
    end
    if isstudent
        modelRefMinAlgLoopOccurrences.Enabled = 0.0;
    end
    modelRefMinAlgLoopOccurrences.Visible = ne(fArtAlgLoop, 0.0);
    modelRefMinAlgLoopOccurrences.Mode = 1.0;
    % 262 267
    % 263 267
    % 264 267
    % 265 267
    exp.Name = 'Options for referencing this model';
    exp.Type = 'group';
    exp.Items = cellhorzcat(modelRefNumInstLbl, modelRefNumInst, mdlDeps, modelRefPassByRef, modelRefMinAlgLoopOccurrences);
    % 269 271
    exp.RowSpan = [2.0 2.0];
    exp.ColSpan = [1.0 1.0];
    exp.RowStretch = [0.0 1.0 0.0];
    exp.LayoutGrid = [3.0 2.0];
    % 274 276
    if fmdlrefBuildButtons
        % 276 281
        % 277 281
        % 278 281
        % 279 281
        spacer.Type = 'panel';
        spacer.RowSpan = [1.0 1.0];
        spacer.ColSpan = [1.0 1.0];
        % 283 286
        % 284 286
        modelRefUpdate.Type = 'pushbutton';
        modelRefUpdate.MaximumSize = [150.0 25.0];
        modelRefUpdate.MatlabMethod = 'slbuild';
        if isempty(hSrc.getModel)
            model = [];
            modelRefUpdate.Enabled = 0.0;
        else
            model = hSrc.getModel;
            if strcmp(get_param(model, 'SimulationStatus'), 'stopped')
                modelRefUpdate.Enabled = 1.0;
            else
                modelRefUpdate.Enabled = 0.0;
            end
        end
        if isObjectLocked(hSrc)
            modelRefUpdate.Enabled = 0.0;
        end
        modelRefUpdate.MatlabArgs = cellhorzcat(model, 'ModelReferenceTarget', 'OkayToPushNags', true, 'OkayToThrowError', false, 'ModelReferenceTargetType', 'SIM', 'UpdateTopModelReferenceTarget', true);
        % 303 307
        % 304 307
        % 305 307
        modelRefUpdate.DialogRefresh = 1.0;
        modelRefUpdate.RowSpan = [1.0 1.0];
        modelRefUpdate.ColSpan = [2.0 2.0];
        if strcmpi(hSrc.ModelReferenceNumInstances, 'Zero')
            modelRefUpdate.Enabled = 0.0;
        else
            modelRefUpdate.Enabled = not(hSrc.isObjectLocked);
        end
        modelRefUpdate.Tag = horzcat(tag, 'BuildSIM');
        modelRefUpdate.WidgetId = horzcat(widgetId, 'BuildSIM');
        % 316 318
        if isstudent
            modelRefUpdate.Enabled = 0.0;
        end
        % 320 322
        if license('test', 'Real-Time_Workshop')
            % 322 324
            modelRefRTWUpdate.Type = 'pushbutton';
            modelRefRTWUpdate.MaximumSize = [150.0 25.0];
            modelRefRTWUpdate.MatlabMethod = 'slbuild';
            if isempty(hSrc.getModel)
                model = [];
                modelRefRTWUpdate.Enabled = 0.0;
            else
                model = hSrc.getModel;
                if strcmp(get_param(model, 'SimulationStatus'), 'stopped')
                    modelRefRTWUpdate.Enabled = not(hSrc.isObjectLocked);
                else
                    modelRefRTWUpdate.Enabled = 0.0;
                end
            end
            if isObjectLocked(hSrc)
                modelRefRTWUpdate.Enabled = 0.0;
            end
            modelRefRTWUpdate.MatlabArgs = cellhorzcat(model, 'ModelReferenceTarget', 'OkayToPushNags', true, 'OkayToThrowError', false, 'ModelReferenceTargetType', 'RTW', 'UpdateTopModelReferenceTarget', true);
            % 341 345
            % 342 345
            % 343 345
            modelRefRTWUpdate.DialogRefresh = 1.0;
            modelRefRTWUpdate.RowSpan = [1.0 1.0];
            modelRefRTWUpdate.ColSpan = [3.0 3.0];
            if strcmpi(hSrc.ModelReferenceNumInstances, 'Zero')
                modelRefRTWUpdate.Enabled = 0.0;
            else
                modelRefRTWUpdate.Enabled = not(hSrc.isObjectLocked);
            end
            % 352 354
            modelRefRTWUpdate.Tag = horzcat(tag, 'BuildRTW');
            modelRefRTWUpdate.WidgetId = horzcat(widgetId, 'BuildRTW');
            % 355 357
            if isstudent
                modelRefRTWUpdate.Enabled = 0.0;
            end
        end
        % 360 366
        % 361 366
        % 362 366
        % 363 366
        % 364 366
        if license('test', 'Real-Time_Workshop')
            btns.Type = 'panel';
            btns.RowSpan = [4.0 4.0];
            btns.ColSpan = [1.0 1.0];
            btns.LayoutGrid = [1.0 3.0];
            btns.ColStretch = [1.0 0.0 0.0];
            btns.Items = cellhorzcat(spacer, modelRefUpdate, modelRefRTWUpdate);
        else
            btns.Type = 'panel';
            btns.RowSpan = [4.0 4.0];
            btns.ColSpan = [1.0 1.0];
            btns.LayoutGrid = [1.0 2.0];
            btns.ColStretch = [1.0 0.0];
            btns.Items = cellhorzcat(spacer, modelRefUpdate);
        end
    end
    % 381 388
    % 382 388
    % 383 388
    % 384 388
    % 385 388
    % 386 388
    panel.Name = '';
    panel.Type = 'panel';
    if fmdlrefBuildButtons
        panel.Items = cellhorzcat(imp, exp, btns);
    else
        panel.Items = cellhorzcat(imp, exp);
    end
    panel.LayoutGrid = [3.0 1.0];
    panel.RowStretch = [0.0 1.0 0.0];
    % 396 399
    % 397 399
    if strcmp(name, 'list')
        dlg.List = cellhorzcat(pageName);
        dlg.Item = panel;
    else
        if strcmp(name, 'tab')
            dlg.Name = pageName;
            dlg.Items = cellhorzcat(panel);
        else
            if strcmp(name, 'stack')
                panel.Source = hSrc;
                dlg.List = cellhorzcat(pageName);
                dlg.Items = cellhorzcat(panel);
                dlg.Ids = {[0.0]};
            else
                dlg.DialogTitle = pageName;
                dlg.PreApplyCallback = 'slprivate';
                dlg.PreApplyArgs = cellhorzcat('configDlgAction', '%dialog', h, 'apply', 'ModelReference');
                dlg.Items = cellhorzcat(panel);
                dlg.HelpMethod = 'slprivate';
                dlg.HelpArgs = cellhorzcat('configHelp', '%dialog', h, name, pageName);
            end
        end
    end
end
