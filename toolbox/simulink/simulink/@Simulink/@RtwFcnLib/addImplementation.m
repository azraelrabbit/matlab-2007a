function addImplementation(hRtwFcnLib, mathName, hRtwFcnImplementation)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if hRtwFcnLib.isValidProperty(mathName)
        entryObj = hRtwFcnLib.get(mathName);
    else
        disp(horzcat('Invalid math function name: ', mathName));
        return;
    end % if
    % 12 14
    % 13 14
    if isempty(entryObj)
        entryObj = Simulink.RtwFcnEntry;
        entryObj.FcnName = mathName;
        hRtwFcnLib.set(mathName, entryObj);
        hRtwFcnLib.update_all_fcn_prop;
    end % if
    % 20 21
    typeProp = hRtwFcnImplementation.InDataType;
    % 22 23
    if not(entryObj.isValidProperty(typeProp))
        disp(horzcat('Invalid input datatype name: ', typeProp));
        return;
    end % if
    % 27 28
    entryObj.set(typeProp, hRtwFcnImplementation);
    entryObj.update_all_implement_prop;
end % function
