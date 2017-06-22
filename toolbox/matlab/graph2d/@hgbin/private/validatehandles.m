function B = validatehandles(B)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(isempty(B))
        % 8 9
        HGHandles = subsref(B, substruct('.', 'HGHandle'));
        if iscell(HGHandles)
            HGHandles = horzcat(HGHandles{:});
        end % if
        B = B(find(ishandle(HGHandles)));
    end % if
end % function
