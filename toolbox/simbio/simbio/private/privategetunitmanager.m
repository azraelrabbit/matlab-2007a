function um = privategetunitmanager
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    persistent unit_manager;
    mlock;
    if isempty(unit_manager)
        % 13 15
        privateloadsbiomodel;
        privateloadunits;
        unit_manager = UnitApp.UnitManager;
    end
    um = unit_manager;
end
