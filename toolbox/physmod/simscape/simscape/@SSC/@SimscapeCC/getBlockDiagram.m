function bd = getBlockDiagram(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    bd = this.up;
    while ~(isempty(bd) || bd.isa('Simulink.ConfigSet'))
        bd = bd.up;
    end % while
    if isa(bd, 'Simulink.ConfigSet')
        bd = bd.getModel;
    end
end
