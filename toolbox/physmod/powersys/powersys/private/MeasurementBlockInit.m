function MeasurementBlockInit(block)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    switch get_param(block, 'MaskType')
    case 'MultimeterPSB'
        % 9 12
        % 10 12
        try
            get_param(horzcat(block, '/multimeter'), 'Name');
        catch
            % 14 16
            % 15 17
            return
        end % try
        DynamicModel = 'multimeter';
        NewDefaultModel = 'multimeter';
    case 'Three-Phase VI Measurement'
        % 21 23
        DynamicModel = 'model';
        NewDefaultModel = 'multimeter';
    otherwise
        % 25 27
        DynamicModel = 'model';
        NewDefaultModel = 'Measurement';
    end
    % 29 31
    PhasorSimulation = strcmp('on', get_param(block, 'PhasorSimulation'));
    DefaultModel = not(isempty(findstr(get_param(horzcat(block, '/', DynamicModel), 'ReferenceBlock'), 'Continuous')));
    RealImagModel = not(isempty(findstr(get_param(horzcat(block, '/', DynamicModel), 'ReferenceBlock'), 'RealImag')));
    MagnitudeAngleModel = not(isempty(findstr(get_param(horzcat(block, '/', DynamicModel), 'ReferenceBlock'), 'MagnitudeAngle')));
    MagnitudeModel = not(isempty(findstr(get_param(horzcat(block, '/', DynamicModel), 'ReferenceBlock'), 'Amplitude')));
    % 35 37
    OutputType = get_param(block, 'OutputType');
    switch OutputType
    case 'Complex'
        % 39 41
        if not(DefaultModel)
            load_system('powerlib_models');
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', DynamicModel, horzcat('powerlib_models/Continuous/', NewDefaultModel), 'noprompt');
        end
    case {'Real-Imag','Real_Imag'}
        if PhasorSimulation && not(RealImagModel)
            load_system('powerlib_models');
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', DynamicModel, 'powerlib_models/Phasors/Measurement_RealImag', 'noprompt');
        else
            if not(PhasorSimulation) && not(DefaultModel)
                load_system('powerlib_models');
                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', DynamicModel, horzcat('powerlib_models/Continuous/', NewDefaultModel), 'noprompt');
            end
        end
    case {'Magnitude-Angle','Magnitude-angle'}
        if PhasorSimulation && not(MagnitudeAngleModel)
            load_system('powerlib_models');
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', DynamicModel, 'powerlib_models/Phasors/Measurement_MagnitudeAngle', 'noprompt');
        else
            if not(PhasorSimulation) && not(DefaultModel)
                load_system('powerlib_models');
                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', DynamicModel, horzcat('powerlib_models/Continuous/', NewDefaultModel), 'noprompt');
            end
        end
    case 'Magnitude'
        if PhasorSimulation && not(MagnitudeModel)
            load_system('powerlib_models');
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', DynamicModel, 'powerlib_models/Phasors/Measurement_Amplitude', 'noprompt');
        else
            if not(PhasorSimulation) && not(DefaultModel)
                load_system('powerlib_models');
                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', DynamicModel, horzcat('powerlib_models/Continuous/', NewDefaultModel), 'noprompt');
            end
        end
    end
end
