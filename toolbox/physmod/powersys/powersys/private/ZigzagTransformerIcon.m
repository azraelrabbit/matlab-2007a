function [pzx1, pzy1, pzx2, pzy2, pzx3, pzy3, px1, py1, px2, py2, pgx1, pgy1, pgx2, pgy2, pgx3, pgy3, pgx4, pgy4, satx, saty] = ZigzagTransformerIcon(SecondaryVoltage, SecondaryConnection, SetSaturation)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if eq(SecondaryVoltage(2.0), 0.0)
        message = horzcat('In mask of ''', gcb, ''' block:', setstr(10.0), 'Phase shift cannot be zero');
        Erreur.message = message;
        Erreur.identifier = 'SimPowerSystems:BlockParameterError';
        psberror(Erreur);
    end
    if ge(abs(SecondaryVoltage(2.0)), 120.0)
        message = horzcat('In mask of ''', gcb, ''' block:', setstr(10.0), 'Phase shift cannot be larger than or equal to 120 degrees.');
        Erreur.message = message;
        Erreur.identifier = 'SimPowerSystems:BlockParameterError';
        psberror(Erreur);
    end
    if gt(SecondaryVoltage(2.0), 0.0)
        % 20 22
        pzx1 = [34.0 42.0];
        pzy1 = [65.0 59.0];
        pzx2 = [49.0 42.0];
        pzy2 = [37.0 30.0];
        pzx3 = [19.0 19.0];
        pzy3 = [37.0 47.0];
    else
        pzx1 = [26.0 34.0];
        pzy1 = [59.0 65.0];
        pzx2 = [49.0 49.0];
        pzy2 = [37.0 47.0];
        pzx3 = [19.0 26.0];
        pzy3 = [37.0 30.0];
    end
    if ((isequal(SecondaryConnection, 'Y')) | (isequal(SecondaryConnection, 'Yg'))) | (isequal(SecondaryConnection, 'Yn'))
        px1 = [55.0 70.0 70.0];
        py1 = [37.0 50.0 65.0];
        px2 = [70.0 85.0];
        py2 = [50.0 37.0];
    else
        px1 = [60.0 60.0 77.0 60.0];
        py1 = [65.0 35.0 50.0 65.0];
        px2 = [];
        py2 = [];
    end
    if isequal(SecondaryConnection, 'Yg')
        % 47 49
        pgx1 = [70.0 70.0];
        pgy1 = [50.0 40.0];
        pgx2 = [63.0 77.0];
        pgy2 = [40.0 40.0];
        pgx3 = [65.0 75.0];
        pgy3 = [38.0 38.0];
        pgx4 = [67.0 73.0];
        pgy4 = [35.0 35.0];
    else
        pgx1 = [];
        pgy1 = [];
        pgx2 = [];
        pgy2 = [];
        pgx3 = [];
        pgy3 = [];
        pgx4 = [];
        pgy4 = [];
    end
    if eq(SetSaturation, 1.0)
        satx = [35.0 50.0 60.0 75.0];
        saty = [20.0 20.0 80.0 80.0];
    else
        satx = [];
        saty = [];
    end
end
