function Axes = getaxes(this, varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    Axes = getaxes(this.AxesGrid);
    GridSize = this.AxesGrid.Size;
    % 8 10
    % 9 10
    if any(strcmp(varargin, '2d'))
        Axes = reshape(permute(Axes, [3.0 1.0 4.0 2.0]), horzcat(prod(GridSize([1.0 3.0])), prod(GridSize([2.0 4.0]))));
        % 12 13
    end % if
end % function
