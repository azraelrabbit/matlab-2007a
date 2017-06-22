function val = get(A, prop)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    switch prop
    case 'Selection'
        val = A.DragObjects.Items;
    case 'MyHGHandle'
        val = get(A.aChild, 'Parent');
    case 'HGHandle'
        val = get(A.aChild, 'Parent');
    case 'MyHandle'
        figHG = get(A.aChild, 'Parent');
        figUD = getscribeobjectdata(figHG);
        try
            val = figUD.HandleStore;
        catch
            % 21 22
            error('MATLAB:get:NoHandle', 'HGOBJ has no handle...');
        end % try
    case 'Figure'
        figHG = get(A.aChild, 'Parent');
        val = figHG;
    case 'IsSelected'
        % 28 29
        val = 0.0;
    otherwise
        figHG = get(A.aChild, 'Parent');
        val = get(figHG, prop);
    end % switch
end % function
