function fileName = slbook(varargin)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    if gt(length(varargin), 0.0) && strcmp(varargin{1.0}, '-showdialog')
        if gt(length(varargin), 1.0)
            if ischar(varargin{2.0})
                try
                    sysName = getfullname(varargin{2.0});
                catch
                    error('slbook:InvalidSystemName', 'Simulink system "%s" is not valid', varargin{2.0});
                    % 31 34
                    % 32 34
                end % try
            else
                if isa(varargin{2.0}, 'Stateflow.Object')
                    sysName = get(varargin{2.0}, 'ID');
                else
                    sysName = varargin{2.0};
                end
            end
        else
            sysName = '';
        end
        fileName = launchDialog(sysName);
        return
    end
    [isGUI, guiHandle] = getFlagValue(varargin, '-Dialog');
    [isSys, sysHandle] = getFlagValue(varargin, '-UseSystem');
    [isChart, chartID] = getFlagValue(varargin, '-UseChart');
    if not(isempty(chartID))
        isSys = true;
        chartID = rptgen_sf.id2handle(chartID);
        sysHandle = locChart2System(chartID);
    else
        if isempty(sysHandle)
            isSys = false;
        end
    end
    adRG = rptgen.appdata_rg;
    adRG.HaltGenerate = false;
    if isGUI
        guiHandle.reportStart;
    end
    % 64 66
    rpt = rptgen.loadRpt('slbook');
    if isempty(rpt)
        msg = xlate('Report file "slbook" not found');
        warning('rptgen:FileNotFound', msg);
        fileName = '';
    else
        % 71 73
        setFlagValue(varargin, '-DirectoryName', rpt, 'DirectoryType', 'other');
        setFlagValue(varargin, '-isIncrementFilename', rpt);
        setFlagValue(varargin, '-isDebug', rpt);
        setFlagValue(varargin, '-isView', rpt);
        % 76 81
        % 77 81
        % 78 81
        % 79 81
        mdlLoop = find(rpt, '-depth', 1.0, '-isa', 'rptgen_sl.csl_mdl_loop');
        % 81 87
        % 82 87
        % 83 87
        % 84 87
        % 85 87
        tPage = find(mdlLoop, '-depth', 1.0, '-isa', 'rptgen.cfr_titlepage');
        % 87 91
        % 88 91
        % 89 91
        if isSys
            oldCurrSys = gcs;
            set_param(0.0, 'CurrentSystem', sysHandle);
            set(mdlLoop.LoopList(1.0), 'MdlCurrSys', cellhorzcat(sysHandle));
            rptgen.displayMessage('Setting MdlCurrSys', 1.0);
        end
        % 96 98
        [isMdlLoop, mdlLoopType] = getFlagValue(varargin, '-SysLoopType', 'all');
        if strcmpi(mdlLoopType, 'all') || not(isChart)
            % 99 101
            set(mdlLoop.LoopList(1.0), 'SysLoopType', mdlLoopType);
            setFlagValue(varargin, '-isMask', mdlLoop.LoopList(1.0));
            setFlagValue(varargin, '-isLibrary', mdlLoop.LoopList(1.0));
            % 103 105
            switch lower(mdlLoopType)
            case 'currentbelow'
                set(tPage, 'Subtitle', 'Details for %<gcs> and below');
            case 'current'
                set(tPage, 'Subtitle', 'Details for %<gcs>');
            case 'currentabove'
                set(tPage, 'Subtitle', 'Details for %<gcs> and above');
            otherwise
                % 112 114
            end
        else
            % 115 117
            set(mdlLoop.LoopList(1.0), 'SysLoopType', 'current');
            % 117 119
            chtLoop = find(mdlLoop, '-isa', 'rptgen_sf.csf_chart_loop');
            set(chtLoop, 'RuntimeLoopObjects', chartID);
            % 120 122
            switch lower(mdlLoopType)
            case 'current'
                % 123 126
                % 124 126
                stateLoop = find(chtLoop, '-isa', 'rptgen_sf.csf_state_loop');
                set(stateLoop, 'Depth', 'local');
                set(tPage, 'Subtitle', horzcat('Details for ', sf('FullNameOf', chartID.ID, '/')));
            case 'currentbelow'
                % 129 131
                set(tPage, 'Subtitle', horzcat('Details for ', sf('FullNameOf', chartID.ID, '/'), ' and below'));
                % 131 134
                % 132 134
            end
        end
        % 135 139
        % 136 139
        % 137 139
        if not(adRG.HaltGenerate)
            % 139 141
            fileName = rpt.execute;
        end
        % 142 144
        if isSys
            set_param(0.0, 'CurrentSystem', oldCurrSys);
        end
    end
    % 147 149
    if isGUI
        % 149 151
        guiHandle.reportEnd;
    end
end
function setFlagValue(args, flagName, c, varargin)
    % 154 157
    % 155 157
    [isFoundValue, flagValue] = getFlagValue(args, flagName);
    if isFoundValue
        set(c, flagName(2.0:end), flagValue, varargin{:});
    end
