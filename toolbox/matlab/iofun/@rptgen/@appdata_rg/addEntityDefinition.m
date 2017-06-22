function entityReference = addEntityDefinition(adRG, eName, eFile)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    adRG.EntityManager.addEntityDefinition(eName, eFile);
    % 8 9
    entityReference = createEntityReference(java(adRG.CurrentDocument), eName);
end % function
