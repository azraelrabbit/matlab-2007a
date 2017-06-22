function hNewContainer = deep_copy(hOldContainer)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hNewContainer = hOldContainer.copy;
    % 9 11
    % 10 11
    hOldPackages = hOldContainer.Packages;
    hNewPackages = [];
    for i=1.0:length(hOldPackages)
        hNewPackages = vertcat(hNewPackages, horzcat(hOldPackages(i).deep_copy));
    end % for
    hNewContainer.Packages = hNewPackages;
end % function
