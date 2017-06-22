function stfTargetSetListener(hObj, hProps)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if not(isempty(hProps))
        % 8 14
        % 9 14
        % 10 14
        % 11 14
        % 12 14
        if isempty(hObj.PreSetListener)
            hObj.PreSetListener = handle.listener(hObj, hProps, 'PropertyPreSet', @preSetFcn_Prop);
            % 15 18
            % 16 18
        end % if
        % 18 20
        getFunctions = hObj.GetFunction;
        if not(isempty(getFunctions))
            for i=1.0:length(getFunctions)
                prop = findprop(hObj, getFunctions(i).prop);
                if not(isempty(prop))
                    try
                        prop.GetFunction = eval(getFunctions(i).fcn);
                    catch
                        disp(horzcat('Get function "', getFunctions(i).fcn, '" cannot be set', ' to property "', prop.Name, '"'));
                        % 28 30
                    end % try
                end % if
            end % for
        end % if
        % 33 35
        setFunctions = hObj.SetFunction;
        if not(isempty(setFunctions))
            for i=1.0:length(setFunctions)
                prop = findprop(hObj, setFunctions(i).prop);
                if not(isempty(prop))
                    try
                        prop.SetFunction = eval(setFunctions(i).fcn);
                    catch
                        disp(horzcat('Set function "', setFunctions(i).fcn, '" cannot be set', ' to property "', prop.Name, '"'));
                        % 43 45
                    end % try
                end % if
            end % for
        end % if
        % 48 50
    end % if
end % function
function preSetFcn_Prop(hProp, eventData)
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    hObj = eventData.AffectedObject;
    if hObj.isActive
        if not(isequal(get(hObj, hProp.Name), eventData.NewVal))
            hMdl = hObj.getModel;
            set_param(hMdl, 'dirty', 'on');
        end % if
    end % if
end % function
