function bd = getBlockDiagram(smc)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    bd = smc.up;
    while ~(isempty(bd) || bd.isa('Simulink.BlockDiagram'))
        bd = bd.up;
    end % while
end
