function NotAllowedForPhasorSimulation(Mode, BlockName, Type)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if Mode
        message = horzcat('The following SimPowerSystem block is not allowed with the Phasor simulation method:', char(10.0), 'Block : ', strrep(BlockName, char(10.0), ' '), char(10.0), 'Type  : ', Type);
        % 11 15
        % 12 15
        % 13 15
        % 14 15
        Erreur.message = char(message);
        Erreur.identifier = 'SimPowerSystems:NotAllowedForPhasorSimulation';
        psberror(Erreur);
    end % if
end % function
