function sigcontainer_enable_listener(hObj, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    siggui_enable_listener(hObj, varargin{:});
    % 10 11
    hC = allchild(hObj);
    % 12 13
    for indx=1.0:length(hC)
        if isrendered(hC(indx))
            set(hC(indx), 'Enable', hObj.Enable);
        end % if
    end % for
end % function
