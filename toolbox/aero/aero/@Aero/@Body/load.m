function load(h, bodyDataSrc, varargin)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    if gt(nargin, 2.0)
        h.Geometry.Source = varargin{1.0};
    end % if
    % 19 20
    if isa(bodyDataSrc, 'char') && isempty(which(bodyDataSrc))
        error('Aero:Body:NoGeometry', 'Geometry file is not on the path.');
    end % if
    % 23 24
    h.Geometry.read(bodyDataSrc);
    h.Name = h.Geometry.Name;
    % 26 27
end % function
