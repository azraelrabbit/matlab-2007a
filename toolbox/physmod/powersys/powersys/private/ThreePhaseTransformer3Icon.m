function [w1x, w1y, g1x, g1y, w2x, w2y, g2x, g2y, w3x, w3y, g3x, g3y, satx, saty, p] = ThreePhaseTransformer3Icon(Winding1Connection, Winding2Connection, Winding3Connection, SetSaturation)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    ydw1 = Winding1Connection;
    ydw2 = Winding2Connection;
    ydw3 = Winding3Connection;
    % 11 13
    p = 1.0;
    ofst = 0.0;
    if ((eq(ydw1, 1.0)) | (eq(ydw1, 2.0))) | (eq(ydw1, 3.0))
        w1x = [-110.0 -110.0 -122.5 -110.0 -97.5];
        w1y = [40.0 56.0 72.0 56.0 72.0];
    end
    if eq(ydw1, 3.0)
        g1x = plus(minus([0.0 15.0 15.0 0.0 0.0 15.0], mtimes(p, 90.0)), ofst);
        g1y = [30.0 30.0 60.0 60.0 45.0 45.0];
    else
        g1x = [];
        g1y = [];
    end
    if (eq(ydw1, 4.0)) | (eq(ydw1, 5.0))
        w1x = [-92.0 -67.0 -79.5 -92.0];
        w1y = [40.0 40.0 70.0 40.0];
    end
    if (eq(ydw2, 1.0)) | (eq(ydw2, 2.0))
        w2x = [65.0 65.0 52.5 65.0 77.5];
        w2y = [140.0 156.0 172.0 156.0 172.0];
    end
    if eq(ydw2, 2.0)
        g2x = plus(plus([0.0 15.0 15.0 0.0 0.0 15.0], mtimes(p, 80.0)), ofst);
        g2y = [120.0 120.0 150.0 150.0 135.0 135.0];
    else
        g2x = [];
        g2y = [];
    end
    if (eq(ydw2, 3.0)) | (eq(ydw2, 4.0))
        w2x = [62.0 87.0 74.5 62.0];
        w2y = [90.0 90.0 120.0 90.0];
    end
    if ((eq(ydw3, 1.0)) | (eq(ydw3, 2.0))) | (eq(ydw3, 3.0))
        w3x = [65.0 65.0 52.5 65.0 77.5];
        w3y = [-170.0 -154.0 -138.0 -154.0 -138.0];
    end
    if eq(ydw3, 3.0)
        g3x = plus(plus([0.0 15.0 15.0 0.0 0.0 15.0], mtimes(p, 80.0)), ofst);
        g3y = [-190.0 -190.0 -160.0 -160.0 -175.0 -175.0];
    else
        g3x = [];
        g3y = [];
    end
    if (eq(ydw3, 4.0)) | (eq(ydw3, 5.0))
        w3x = [68.0 93.0 80.5 68.0];
        w3y = [-40.0 -40.0 -10.0 -40.0];
    end
    if eq(SetSaturation, 1.0)
        satx = [-50.0 -10.0 10.0 50.0];
        saty = [-160.0 -160.0 160.0 160.0];
    else
        satx = [];
        saty = [];
    end
end
