function [Rs, Im, J, B, w0, psim, ITBLD, TTBLD, PosSensor, initialw, theta0] = SwitchedReluctanceMotorParam(block, MachineType, MachineModel, PlotCurves, StatorResistance, Inertia, Friction, InitialSpeed, Lq, Ld, Lsat, MaximumCurrent, MaximumFluxLinkage, RotorAngleVector, StatorCurrentVector, MATFILE)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    Rs = StatorResistance;
    Im = MaximumCurrent;
    J = Inertia;
    B = Friction;
    w0 = InitialSpeed(1.0);
    theta0 = InitialSpeed(2.0);
    psim = MaximumFluxLinkage;
    ITBLD = [];
    TTBLD = [];
    % 20 22
    switch MachineType
    case '6/4'
        % 23 25
        PosSensor = 90.0;
        initialw = [0.0 -30.0 -60.0];
        S = .7853981633974483;
        tetai = [0.0 .5 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0 6.5 7.0 7.5 8.0 8.5 9.0 9.5 10.0 10.5 11.0 11.5 12.0 12.5 13.0 13.5 14.0 14.5 15.0 15.5 16.0 16.5 17.0 17.5 18.0 18.5 19.0 19.5 20.0 20.5 21.0 21.5 22.0 22.5 23.0 23.5 24.0 24.5 25.0 25.5 26.0 26.5 27.0 27.5 28.0 28.5 29.0 29.5 30.0 30.5 31.0 31.5 32.0 32.5 33.0 33.5 34.0 34.5 35.0 35.5 36.0 36.5 37.0 37.5 38.0 38.5 39.0 39.5 40.0 40.5 41.0 41.5 42.0 42.5 43.0 43.5 44.0 44.5 45.0];
        PB = 2.0;
    case '8/6'
        % 30 32
        PosSensor = 60.0;
        initialw = [0.0 -15.0 -30.0 -60.0];
        S = .5235987755982988;
        tetai = [0.0 .3333333333333333 .6666666666666666 1.0 1.3333333333333333 1.6666666666666665 2.0 2.333333333333333 2.6666666666666665 3.0 3.333333333333333 3.6666666666666665 4.0 4.333333333333333 4.666666666666666 5.0 5.333333333333333 5.666666666666666 6.0 6.333333333333333 6.666666666666666 7.0 7.333333333333333 7.666666666666666 8.0 8.333333333333332 8.666666666666666 9.0 9.333333333333332 9.666666666666666 10.0 10.333333333333332 10.666666666666666 11.0 11.333333333333332 11.666666666666666 12.0 12.333333333333332 12.666666666666666 13.0 13.333333333333332 13.666666666666666 14.0 14.333333333333332 14.666666666666666 15.0 15.333333333333334 15.666666666666668 16.0 16.333333333333336 16.666666666666668 17.0 17.333333333333336 17.666666666666668 18.0 18.333333333333336 18.666666666666668 19.0 19.333333333333336 19.666666666666668 20.0 20.333333333333336 20.666666666666668 21.0 21.333333333333336 21.666666666666668 22.0 22.333333333333336 22.666666666666668 23.0 23.333333333333336 23.666666666666668 24.0 24.333333333333336 24.666666666666668 25.0 25.333333333333336 25.666666666666668 26.0 26.333333333333332 26.666666666666668 27.0 27.333333333333332 27.666666666666668 28.0 28.333333333333332 28.666666666666668 29.0 29.333333333333332 29.666666666666668 30.0];
        PB = 3.0;
    case '10/8'
        % 37 39
        PosSensor = 45.0;
        initialw = [0.0 -9.0 -18.0 -27.0 -36.0];
        S = .39269908169872414;
        tetai = [0.0 .25 .5 .75 1.0 1.25 1.5 1.75 2.0 2.25 2.5 2.75 3.0 3.25 3.5 3.75 4.0 4.25 4.5 4.75 5.0 5.25 5.5 5.75 6.0 6.25 6.5 6.75 7.0 7.25 7.5 7.75 8.0 8.25 8.5 8.75 9.0 9.25 9.5 9.75 10.0 10.25 10.5 10.75 11.0 11.25 11.5 11.75 12.0 12.25 12.5 12.75 13.0 13.25 13.5 13.75 14.0 14.25 14.5 14.75 15.0 15.25 15.5 15.75 16.0 16.25 16.5 16.75 17.0 17.25 17.5 17.75 18.0 18.25 18.5 18.75 19.0 19.25 19.5 19.75 20.0 20.25 20.5 20.75 21.0 21.25 21.5 21.75 22.0 22.25 22.5];
        PB = 4.0;
    end % switch
    % 44 46
    switch MachineModel
    case 1.0
        % 47 49
        IX = 0.0:mrdivide(MaximumCurrent, 100.0):MaximumCurrent;
        tetaix = 0.0:mrdivide(S, 90.0):S;
        K1 = minus(MaximumFluxLinkage, mtimes(Lsat, MaximumCurrent));
        K2 = mrdivide(minus(Ld, Lsat), K1);
        a = mrdivide(2.0, mpower(S, 3.0));
        b = mrdivide(-3.0, mpower(S, 2.0));
        f = plus(plus(mtimes(a, power(tetaix, 3.0)), mtimes(b, power(tetaix, 2.0))), 1.0);
        fp = plus(mtimes(mtimes(3.0, a), power(tetaix, 2.0)), mtimes(mtimes(2.0, b), tetaix));
        psix = [];
        torque = [];
        itbl = [];
        % 59 61
        for k=1.0:91.0
            psitmp = plus(mtimes(Lq, IX), mtimes(f(k), plus(mtimes(minus(Lsat, Lq), IX), mtimes(K1, minus(1.0, exp(mtimes(uminus(K2), IX)))))));
            psix = vertcat(psix, psitmp);
        end % for
        % 64 66
        if strcmp(PlotCurves, 'on')
            plot(IX, psix(1.0:10.0:91.0, :))
            grid
            title('Generic model - Magnetization characteristics')
            xlabel('Current , A')
            ylabel('Flux linkage , Wb')
            % 71 74
            % 72 74
        end % if
        % 74 76
        for k=1.0:91.0
            torquetmp = mtimes(fp(k), plus(mtimes(mtimes(.5, minus(Lsat, Lq)), power(IX, 2.0)), mtimes(K1, plus(IX, mtimes(K2, minus(exp(mtimes(uminus(K2), IX)), 1.0))))));
            torque = vertcat(torque, torquetmp);
        end % for
        % 79 81
        fx = 0.0:mrdivide(MaximumFluxLinkage, 100.0):MaximumFluxLinkage;
        % 81 83
        for k=1.0:91.0
            fo = psix(k, :);
            itmp = interp1(fo, IX, fx, 'linear', 'extrap');
            itbl = vertcat(itbl, itmp);
        end % for
        % 87 89
        ITBLD = vertcat(itbl, itbl(90.0:-1.0:1.0, :));
        TTBLD = vertcat(torque, uminus(torque(90.0:-1.0:1.0, :)));
    case 2.0
        % 91 94
        % 92 94
        if not(exist(MATFILE, 'file'))
            message = horzcat('In mask of ''', block, ''' block:', char(10.0), 'The MAT file ''', MATFILE, ''' does not exist.');
            % 95 97
            Erreur.message = message;
            Erreur.identifier = 'SimPowerSystems:BlockParameterError';
            psberror(Erreur);
        end % if
        % 100 102
        load(MATFILE);
        % 102 105
        % 103 105
        try
            MagnetisationCharacteristic = FTBL;
        catch
            message = horzcat('In mask of ''', block, ''' block:', char(10.0), 'The MAT file ''', MATFILE, ''' does not contain the variable ''FTBL''.');
            % 108 110
            Erreur.message = message;
            Erreur.identifier = 'SimPowerSystems:BlockParameterError';
            psberror(Erreur);
        end % try
        % 113 116
        % 114 116
        [N, M] = size(MagnetisationCharacteristic);
        if ne(length(RotorAngleVector), M)
            message = horzcat('In mask of ''', block, ''' block:', char(10.0), 'The dimension of the ''FTBL'' variable stored in the MAT file does not match the number of elements of the Rotor angle vector.');
            % 118 120
            Erreur.message = message;
            Erreur.identifier = 'SimPowerSystems:BlockParameterError';
            psberror(Erreur);
        end % if
        if ne(length(StatorCurrentVector), N)
            message = horzcat('In mask of ''', block, ''' block:', char(10.0), 'The dimension of the ''FTBL'' variable stored in the MAT file does not match the number of elements of the Stator current vector');
            % 125 127
            Erreur.message = message;
            Erreur.identifier = 'SimPowerSystems:BlockParameterError';
            psberror(Erreur);
        end % if
        % 130 132
        MaximumFluxLinkage = max(MagnetisationCharacteristic(:, 1.0));
        MaximumCurrent = max(StatorCurrentVector);
        II = 0.0:mrdivide(MaximumCurrent, 100.0):MaximumCurrent;
        FIY = [];
        % 135 137
        for k=1.0:N
            FTMP = MagnetisationCharacteristic(k, :);
            FTI = spline(RotorAngleVector, horzcat(0.0, FTMP, 0.0), tetai);
            FIY = vertcat(FIY, FTI);
        end % for
        % 141 143
        FIYX = interp1(StatorCurrentVector, FIY, II, 'cubic');
        flux = ctranspose(FIYX);
        % 144 146
        if strcmp(PlotCurves, 'on')
            plot(II, flux(1.0:10.0:91.0, :))
            grid
            title('Specific model - Magnetization characteristics')
            xlabel('Current , A')
            ylabel('Flux linkage , Wb')
            % 151 154
            % 152 154
        end % if
        % 154 156
        ITBL = [];
        MaximumFluxLinkage = max(flux(1.0, :));
        fx = 0.0:mrdivide(MaximumFluxLinkage, 100.0):MaximumFluxLinkage;
        % 158 160
        for k=1.0:91.0
            fo = flux(k, :);
            itmp = interp1(fo, II, fx, 'linear', 'extrap');
            ITBL = vertcat(ITBL, itmp);
        end % for
        % 164 166
        ITBLD = vertcat(ITBL, ITBL(90.0:-1.0:1.0, :));
        % 166 168
        for k=1.0:91.0
            clear('FT', 'StatorCurrentVector', 'WC', 'Fx', 'Ix', 'W')
            FT = flux(k, :);
            IX = 0.0:mrdivide(MaximumCurrent, 100.0):MaximumCurrent;
            for i=2.0:101.0
                Fx = FT(1.0:i);
                Ix = IX(1.0:i);
                W = trapz(Ix, Fx);
                WC(i) = W;
            end % for
            WTBL(k, :) = WC;
        end % for
        % 179 181
        TTBL = mtimes(diff(WTBL), mrdivide(mtimes(180.0, PB), 3.141592653589793));
        TTBL = vertcat(TTBL, zeros(1.0, 101.0));
        TTBLD = vertcat(TTBL, uminus(TTBL(90.0:-1.0:1.0, :)));
    end % switch
