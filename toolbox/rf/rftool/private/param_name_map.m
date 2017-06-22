function out_str = param_name_map(in_str, flag)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    parameter_name_table = {'Z0','Z0 (ohms)';'PV','Phase Velocity (m/s)';'Loss','Loss (dB/m)';'LineLength','Line Length (m)';'Radius','Radius (m)';'Separation','Separation (m)';'MuR','MuR';'EpsilonR','EpsilonR';'SigmaCond','Conductor Sigma (S/m)';'SigmaDiel','Dielectric Sigma  (S/m)';'Width','Width (m)';'Height','Height (m)';'Thickness','Thickness (m)';'LossTangent','Loss Tangent';'InnerRadius','Inner Radius (m)';'OuterRadius','Outer Radius (m)';'R','R (ohms)';'L','L (H)';'C','C (F)';'StubMode','Stub Mode';'Termination','Termination';'File','File Name';'IntpType','Interpolation';'ConductorWidth','Conductor Width';'SlotWidth','Slot Width';'Freq','Freq (Hz)';'NetworkData','Network Data';'NoiseData','Noise Data';'NonlinearData','Nonlinear Data';'MixerType','Mixer Type';'FLO','LO Frequency (Hz)';'FreqOffset','Phase Noise Frequency Offset (Hz)';'PhaseNoiseLevel','Phase Noise Level (dBc/Hz)';'TimeDelay','Time Delay'};
    % 7 41
    % 8 41
    % 9 41
    % 10 41
    % 11 41
    % 12 41
    % 13 41
    % 14 41
    % 15 41
    % 16 41
    % 17 41
    % 18 41
    % 19 41
    % 20 41
    % 21 41
    % 22 41
    % 23 41
    % 24 41
    % 25 41
    % 26 41
    % 27 41
    % 28 41
    % 29 41
    % 30 41
    % 31 41
    % 32 41
    % 33 41
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    if eq(flag, 1.0)
        idx1 = 1.0;
        idx2 = 2.0;
    else
        idx1 = 2.0;
        idx2 = 1.0;
    end % if
    index = strcmp(in_str, parameter_name_table(:, idx1));
    out_str = parameter_name_table(index, idx2);
end % function