end
function [foundValue, flagValue] = getFlagValue(args, flagName, defaultValue)
    % 162 165
    % 163 165
    foundIdx = find(strcmp(args(1.0:2.0:minus(end, 1.0)), flagName));
    if not(isempty(foundIdx))
        foundValue = true;
        flagValue = args{mtimes(2.0, foundIdx)};
        if isa(flagValue, 'java.lang.String')
            flagValue = char(flagValue);
        end
    else
        foundValue = false;
        if lt(nargin, 3.0)
            flagValue = [];
        else
            flagValue = defaultValue;
        end
    end
end
function guiHandle = launchDialog(sysName)
    % 181 184
    % 182 184
    if isempty(sysName)
        guiHandle = javaObject('com.mathworks.toolbox.rptgencore.gui.SLBookDialog');
        frameify(guiHandle);
        setVisible(guiHandle);
    else
        if ischar(sysName)
            guiHandle = getDialog(sysName);
            sysLoc = get_param(sysName, 'Location');
            % 191 193
            guiHandle.setCurrentSystem(sysName, sysLoc(1.0), sysLoc(2.0));
        else
            if not(isempty(findpackage('Stateflow')))
                sfName = sf('FullNameOf', sysName, '/');
                sfID = sysName;
                sysName = locChart2System(sysName);
                sfObj = find(slroot, 'ID', sfID);
                if not(isempty(findprop(sfObj, 'Editor')))
                    edPos = sfObj.Editor.WindowPosition;
                    oldRootUnits = get(0.0, 'Units');
                    set(0.0, 'Units', 'pixels');
                    pixelSize = get(0.0, 'ScreenSize');
                    set(0.0, 'Units', 'points');
                    pointSize = get(0.0, 'ScreenSize');
                    set(0.0, 'Units', oldRootUnits);
                    edX = mrdivide(mtimes(edPos(1.0), minus(pixelSize(3.0), pixelSize(1.0))), minus(pointSize(3.0), pointSize(1.0)));
                    edY = mrdivide(mtimes(minus(minus(pointSize(4.0), edPos(2.0)), edPos(4.0)), minus(pixelSize(4.0), pixelSize(2.0))), minus(pointSize(4.0), pointSize(2.0)));
                else
                    sysLoc = get_param(sysName, 'Location');
                    edX = sysLoc(1.0);
                    edY = sysLoc(2.0);
                end
                guiHandle = getDialog(sysName);
                guiHandle.setCurrentChart(sfName, sfID, edX, edY);
            else
                warning('slbook:InvalidInput', 'Unrecognized input argument');
                guiHandle = launchDialog([]);
            end
        end
    end
end
function guiHandle = getDialog(sysName)
    mdlName = get_param(bdroot(sysName), 'Object');
    dialogInstanceProp = 'SLBookDialog';
    listenerInstanceProp = 'SLBookDialogListeners';
    eventName = 'CloseEvent';
    % 228 233
    % 229 233
    % 230 233
    % 231 233
    if not(isempty(findprop(mdlName, dialogInstanceProp)))
        guiHandle = get(mdlName, dialogInstanceProp);
    else
        guiHandle = [];
    end
    % 237 239
    if isempty(guiHandle)
        % 239 242
        % 240 242
        guiHandle = javaObject('com.mathworks.toolbox.rptgencore.gui.SLBookDialog');
        guiHandle.frameify;
        % 243 245
        dListener(1.0) = handle.listener(mdlName, eventName, @closeListener);
        % 245 249
        % 246 249
        % 247 249
        if isempty(findprop(mdlName, listenerInstanceProp))
            schema.prop(mdlName, listenerInstanceProp, 'handle vector');
        else
            % 251 253
        end
        set(mdlName, listenerInstanceProp, dListener);
        % 254 256
        if isempty(findprop(mdlName, dialogInstanceProp))
            schema.prop(mdlName, dialogInstanceProp, 'MATLAB array');
        else
            % 258 260
        end
        set(mdlName, dialogInstanceProp, guiHandle);
    end
end
function closeListener(EventSource, EventData)
    % 264 267
    % 265 267
    dialogInstanceProp = 'SLBookDialog';
    listenerInstanceProp = 'SLBookDialogListeners';
    % 268 270
    try
        guiHandle = get(EventSource, dialogInstanceProp);
        doClose(guiHandle);
    catch
        warning('slbook:CloseDialogError', 'Uable to close dialog');
    end % try
    % 275 280
    % 276 280
    % 277 280
    % 278 280
    delete(findprop(EventSource, listenerInstanceProp));
    delete(findprop(EventSource, dialogInstanceProp));
end
function sysHandle = locChart2System(chartID)
    % 283 287
    % 284 287
    % 285 287
    if isempty(chartID)
        sysHandle = '';
    else
        if isnumeric(chartID)
            sysHandle = locChart2System(rptgen_sf.id2handle(chartID));
        else
            if isa(chartID, 'Stateflow.Chart')
                sysHandle = getfullname(chartID.up.up.Handle);
            else
                if isa(chartID, 'Stateflow.Object')
                    sysHandle = locChart2System(chartID.Chart);
                else
                    error('Invalid Stateflow chart identifier');
                end
            end
        end
    end
end
