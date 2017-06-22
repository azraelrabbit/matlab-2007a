function initialize(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    import com.mathworks.toolbox.systemtest.viewer.*;
    % 7 10
    % 8 10
    this.Listener_StepActive.Enabled = 'off';
    this.Listener_StepSelection.Enabled = 'off';
    % 11 14
    % 12 14
    if not(isempty(this.Filters))
        this.delfilter(this.Filters);
    end % if
    % 16 19
    % 17 19
    this.updatecache('initialize');
    % 19 22
    % 20 22
    gridSize = this.getGridSize;
    if not(isscalar(gridSize))
        this.filteredindex = true(gridSize);
    else
        this.filteredindex = true(horzcat(gridSize, 1.0));
    end % if
    % 27 30
    % 28 30
    if isscalar(gridSize)
        this.absoluteindex = 1.0:prod(gridSize);
    else
        this.absoluteindex = reshape(1.0:prod(gridSize), gridSize);
    end % if
    % 34 37
    % 35 37
    this.selectedgridpoint = NaN;
    % 37 40
    % 38 40
    this.step_active = 'off';
    this.step_selection = 1.0;
    this.Listener_StepActive.Enabled = 'on';
    this.Listener_StepSelection.Enabled = 'on';
