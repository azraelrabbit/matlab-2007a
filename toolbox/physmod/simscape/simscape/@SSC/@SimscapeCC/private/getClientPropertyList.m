function plist = getClientPropertyList
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    persistent plist_stored;
    % 9 11
    if isempty(plist_stored)
        % 11 13
        clist = getClientClassList;
        % 13 15
        for aClass=clist
            % 15 17
            try
                eval(horzcat('aPropList=', aClass{1.0}, '.getCCPropertyList;'));
                plist_stored = horzcat(plist_stored, aPropList);
                % 19 22
                % 20 22
            end % try
            % 22 24
        end % for
        % 24 26
    end
    % 26 28
    plist = plist_stored;
end
