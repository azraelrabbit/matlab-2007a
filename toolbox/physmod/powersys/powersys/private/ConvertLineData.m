function [DCresistance, Diameter, BundleDiameter, GMRauto, GMRuser, Xa, X, Ytower, Ymin] = ConvertLineData(DCresistance, Diameter, BundleDiameter, GMRauto, GMRuser, Xa, X, Ytower, Ymin, freq, Units)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    cm2inches = .3937008;
    meter2feet = 3.28083;
    km2mile = .6213712;
    switch Units
    case 'metric'
        DCresistance = mtimes(DCresistance, km2mile);
        Diameter = mrdivide(Diameter, cm2inches);
        BundleDiameter = mrdivide(BundleDiameter, cm2inches);
        GMRauto = mrdivide(GMRauto, cm2inches);
        GMRuser = mrdivide(GMRuser, cm2inches);
        Xa = plus(mrdivide(Xa, 1.60934), mtimes(.0014930104926920132, freq));
        X = mrdivide(X, meter2feet);
        Ytower = mrdivide(Ytower, meter2feet);
        Ymin = mrdivide(Ymin, meter2feet);
    case 'english'
        DCresistance = mrdivide(DCresistance, km2mile);
        Diameter = mtimes(Diameter, cm2inches);
        BundleDiameter = mtimes(BundleDiameter, cm2inches);
        GMRauto = mtimes(GMRauto, cm2inches);
        GMRuser = mtimes(GMRuser, cm2inches);
        Xa = mtimes(1.60934, minus(Xa, mtimes(.0014930104926920132, freq)));
        X = mtimes(X, meter2feet);
        Ytower = mtimes(Ytower, meter2feet);
        Ymin = mtimes(Ymin, meter2feet);
    end % switch
end % function
