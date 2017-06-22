function retStatus = Apply(hThis)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    retStatus = true;
    % 8 10
    try
        % 10 12
        if not(isempty(hThis.Choices))
            % 12 17
            % 13 17
            % 14 17
            % 15 17
            tag = horzcat(hThis.ObjId, '.', hThis.ValueBlkParam, '.Combo');
            dialog = DAStudio.ToolRoot.getOpenDialogs(hThis.BlockHandle.getDialogSource());
            idx = plus(dialog.getWidgetValue(tag), 1.0);
            % 19 24
            % 20 24
            % 21 24
            % 22 24
            if not(isempty(hThis.MapVals))
                pm_assert(eq(numel(hThis.MapVals), numel(hThis.Choices)));
                conditionedVal = hThis.MapVals{idx};
            else
                conditionedVal = hThis.Choices{idx};
            end % if
        else
            % 30 36
            % 31 36
            % 32 36
            % 33 36
            % 34 36
            conditionedVal = hThis.Value;
            % 36 38
        end % if
        % 38 43
        % 39 43
        % 40 43
        % 41 43
        hBlk = pm_getsl_dblhandle(hThis.BlockHandle);
        hThis.setParamCache(hBlk, hThis.ValueBlkParam, conditionedVal);
        retStatus = hThis.applyChildren();
    catch
        % 46 48
        retStatus = false;
    end % try
    % 49 51
