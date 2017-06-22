function bd = getBlockDiagram(smc)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    bd = smc.up;
    while ~(isempty(bd) || bd.isa('Simulink.BlockDiagram'))
        bd = bd.up;
    end % while
end
