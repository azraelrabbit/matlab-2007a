function [w1x, w1y, g1x, g1y, w2x, w2y, g2x, g2y, satx, saty] = ThreePhaseTransformer2Icon(Winding1Connection, Winding2Connection, SetSaturation)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if le(Winding1Connection, 3.0)
        w1x = [-85.0 -85.0 -97.5 -85.0 -72.5];
        w1y = [-175.0 -159.0 -143.0 -159.0 -143.0];
    end
    if eq(Winding1Connection, 3.0)
        g1x = [-70.0 -55.0 -55.0 -70.0 -70.0 -55.0];
        g1y = [-190.0 -190.0 -160.0 -160.0 -175.0 -175.0];
    else
        g1x = [];
        g1y = [];
    end
    if (eq(Winding1Connection, 4.0)) | (eq(Winding1Connection, 5.0))
        w1x = [-92.0 -67.0 -79.5 -92.0];
        w1y = [-175.0 -175.0 -145.0 -175.0];
    end
    if le(Winding2Connection, 3.0)
        w2x = [80.0 80.0 67.5 80.0 92.5];
        w2y = [-175.0 -159.0 -143.0 -159.0 -143.0];
    end
    if eq(Winding2Connection, 3.0)
        g2x = [95.0 110.0 110.0 95.0 95.0 110.0];
        g2y = [-190.0 -190.0 -160.0 -160.0 -175.0 -175.0];
    else
        g2x = [];
        g2y = [];
    end
    if (eq(Winding2Connection, 4.0)) | (eq(Winding2Connection, 5.0))
        w2x = [62.0 87.0 74.5 62.0];
        w2y = [-175.0 -175.0 -145.0 -175.0];
    end
    if eq(SetSaturation, 1.0)
        satx = [-30.0 -10.0 10.0 30.0];
        saty = [-150.0 -150.0 150.0 150.0];
    else
        satx = [];
        saty = [];
    end
end
