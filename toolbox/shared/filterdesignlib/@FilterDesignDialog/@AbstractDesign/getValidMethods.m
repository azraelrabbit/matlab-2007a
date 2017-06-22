function validMethods = getValidMethods(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hfdesign = getFDesign(this, this);
    % 9 10
    set(hfdesign, 'Specification', getSpecification(this));
    % 11 12
    validMethods = designmethods(hfdesign, this.ImpulseResponse, 'full');
    % 13 15
    % 14 15
    validMethods = ctranspose(validMethods(:));
end % function
