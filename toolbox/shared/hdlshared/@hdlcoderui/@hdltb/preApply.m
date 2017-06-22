function preApply(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    stim = {};
    % 9 10
    if strcmpi(this.Chirp, 'on')
        stim = {'chirp'};
    end % if
    % 13 14
    if strcmpi(this.Step, 'on')
        stim{plus(end, 1.0)} = 'step';
    end % if
    % 17 18
    if strcmpi(this.Ramp, 'on')
        stim{plus(end, 1.0)} = 'ramp';
    end % if
    % 21 22
    if strcmpi(this.Impulse, 'on')
        stim{plus(end, 1.0)} = 'impulse';
    end % if
    % 25 26
    if strcmpi(this.Noise, 'on')
        stim{plus(end, 1.0)} = 'noise';
    end % if
    % 29 30
    if strcmpi(this.UserDefined, 'on')
        userStim = this.TestBenchUserStimulus;
    else
        userStim = [];
    end % if
    % 35 36
    set(this.CLIProperties, 'TestBenchStimulus', stim, 'TestBenchUserStimulus', userStim);
end % function
