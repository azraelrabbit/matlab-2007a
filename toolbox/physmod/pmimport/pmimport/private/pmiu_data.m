function VGD = pmiu_data(VGD)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    persistent PMIU_DATA;
    if gt(nargin, 0.0)
        PMIU_DATA = VGD;
    else
        VGD = PMIU_DATA;
    end
end
