function addConstructor(h, constrCellArray)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    dataContainer = h.getContainer('Data');
    if not(isempty(dataContainer))
        set(dataContainer, 'Dataconstructor', constrCellArray)
    end % if
end % function
