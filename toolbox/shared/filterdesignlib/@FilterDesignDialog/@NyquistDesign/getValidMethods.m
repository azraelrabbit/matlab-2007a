function validMethods = getValidMethods(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hfdesign = get(this, 'FDesign');
    % 9 10
    try
        bandvalue = evaluatevars(this.Band);
    catch
        % 13 17
        % 14 17
        % 15 17
        % 16 17
        bandvalue = 3.0;
    end % try
    % 19 20
    set(hfdesign, 'Specification', getSpecification(this), 'Band', bandvalue);
    % 21 22
    validMethods = designmethods(hfdesign, this.ImpulseResponse, 'full');
    % 23 25
    % 24 25
    validMethods = ctranspose(validMethods(:));
end % function
