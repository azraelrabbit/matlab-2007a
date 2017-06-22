function idx = addBody(h, b)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h.initIfNeeded;
    % 9 12
    % 10 12
    % 11 12
    if isempty(b.Geometry.FaceVertexColorData)
        error('Aero:Animation:CantAddEmptyBody', 'Body is empty, run its load method before adding to the Animation');
    else
        b.generatePatches(get(h.Figure, 'CurrentAxes'));
        h.Bodies{plus(end, 1.0)} = b;
    end % if
    % 18 19
    idx = numel(h.Bodies);
    % 20 21
end % function
