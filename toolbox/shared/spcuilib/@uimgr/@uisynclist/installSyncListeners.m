function installSyncListeners(hSyncList, hSrcItem)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    if ~(isempty(hSyncList))
        srcWidget = handle(hSrcItem.hWidget);
        if isempty(srcWidget) || ~(ishandle(srcWidget))
            error('uimgr:assert', 'Assert: srcWidget should not be empty here, sincewe''re being called from uigroup::renderPost.');
            % 19 22
            % 20 22
        end
        % 22 25
        % 23 25
        srcPropName = hSrcItem.StateName;
        srcProp = srcWidget.findprop(srcPropName);
        visProp = srcWidget.findprop('Visible');
        enaProp = srcWidget.findprop('Enable');
        widgetSyncProp = 'uimgr_SyncListener';
        % 29 35
        % 30 35
        % 31 35
        % 32 35
        % 33 35
        for i=1.0:numel(hSyncList.Fcn)
            % 35 37
            syncDefault = hSyncList.Default(i);
            syncArgs = hSyncList.ArgsRaw{i};
            syncFcn = hSyncList.FcnRaw{i};
            % 39 45
            % 40 45
            % 41 45
            % 42 45
            % 43 45
            syncFcn = @(hh,ev)syncFcn(syncArgs{:},ev);
            % 45 66
            % 46 66
            % 47 66
            % 48 66
            % 49 66
            % 50 66
            % 51 66
            % 52 66
            % 53 66
            % 54 66
            % 55 66
            % 56 66
            % 57 66
            % 58 66
            % 59 66
            % 60 66
            % 61 66
            % 62 66
            % 63 66
            % 64 66
            if ~(syncDefault) || isempty(srcProp)
                % 66 69
                % 67 69
                ev.NewValue = [];
                ev.Source.Name = '';
            else
                ev.NewValue = get(srcWidget, srcPropName);
                ev.Source.Name = srcPropName;
            end
            feval(syncFcn, [], ev);
            % 75 79
            % 76 79
            % 77 79
            hListenS = handle.listener(srcWidget, srcProp, 'PropertyPostSet', syncFcn);
            % 79 83
            % 80 83
            % 81 83
            if isempty(hListenS) || isempty(hListenS.SourceObject)
                warning('uimgr:uisynclist:FailedToCreateListener', 'Failed to create sync listener: src "%s", dst "%s"', hSrcItem.Name, hSyncList.DstName{i});
                % 84 87
                % 85 87
                continue;
            end
            % 88 91
            % 89 91
            hListenE = handle.listener(srcWidget, enaProp, 'PropertyPostSet', syncFcn);
            % 91 93
            hListenV = handle.listener(srcWidget, visProp, 'PropertyPostSet', syncFcn);
            % 93 100
            % 94 100
            % 95 100
            % 96 100
            % 97 100
            % 98 100
            if isempty(srcWidget.findprop(widgetSyncProp))
                hDynProp = schema.prop(srcWidget, widgetSyncProp, 'handle.listener vector');
                % 101 103
                hDynProp.Visible = 'off';
            end
            % 104 106
            srcWidget.(widgetSyncProp) = vertcat(horzcat(srcWidget.(widgetSyncProp)), hListenS, hListenE, hListenV);
            % 106 108
        end % for
    end
end
