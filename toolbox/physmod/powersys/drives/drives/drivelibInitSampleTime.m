function outputSampleTime = drivelibInitSampleTime(block)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    sys = getfullname(bdroot(block));
    outputSampleTime = [];
    inLibrary = strcmp(get_param(sys, 'BlockDiagramType'), 'library');
    if ~(inLibrary)
        PowerguiInfo = powericon('getPowerguiInfo', sys, 'CheckForPowergui');
        if isempty(PowerguiInfo.BlockName)
            Erreur.message = 'You must include the Powergui block which specifies the discrete simulation time step at the top level of your diagram.';
            Erreur.identifier = 'SimPowerSystems:ElectricDriveBlocks:NoPowerguiBlock';
            powericon('psberror', Erreur);
        end
        if (PowerguiInfo.Continuous) | (PowerguiInfo.Phasor)
            % 24 27
            % 25 27
            set_param(PowerguiInfo.BlockName, 'SimulationMode', 'Discrete');
            % 27 29
            set_param(PowerguiInfo.BlockName, 'SampleTime', '1e-6');
            PowerguiInfo.Ts = 1e-06;
        end
        outputSampleTime = PowerguiInfo.Ts;
        % 32 36
        % 33 36
        % 34 36
        if isstr(outputSampleTime)
            Erreur.message = 'The sample time specified in the Powergui block must be greather than 0.';
            Erreur.identifier = 'SimPowerSystems:ElectricDriveBlocks:InvalidSampleTimeInPowergui';
            powericon('psberror', Erreur);
        else
            if le(outputSampleTime, 0.0)
                Erreur.message = 'The sample time specified in the Powergui block must be greather than 0.';
                Erreur.identifier = 'SimPowerSystems:ElectricDriveBlocks:InvalidSampleTimeInPowergui';
                powericon('psberror', Erreur);
            else
                if isempty(outputSampleTime)
                    Erreur.message = 'The sample time specified in the Powergui block must be greather than 0.';
                    Erreur.identifier = 'SimPowerSystems:ElectricDriveBlocks:InvalidSampleTimeInPowergui';
                    powericon('psberror', Erreur);
                end
            end
        end
    end
end
